import Foundation

actor DefaultLocationDataProcessor: LocationDataProcessing {
    private let logger: Logging
    private var config: LocationTrackingConfig
    private var calibrationManager: GPSCalibrationManager
    private let courseValidator: CourseValidator

    // Anchors flow through the setXxx helpers so every change emits anchor-change.
    private var lastAcceptedLocation: LocationData?
    private var lastEmittedLocation: LocationData?
    private var secondLastEmittedLocation: LocationData?
    private var smoothedLat: Double?
    private var smoothedLon: Double?
    private var lastAcceptedTimestamp: TimeInterval = 0
    private var trackingStartTime: TimeInterval?
    private var lastValidGpsWallTime: Date?
    private var isPostCalibrationWarmUp: Bool = false
    private var consecutiveGateRejections: Int = 0
    private var stationaryDetector: StationaryDetector

    // Frozen at first confirmed-stationary fix; reference for pending-exit
    // confirmation and the timeout snap-back. Never overwritten by indoor scatter.
    private var stationaryEntryLocation: LocationData?

    // Post-stationary re-anchor window. Two tiers confirm real movement: speed
    // (N walking fixes) or distance (≥ 8 m). Re-entry clears silently; timeout
    // snaps back to entry AND re-arms warm-up for a gated recovery.
    private var pendingExitAt: Date?
    private var pendingExitFromLocation: LocationData?
    private var consecutiveWalkingFixes: Int = 0
    // Reference fix for the distance-tier implied-speed guard. Updated on
    // every suppressed pending fix; reset whenever pendingExitAt is.
    private var lastPendingFix: LocationData?

    // Single-slot dedup against iOS duplicate re-deliveries (fixTs, lat, lon).
    // Cleared on session start / gap reset so a new session can't collide.
    private var lastInputFixIdentity: (ts: Double, lat: Double, lon: Double)?

    // Remembered so the config snapshot can be re-emitted at session start,
    // after the debug capture file has been opened by the use case.
    private var activityType: LocationActivityType = .walk

    private static let pendingExitConfirmDistanceM: Double = 8.0
    private static let pendingExitConfirmAccuracyM: Double = 20.0
    private static let pendingExitTimeoutSec: TimeInterval = 60.0
    private static let pendingExitSpeedMps: Double = 0.5
    private static let pendingExitSpeedAccuracyM: Double = 20.0
    private static let pendingExitSpeedConsecutive: Int = 2
    private static let warmUpMaxAccuracy: Double = 15.0

    // Session tallies; emitted as pipeline-summary at stopSession.
    private var sessionStart: Date?
    private var sessionInputCount: Int = 0
    private var sessionEmitCount: Int = 0
    private var sessionSuppressCounts: [String: Int] = [:]
    private var sessionGateRejections: [String: Int] = ["A": 0, "B": 0, "C": 0]
    private var sessionPendingArms: Int = 0
    private var sessionPendingConfirms: [String: Int] = ["distance": 0, "speed": 0, "timeout": 0]
    private var sessionRebootstraps: Int = 0
    private var sessionRebootstrapSuppressed: Int = 0
    private var sessionWarmupReanchors: Int = 0
    private var sessionWarmupTeleportRejections: Int = 0

    // Anchors for the per-fix `timer` event.
    private var lastStationaryEventAt: Date?
    private var lastEmitAt: Date?
    private var lastInputFixTs: Date?

    init(
        calibrationManager: GPSCalibrationManager,
        courseValidator: CourseValidator,
        logger: Logging
    ) {
        self.calibrationManager = calibrationManager
        self.courseValidator = courseValidator
        self.logger = logger
        self.config = LocationTrackingConfig.forActivity(.walk)
        self.stationaryDetector = StationaryDetector(
            enterSpeedThreshold: config.stationarySpeedEntry,
            requiredSlowReadings: config.stationaryConsecutiveRequired,
            exitSpeedThreshold: config.stationarySpeedExit,
            exitDisplacementThreshold: config.stationaryDisplacementExit
        )
    }

    func updateConfiguration(for activityType: LocationActivityType) async {
        self.activityType = activityType
        self.config = LocationTrackingConfig.forActivity(activityType)
        self.stationaryDetector = StationaryDetector(
            enterSpeedThreshold: config.stationarySpeedEntry,
            requiredSlowReadings: config.stationaryConsecutiveRequired,
            exitSpeedThreshold: config.stationarySpeedExit,
            exitDisplacementThreshold: config.stationaryDisplacementExit
        )
        await calibrationManager.updateConfiguration(config.calibrationConfig)
        logger.info("Config updated for activity: \(activityType)", category: .location)
        LocationDebugCapture.shared.logConfigSnapshot(payload: configSnapshotPayload(activity: activityType))
    }

    func setTrackingStartTime(_ date: Date) async {
        trackingStartTime = date.timeIntervalSince1970
        sessionStart = date
        resetSessionCounters()
        // Emit the config snapshot here so it lands in the JSONL before the
        // first fix arrives. The use case is responsible for opening the
        // debug capture file before calling this.
        LocationDebugCapture.shared.logConfigSnapshot(payload: configSnapshotPayload(activity: activityType))
        logger.info("Tracking start time set: \(date)", category: .location)
    }

    func processLocation(_ locationData: LocationData) async -> LocationData? {
        // iOS re-delivers identical fixes several times within milliseconds.
        // Dropping them here keeps detector hysteresis, counters, EMA, and
        // gate stats honest, and collapses the log to a single suppress
        // entry per duplicate rather than amplifying every event 4-5×.
        let identity = (
            ts: locationData.timestamp.timeIntervalSince1970,
            lat: locationData.coordinate.latitude,
            lon: locationData.coordinate.longitude
        )
        if let last = lastInputFixIdentity,
           last.ts == identity.ts,
           last.lat == identity.lat,
           last.lon == identity.lon {
            sessionSuppressCounts["duplicate_input", default: 0] += 1
            LocationDebugCapture.shared.logSuppress(locationData, reason: "duplicate_input")
            return nil
        }
        lastInputFixIdentity = identity

        sessionInputCount += 1
        LocationDebugCapture.shared.logInput(locationData)
        let wallNow = Date()

        LocationDebugCapture.shared.logTimer(
            fixTs: locationData.timestamp,
            dtSec: lastInputFixTs.map { locationData.timestamp.timeIntervalSince($0) },
            dtSinceLastEmit: lastEmitAt.map { locationData.timestamp.timeIntervalSince($0) },
            dtSincePendingArm: pendingExitAt.map { wallNow.timeIntervalSince($0) },
            dtSinceLastStationary: lastStationaryEventAt.map { wallNow.timeIntervalSince($0) }
        )
        lastInputFixTs = locationData.timestamp

        let timestamp = locationData.timestamp.timeIntervalSince1970
        guard timestamp.isFinite else {
            suppress(locationData, reason: "timestamp_invalid", level: .warning, msg: "Rejected: non-finite timestamp")
            return nil
        }
        if timestamp > wallNow.timeIntervalSince1970 + 60 {
            suppress(locationData, reason: "timestamp_future", level: .warning, msg: "Rejected: timestamp > 60s in future")
            return nil
        }
        if let start = trackingStartTime, timestamp < start {
            suppress(locationData, reason: "before_start", level: .info, msg: "Rejected: before tracking start")
            return nil
        }
        if timestamp <= lastAcceptedTimestamp {
            suppress(locationData, reason: "timestamp_regression", level: .warning, msg: "Rejected: timestamp regression or duplicate")
            return nil
        }

        if lastAcceptedLocation != nil,
           let lastWall = lastValidGpsWallTime,
           wallNow.timeIntervalSince(lastWall) > config.gapResetThresholdSeconds {
            let gapSeconds = wallNow.timeIntervalSince(lastWall)
            logger.warning("GPS gap of \(String(format: "%.0f", gapSeconds))s detected — resetting pipeline", category: .location)
            LocationDebugCapture.shared.logState(transition: "gap-reset", details: ["gapSeconds": gapSeconds])
            await triggerGapReset()
        }

        guard isValidLocation(locationData) else {
            suppress(locationData, reason: "invalid_location", level: .warning, msg: "Rejected: accuracy/coordinate invalid")
            return nil
        }
        lastValidGpsWallTime = wallNow

        switch await calibrationManager.processLocation(locationData) {
        case .calibrating:
            return nil
        case .calibrated(let calibratedData):
            if lastAcceptedLocation == nil {
                seedInitialAnchor(calibratedData)
                logger.info("Calibration complete — initial anchor at \(fmtCoord(calibratedData.coordinate)), warm-up active", category: .location)
                LocationDebugCapture.shared.logState(transition: "calibration-complete", details: [
                    "lat": calibratedData.coordinate.latitude, "lon": calibratedData.coordinate.longitude,
                    "acc": calibratedData.horizontalAccuracy
                ])
                return nil
            }
            return await applyPipeline(calibratedData)
        case .failed:
            if lastAcceptedLocation == nil {
                seedInitialAnchor(locationData)
                logger.warning("Calibration failed — bootstrapping from raw fix, warm-up active", category: .location)
                return nil
            }
            return await applyPipeline(locationData)
        }
    }

    func finalizeSession() async {
        LocationDebugCapture.shared.logPipelineSummary(payload: pipelineSummaryPayload())
    }

    func resetCalibration() async {
        await calibrationManager.reset()
        await courseValidator.reset()
        resetPipelineAnchors(reason: "reset")
        resetSessionCounters()
        logger.info("Calibration and pipeline state reset", category: .location)
    }

    func getLastValidLocation() async -> LocationData? {
        lastAcceptedLocation
    }

    private func triggerGapReset() async {
        resetPipelineAnchors(reason: "gap-reset")
        await courseValidator.reset()
        if config.resetCalibrationOnGap {
            await calibrationManager.reset()
        }
    }

    /// Single source of truth for clearing pipeline state.
    private func resetPipelineAnchors(reason: String) {
        setLastAccepted(nil, reason: reason)
        setLastEmitted(nil, reason: reason)
        setSecondLastEmitted(nil, reason: reason)
        setSmoothed(nil, nil, reason: reason)
        setStationaryEntry(nil, reason: reason)
        lastAcceptedTimestamp = 0
        lastValidGpsWallTime = nil
        isPostCalibrationWarmUp = false
        setConsecutiveRejections(0, gate: "reset")
        stationaryDetector.reset()
        pendingExitAt = nil
        pendingExitFromLocation = nil
        consecutiveWalkingFixes = 0
        lastPendingFix = nil
        lastInputFixIdentity = nil
    }

    /// Mid-stop/mid-exit we cap the counter instead of nuking — a full reset
    /// would let the next scatter fix emit raw as the new anchor.
    private func checkRebootstrap() async {
        guard consecutiveGateRejections >= config.maxConsecutiveRejections else { return }
        let rejections = consecutiveGateRejections

        if pendingExitAt != nil || stationaryEntryLocation != nil {
            sessionRebootstrapSuppressed += 1
            logger.info("\(rejections) rejections during stationary/post-exit — suppressing rebootstrap", category: .location)
            LocationDebugCapture.shared.logState(transition: "rebootstrap-suppressed", details: ["rejections": rejections])
            setConsecutiveRejections(0, gate: "rebootstrap-suppressed")
            return
        }

        sessionRebootstraps += 1
        logger.warning("\(rejections) rejections — force-clearing prior for re-bootstrap", category: .location)
        LocationDebugCapture.shared.logState(transition: "rebootstrap", details: ["rejections": rejections])
        setLastAccepted(nil, reason: "rebootstrap-clear")
        setLastEmitted(nil, reason: "rebootstrap-clear")
        setSecondLastEmitted(nil, reason: "rebootstrap-clear")
        setSmoothed(nil, nil, reason: "rebootstrap-clear")
        setConsecutiveRejections(0, gate: "rebootstrap")
        stationaryDetector.reset()
        await courseValidator.reset()
    }

    // MARK: - Pipeline

    private func applyPipeline(_ locationData: LocationData) async -> LocationData? {
        guard let last = lastAcceptedLocation else { return nil }

        // Warm-up: replace centroid with first decent-accuracy fix, gated by
        // implied speed so a CL position-solution switch can't look like re-anchor.
        if isPostCalibrationWarmUp && locationData.horizontalAccuracy <= Self.warmUpMaxAccuracy {
            handleWarmupReanchor(locationData, last: last)
            return nil
        }

        // Detector runs FIRST so pending-exit eval, arming, suppression all
        // see the same state (re-entry during pending becomes reachable).
        let prevSlow = stationaryDetector.consecutiveSlowReadings
        let wasStationary = stationaryDetector.isStationary
        // Capture the pending-stationary flag too so we can arm on
        // `pending → non-stationary` edges, not just `stationary → non-stationary`.
        // The detector can flap out via the pending state alone without ever
        // latching full stationary, and we still want to re-arm the exit.
        let wasPendingStationary = stationaryDetector.isPendingStationary
        stationaryDetector.addPosition(locationData.coordinate, at: locationData.timestamp)
        let hasDoppler = locationData.speed >= 0
        let isStationary: Bool
        if hasDoppler {
            isStationary = stationaryDetector.update(dopplerSpeed: locationData.speed)
        } else {
            isStationary = stationaryDetector.checkDisplacementStationary()
        }
        let displacement = stationaryDetector.currentDisplacement
        logStationaryDetail(
            location: locationData,
            wasStationary: wasStationary,
            isStationary: isStationary,
            hasDoppler: hasDoppler,
            displacement: displacement,
            prevSlow: prevSlow
        )
        if isStationary || stationaryDetector.isPendingStationary {
            lastStationaryEventAt = Date()
        }

        // Pending-exit always returns nil (confirm/timeout/suppress/re-entry).
        if pendingExitAt != nil {
            return await handlePendingExit(locationData, isStationary: isStationary)
        }

        switch await runGates(locationData, last: last) {
        case .reject: return nil
        case .pass: break
        }
        setConsecutiveRejections(0, gate: "reset")

        // Arm (or re-arm) pending on any stationary-like → non-stationary-like
        // edge while the stop-entry anchor is still frozen. This covers both
        // fresh exits AND re-arms after a previous pending was cleared by
        // re-entry: the detector can flap out via isPendingStationary without
        // ever latching isStationary, and without this path such a resumption
        // would be missed, leaving the pipeline stuck on the stale anchor.
        let wasStationaryLike = wasStationary || wasPendingStationary
        let isStationaryLike = isStationary || stationaryDetector.isPendingStationary
        if stationaryEntryLocation != nil && wasStationaryLike && !isStationaryLike {
            await armStationaryExit(locationData)
            return nil
        }

        // Stationary (or settling): suppress. First entry freezes stop-entry anchor.
        if isStationaryLike {
            handleStationarySuppression(locationData, isStationary: isStationary)
            return nil
        }

        return emitIfAboveThreshold(locationData)
    }

    private func handleWarmupReanchor(_ locationData: LocationData, last: LocationData) {
        let warmUpDt = locationData.timestamp.timeIntervalSince(last.timestamp)
        let warmUpDist = last.coordinate.distance(to: locationData.coordinate)
        let warmUpSpeed = warmUpDt > 0 ? warmUpDist / warmUpDt : 0
        let teleport = warmUpDt > 0 && warmUpSpeed > config.maxSpeedMps
        LocationDebugCapture.shared.logGate(
            gate: "warmup", passed: !teleport,
            reason: teleport ? "warm_up_teleport" : "warm-up-reanchor",
            inputs: ["impliedSpeedMps": warmUpSpeed, "limitMps": config.maxSpeedMps,
                     "dtSec": warmUpDt, "distM": warmUpDist, "acc": locationData.horizontalAccuracy],
            fixTs: locationData.timestamp
        )
        if teleport {
            sessionWarmupTeleportRejections += 1
            suppress(locationData, reason: "warm_up_teleport", level: .warning,
                     msg: "Warm-up rejected: teleport \(String(format: "%.1f", warmUpDist))m in \(String(format: "%.1f", warmUpDt))s = \(String(format: "%.1f", warmUpSpeed))m/s")
            return
        }
        sessionWarmupReanchors += 1
        setLastAccepted(locationData, reason: "warmup-reanchor")
        lastAcceptedTimestamp = locationData.timestamp.timeIntervalSince1970
        isPostCalibrationWarmUp = false
        logger.info(
            "Warm-up re-anchor: replaced centroid with \(String(format: "%.1f", locationData.horizontalAccuracy))m-accuracy fix",
            category: .location
        )
        LocationDebugCapture.shared.logState(transition: "warm-up-reanchor", details: [
            "lat": locationData.coordinate.latitude, "lon": locationData.coordinate.longitude,
            "acc": locationData.horizontalAccuracy
        ])
    }

    private func handlePendingExit(_ locationData: LocationData, isStationary: Bool) async -> LocationData? {
        guard let pendingAt = pendingExitAt, let exitFrom = pendingExitFromLocation else { return nil }

        // Re-entry before confirm: clear pending silently. Next exit re-arms.
        if isStationary || stationaryDetector.isPendingStationary {
            logger.info("Stationary re-entered — clearing pending re-anchor", category: .location)
            LocationDebugCapture.shared.logState(transition: "pending-cleared-reentry", details: [:])
            pendingExitAt = nil
            pendingExitFromLocation = nil
            lastPendingFix = nil
            consecutiveWalkingFixes = 0
            lastAcceptedTimestamp = locationData.timestamp.timeIntervalSince1970
            suppress(locationData, reason: "pending_exit_reentered", level: .info, msg: "Pending cleared — stationary re-entered")
            return nil
        }

        let age = Date().timeIntervalSince(pendingAt)
        if age > Self.pendingExitTimeoutSec {
            // Timeout: snap back to stop-entry so scatter can't emit against a
            // drifted anchor (B1), clear the entry so next stationary captures
            // fresh (B1), re-arm warm-up for gated recovery if the user really
            // walked during the 60 s (B2).
            if let entryLoc = stationaryEntryLocation {
                setLastAccepted(entryLoc, reason: "timeout-restore")
            }
            sessionPendingConfirms["timeout", default: 0] += 1
            logger.info("Pending timed out after \(String(format: "%.0f", age))s — restored stop-entry; warm-up re-armed", category: .location)
            pendingExitAt = nil
            pendingExitFromLocation = nil
            lastPendingFix = nil
            consecutiveWalkingFixes = 0
            setStationaryEntry(nil, reason: "timeout-restore")
            isPostCalibrationWarmUp = true
            LocationDebugCapture.shared.logState(transition: "pending-exit-timeout", details: ["ageSec": age])
            lastAcceptedTimestamp = locationData.timestamp.timeIntervalSince1970
            suppress(locationData, reason: "pending_exit_timeout", level: .info, msg: "Pending exit timeout — restoring stop-entry anchor")
            return nil
        }

        // Two tiers: speed is outdoor fast-path; distance is the indoor fallback.
        let movedMeters = exitFrom.coordinate.distance(to: locationData.coordinate)
        let walkingFix = locationData.speed >= Self.pendingExitSpeedMps
            && locationData.horizontalAccuracy <= Self.pendingExitSpeedAccuracyM
        if walkingFix {
            consecutiveWalkingFixes += 1
        } else {
            consecutiveWalkingFixes = 0
        }
        let speedConfirmed = consecutiveWalkingFixes >= Self.pendingExitSpeedConsecutive
        LocationDebugCapture.shared.logPendingConfirm(tier: "speed", fired: speedConfirmed, inputs: [
            "spd": locationData.speed, "acc": locationData.horizontalAccuracy,
            "consecutiveWalkingFixes": consecutiveWalkingFixes,
            "neededConsecutive": Self.pendingExitSpeedConsecutive,
            "thresholdSpd": Self.pendingExitSpeedMps, "thresholdAcc": Self.pendingExitSpeedAccuracyM
        ])

        // Distance-tier implied-speed guard. Without this check, the
        // distance tier would rubber-stamp any ≥ 8 m jump at ≤ 20 m accuracy
        // — including indoor fixes whose anchor snapped to a different
        // multipath solution and looked like a plausible walk on paper.
        // Reject if the implied speed from the previous pending fix exceeds
        // the configured max for this activity.
        let distanceReached = movedMeters >= Self.pendingExitConfirmDistanceM
            && locationData.horizontalAccuracy <= Self.pendingExitConfirmAccuracyM
        var distanceConfirmed = distanceReached
        var impliedPendingMps: Double? = nil
        if distanceReached, let prev = lastPendingFix {
            let dtPending = locationData.timestamp.timeIntervalSince(prev.timestamp)
            if dtPending > 0 {
                let distPending = prev.coordinate.distance(to: locationData.coordinate)
                let spd = distPending / dtPending
                impliedPendingMps = spd
                if spd > config.maxSpeedMps {
                    distanceConfirmed = false
                }
            }
        }
        var distanceInputs: [String: Any] = [
            "movedM": movedMeters, "acc": locationData.horizontalAccuracy,
            "thresholdMovedM": Self.pendingExitConfirmDistanceM,
            "thresholdAcc": Self.pendingExitConfirmAccuracyM,
            "maxSpeedMps": config.maxSpeedMps
        ]
        if let spd = impliedPendingMps { distanceInputs["impliedSpeedMps"] = spd }
        LocationDebugCapture.shared.logPendingConfirm(tier: "distance", fired: distanceConfirmed, inputs: distanceInputs)

        if speedConfirmed || distanceConfirmed {
            let reason = speedConfirmed ? "speed" : "distance"
            let tag = "pending-confirm-\(reason)"
            sessionPendingConfirms[reason, default: 0] += 1
            logger.info("Exit CONFIRMED (\(reason)): \(String(format: "%.1f", movedMeters))m, acc=\(String(format: "%.1f", locationData.horizontalAccuracy))m, spd=\(String(format: "%.2f", locationData.speed))m/s — re-anchoring", category: .location)
            // Seed EMA at the frozen stop-entry so the first post-reanchor
            // emit is pulled toward the known stop instead of the raw
            // post-stop scatter that can briefly surround the exit fix.
            let seedLoc = stationaryEntryLocation ?? exitFrom
            setSmoothed(seedLoc.coordinate.latitude, seedLoc.coordinate.longitude, reason: tag)
            setLastAccepted(locationData, reason: tag)
            lastAcceptedTimestamp = locationData.timestamp.timeIntervalSince1970
            setLastEmitted(nil, reason: tag)
            setSecondLastEmitted(nil, reason: tag)
            setConsecutiveRejections(0, gate: "reset")
            isPostCalibrationWarmUp = true
            pendingExitAt = nil
            pendingExitFromLocation = nil
            lastPendingFix = nil
            setStationaryEntry(nil, reason: tag)
            consecutiveWalkingFixes = 0
            LocationDebugCapture.shared.logState(transition: "stationary-exit-confirmed", details: [
                "reason": reason, "movedM": movedMeters,
                "acc": locationData.horizontalAccuracy, "spd": locationData.speed,
                "lat": locationData.coordinate.latitude, "lon": locationData.coordinate.longitude
            ])
            return nil
        }

        lastAcceptedTimestamp = locationData.timestamp.timeIntervalSince1970
        // Feed the next iteration's implied-speed check.
        lastPendingFix = locationData
        suppress(locationData, reason: "pending_exit_suppressed", level: .info,
                 msg: "Pending exit — moved \(String(format: "%.1f", movedMeters))m, acc=\(String(format: "%.1f", locationData.horizontalAccuracy))m, spd=\(String(format: "%.2f", locationData.speed))m/s")
        return nil
    }

    private enum GateResult { case pass, reject }

    private func runGates(_ locationData: LocationData, last: LocationData) async -> GateResult {
        let dt = locationData.timestamp.timeIntervalSince(last.timestamp)
        guard dt > 0 else {
            suppress(locationData, reason: "dt_non_positive", level: .warning, msg: "Rejected: non-positive dt in pipeline")
            return .reject
        }

        let distance = last.coordinate.distance(to: locationData.coordinate)
        let impliedSpeed = distance / dt
        let gateAPassed = impliedSpeed <= config.maxSpeedMps
        LocationDebugCapture.shared.logGate(
            gate: "A", passed: gateAPassed, reason: gateAPassed ? "pass" : "gate_a_speed",
            inputs: ["impliedSpeedMps": impliedSpeed, "limitMps": config.maxSpeedMps,
                     "dtSec": dt, "distM": distance],
            fixTs: locationData.timestamp
        )
        if !gateAPassed {
            sessionGateRejections["A", default: 0] += 1
            setConsecutiveRejections(consecutiveGateRejections + 1, gate: "A")
            suppress(locationData, reason: "gate_a_speed", level: .warning,
                     msg: "Gate A REJECTED: implied \(String(format: "%.1f", impliedSpeed))m/s > max \(String(format: "%.1f", config.maxSpeedMps))m/s [#\(consecutiveGateRejections)]")
            await checkRebootstrap()
            return .reject
        }

        if let prevEmit = lastEmittedLocation, let prev2Emit = secondLastEmittedLocation {
            let emitDt = locationData.timestamp.timeIntervalSince(prevEmit.timestamp)
            if emitDt > 0 && emitDt < 5.0 {
                let lateralDev = perpendicularDistance(
                    point: locationData.coordinate,
                    lineStart: prev2Emit.coordinate, lineEnd: prevEmit.coordinate
                )
                let lateralThreshold = max(5.0, locationData.horizontalAccuracy * 0.7)
                let gateBPassed = lateralDev <= lateralThreshold
                LocationDebugCapture.shared.logGate(
                    gate: "B", passed: gateBPassed, reason: gateBPassed ? "pass" : "gate_b_lateral",
                    inputs: ["lateralDevM": lateralDev, "lateralThresholdM": lateralThreshold, "emitDtSec": emitDt],
                    fixTs: locationData.timestamp
                )
                if !gateBPassed {
                    sessionGateRejections["B", default: 0] += 1
                    setConsecutiveRejections(consecutiveGateRejections + 1, gate: "B")
                    suppress(locationData, reason: "gate_b_lateral", level: .warning,
                             msg: "Gate B REJECTED: lateral \(String(format: "%.1f", lateralDev))m > \(String(format: "%.1f", lateralThreshold))m [#\(consecutiveGateRejections)]")
                    await checkRebootstrap()
                    return .reject
                }
            }
        }

        let gateCPassed = await courseValidator.validate(locationData).isValid
        LocationDebugCapture.shared.logGate(
            gate: "C", passed: gateCPassed, reason: gateCPassed ? "pass" : "gate_c_course",
            inputs: ["spd": locationData.speed, "course": locationData.course],
            fixTs: locationData.timestamp
        )
        if !gateCPassed {
            sessionGateRejections["C", default: 0] += 1
            setConsecutiveRejections(consecutiveGateRejections + 1, gate: "C")
            suppress(locationData, reason: "gate_c_course", level: .warning,
                     msg: "Gate C REJECTED: course spike [#\(consecutiveGateRejections)]")
            await checkRebootstrap()
            return .reject
        }

        return .pass
    }

    private func armStationaryExit(_ locationData: LocationData) async {
        // Reset course so user can turn around at the stop (corner-turn case).
        await courseValidator.reset()
        pendingExitAt = Date()
        // Stop-entry is the reference; lastAccepted may have been overwritten by scatter.
        pendingExitFromLocation = stationaryEntryLocation ?? lastAcceptedLocation
        // Seed the implied-speed reference with the arm-triggering fix.
        lastPendingFix = locationData
        consecutiveWalkingFixes = 0
        sessionPendingArms += 1
        logger.info("Stationary ended — pending re-anchor armed from entry anchor (awaiting confirmed displacement)", category: .location)
        LocationDebugCapture.shared.logState(transition: "stationary-exit-armed", details: [
            "exitFixLat": locationData.coordinate.latitude, "exitFixLon": locationData.coordinate.longitude,
            "exitFixSpd": locationData.speed, "exitFixAcc": locationData.horizontalAccuracy
        ])
        lastAcceptedTimestamp = locationData.timestamp.timeIntervalSince1970
        // Exit-triggering fix is almost always the first scatter point.
        suppress(locationData, reason: "stationary_exit_trigger", level: .info, msg: "Stationary exit trigger — suppressed pending confirm")
    }

    private func handleStationarySuppression(_ locationData: LocationData, isStationary: Bool) {
        // Freeze the stop-entry anchor on first confirmation.
        if isStationary && stationaryEntryLocation == nil, let anchor = lastAcceptedLocation {
            setStationaryEntry(anchor, reason: "stationary-entry-capture")
            logger.info("Stationary entry anchor frozen at \(fmtCoord(anchor.coordinate))", category: .location)
            LocationDebugCapture.shared.logState(transition: "stationary-entry-frozen", details: [
                "anchorLat": anchor.coordinate.latitude, "anchorLon": anchor.coordinate.longitude,
                "anchorAcc": anchor.horizontalAccuracy
            ])
        }
        lastAcceptedTimestamp = locationData.timestamp.timeIntervalSince1970
        let state = isStationary ? "confirmed" : "pending"
        suppress(locationData, reason: "stationary", level: .info, msg: "Stationary (\(state)) — doppler \(String(format: "%.2f", locationData.speed))m/s")
    }

    private func emitIfAboveThreshold(_ locationData: LocationData) -> LocationData? {
        let minimumEmitDistance = max(config.minEmitDistanceFloor, min(locationData.horizontalAccuracy * 0.5, 8.0))
        let distanceFromLastEmit = lastEmittedLocation.map {
            $0.coordinate.distance(to: locationData.coordinate)
        } ?? Double.infinity

        setLastAccepted(locationData, reason: "gate-pass")
        lastAcceptedTimestamp = locationData.timestamp.timeIntervalSince1970

        let emitPassed = distanceFromLastEmit >= minimumEmitDistance
        LocationDebugCapture.shared.logGate(
            gate: "emit-threshold", passed: emitPassed, reason: emitPassed ? "pass" : "sub_threshold",
            inputs: ["emitDistM": distanceFromLastEmit, "emitMinM": minimumEmitDistance,
                     "acc": locationData.horizontalAccuracy],
            fixTs: locationData.timestamp
        )
        if !emitPassed {
            suppress(locationData, reason: "sub_threshold", level: .info,
                     msg: "Sub-threshold: \(String(format: "%.2f", distanceFromLastEmit))m < \(String(format: "%.2f", minimumEmitDistance))m (acc=\(String(format: "%.1f", locationData.horizontalAccuracy))m)")
            return nil
        }

        let alpha = min(config.emaAlphaCap, max(0.2, 5.0 / max(locationData.horizontalAccuracy, 1.0)))
        let emitLat: Double
        let emitLon: Double
        if let sLat = smoothedLat, let sLon = smoothedLon {
            emitLat = alpha * locationData.coordinate.latitude  + (1.0 - alpha) * sLat
            emitLon = alpha * locationData.coordinate.longitude + (1.0 - alpha) * sLon
        } else {
            emitLat = locationData.coordinate.latitude
            emitLon = locationData.coordinate.longitude
        }
        setSmoothed(emitLat, emitLon, reason: "gate-pass")

        let emittedData = LocationData(
            coordinate: Coordinate(latitude: emitLat, longitude: emitLon),
            altitude: locationData.altitude, horizontalAccuracy: locationData.horizontalAccuracy,
            verticalAccuracy: locationData.verticalAccuracy, speed: locationData.speed,
            course: locationData.course, timestamp: locationData.timestamp
        )
        setSecondLastEmitted(lastEmittedLocation, reason: "gate-pass")
        setLastEmitted(emittedData, reason: "gate-pass")
        lastEmitAt = emittedData.timestamp
        sessionEmitCount += 1
        logger.info("Emitted | \(String(format: "%.1f", distanceFromLastEmit))m, α=\(String(format: "%.2f", alpha)), acc=\(String(format: "%.1f", locationData.horizontalAccuracy))m", category: .location)
        LocationDebugCapture.shared.logEmit(emittedData)
        return emittedData
    }

    private func seedInitialAnchor(_ locationData: LocationData) {
        setLastAccepted(locationData, reason: "calibration-seed")
        isPostCalibrationWarmUp = true
        lastValidGpsWallTime = Date()
    }

    // MARK: - Validation

    private func isValidLocation(_ locationData: LocationData) -> Bool {
        let acc = locationData.horizontalAccuracy
        guard acc.isFinite else { logger.warning("Rejected: non-finite horizontalAccuracy", category: .location); return false }
        guard acc > 0 else { logger.warning("Rejected: horizontalAccuracy \(acc) ≤ 0", category: .location); return false }
        guard acc <= config.maxAccuracy else {
            logger.warning("Rejected: accuracy \(String(format: "%.1f", acc))m > max \(String(format: "%.1f", config.maxAccuracy))m", category: .location)
            return false
        }
        guard locationData.coordinate.isValid else { logger.warning("Rejected: coordinate out of range", category: .location); return false }
        guard !locationData.coordinate.isNullIsland else { logger.warning("Rejected: Null Island (0,0)", category: .location); return false }
        return true
    }

    private func perpendicularDistance(point: Coordinate, lineStart: Coordinate, lineEnd: Coordinate) -> Double {
        let midLat = (lineStart.latitude + lineEnd.latitude) / 2.0
        let metersPerDegLat = 111_320.0
        let metersPerDegLon = 111_320.0 * cos(midLat * .pi / 180.0)
        let bx = (lineEnd.longitude - lineStart.longitude) * metersPerDegLon
        let by = (lineEnd.latitude - lineStart.latitude) * metersPerDegLat
        let cx = (point.longitude - lineStart.longitude) * metersPerDegLon
        let cy = (point.latitude - lineStart.latitude) * metersPerDegLat
        let lenSq = bx * bx + by * by
        guard lenSq > 0.01 else { return sqrt(cx * cx + cy * cy) }
        let t = (cx * bx + cy * by) / lenSq
        let dx = cx - t * bx
        let dy = cy - t * by
        return sqrt(dx * dx + dy * dy)
    }

    // MARK: - State mutators (centralised so every change emits anchor-change)

    private func setLastAccepted(_ loc: LocationData?, reason: String) {
        logAnchorChange("lastAccepted", reason: reason, old: lastAcceptedLocation, new: loc)
        lastAcceptedLocation = loc
    }

    private func setLastEmitted(_ loc: LocationData?, reason: String) {
        logAnchorChange("lastEmitted", reason: reason, old: lastEmittedLocation, new: loc)
        lastEmittedLocation = loc
    }

    private func setSecondLastEmitted(_ loc: LocationData?, reason: String) {
        logAnchorChange("secondLastEmitted", reason: reason, old: secondLastEmittedLocation, new: loc)
        secondLastEmittedLocation = loc
    }

    private func setStationaryEntry(_ loc: LocationData?, reason: String) {
        logAnchorChange("stationaryEntry", reason: reason, old: stationaryEntryLocation, new: loc)
        stationaryEntryLocation = loc
    }

    private func setSmoothed(_ lat: Double?, _ lon: Double?, reason: String) {
        guard smoothedLat != lat || smoothedLon != lon else { return }
        let oldDict: [String: Any]? = (smoothedLat.map { ["lat": $0, "lon": smoothedLon ?? 0] })
        let newDict: [String: Any]? = (lat.map { ["lat": $0, "lon": lon ?? 0] })
        LocationDebugCapture.shared.logAnchorChange(variable: "smoothed", reason: reason, old: oldDict, new: newDict)
        smoothedLat = lat
        smoothedLon = lon
    }

    private func setConsecutiveRejections(_ value: Int, gate: String) {
        guard consecutiveGateRejections != value else { return }
        LocationDebugCapture.shared.logRejectionCounter(old: consecutiveGateRejections, new: value, gate: gate)
        consecutiveGateRejections = value
    }

    private func logAnchorChange(_ name: String, reason: String, old: LocationData?, new: LocationData?) {
        switch (old, new) {
        case (.none, .none): return
        case let (.some(a), .some(b)) where a == b: return
        default: break
        }
        LocationDebugCapture.shared.logAnchorChange(variable: name, reason: reason, old: locationDict(old), new: locationDict(new))
    }

    private func locationDict(_ loc: LocationData?) -> [String: Any]? {
        guard let loc = loc else { return nil }
        return ["lat": loc.coordinate.latitude, "lon": loc.coordinate.longitude, "acc": loc.horizontalAccuracy]
    }

    // MARK: - Logging helpers

    private func suppress(_ loc: LocationData, reason: String, level: LogLevel, msg: String) {
        sessionSuppressCounts[reason, default: 0] += 1
        let ts = Int(loc.timestamp.timeIntervalSince1970)
        let line = "\(msg) | \(String(format: "%.6f", loc.coordinate.latitude)),\(String(format: "%.6f", loc.coordinate.longitude)) acc=\(String(format: "%.1f", loc.horizontalAccuracy))m spd=\(String(format: "%.2f", loc.speed)) ts=\(ts) [\(reason)]"
        switch level {
        case .warning: logger.warning(line, category: .location)
        case .error:   logger.error(line, category: .location)
        default:       logger.info(line, category: .location)
        }
        LocationDebugCapture.shared.logSuppress(loc, reason: reason)
    }

    private func logStationaryDetail(
        location: LocationData, wasStationary: Bool, isStationary: Bool,
        hasDoppler: Bool, displacement: Double, prevSlow: Int
    ) {
        // prevSlow comparison isolates the speed path: the detector zeroes the
        // counter on entry so the rule fires exactly when it hits the required count.
        let rule: String
        if !wasStationary && isStationary {
            rule = (hasDoppler && location.speed < config.stationarySpeedEntry
                    && prevSlow + 1 >= config.stationaryConsecutiveRequired) ? "speed-enter" : "disp-enter"
        } else if wasStationary && !isStationary {
            rule = (hasDoppler && location.speed > config.stationarySpeedExit) ? "speed-exit" : "disp-exit"
        } else {
            rule = "none"
        }
        LocationDebugCapture.shared.logStationaryDetail(
            speed: location.speed, displacement: displacement,
            consecutiveSlowReadings: stationaryDetector.consecutiveSlowReadings,
            isStationary: isStationary, isPendingStationary: stationaryDetector.isPendingStationary,
            ruleFired: rule, fixTs: location.timestamp
        )
    }

    private func fmtCoord(_ c: Coordinate) -> String {
        "(\(String(format: "%.6f", c.latitude)), \(String(format: "%.6f", c.longitude)))"
    }

    // MARK: - Session counters

    private func resetSessionCounters() {
        sessionInputCount = 0
        sessionEmitCount = 0
        sessionSuppressCounts.removeAll(keepingCapacity: true)
        sessionGateRejections = ["A": 0, "B": 0, "C": 0]
        sessionPendingArms = 0
        sessionPendingConfirms = ["distance": 0, "speed": 0, "timeout": 0]
        sessionRebootstraps = 0
        sessionRebootstrapSuppressed = 0
        sessionWarmupReanchors = 0
        sessionWarmupTeleportRejections = 0
        lastStationaryEventAt = nil
        lastEmitAt = nil
        lastInputFixTs = nil
    }

    private func configSnapshotPayload(activity: LocationActivityType) -> [String: Any] {
        [
            "activity": String(describing: activity),
            "maxAccuracy": config.maxAccuracy, "maxSpeedMps": config.maxSpeedMps,
            "gapResetThresholdSeconds": config.gapResetThresholdSeconds,
            "maxConsecutiveRejections": config.maxConsecutiveRejections,
            "emaAlphaCap": config.emaAlphaCap, "minEmitDistanceFloor": config.minEmitDistanceFloor,
            "stationarySpeedEntry": config.stationarySpeedEntry,
            "stationaryConsecutiveRequired": config.stationaryConsecutiveRequired,
            "stationarySpeedExit": config.stationarySpeedExit,
            "stationaryDisplacementExit": config.stationaryDisplacementExit,
            "pendingExitConfirmDistanceM": Self.pendingExitConfirmDistanceM,
            "pendingExitConfirmAccuracyM": Self.pendingExitConfirmAccuracyM,
            "pendingExitTimeoutSec": Self.pendingExitTimeoutSec,
            "pendingExitSpeedMps": Self.pendingExitSpeedMps,
            "pendingExitSpeedAccuracyM": Self.pendingExitSpeedAccuracyM,
            "pendingExitSpeedConsecutive": Self.pendingExitSpeedConsecutive,
            "warmupMaxAccuracy": Self.warmUpMaxAccuracy
        ]
    }

    private func pipelineSummaryPayload() -> [String: Any] {
        [
            "durationSec": sessionStart.map { Date().timeIntervalSince($0) } ?? 0,
            "inputCount": sessionInputCount, "emitCount": sessionEmitCount,
            "suppressCountByReason": sessionSuppressCounts,
            "gateRejectionCounts": sessionGateRejections,
            "pendingArms": sessionPendingArms, "pendingConfirms": sessionPendingConfirms,
            "rebootstraps": sessionRebootstraps,
            "rebootstrapSuppressed": sessionRebootstrapSuppressed,
            "warmupReanchors": sessionWarmupReanchors,
            "warmupTeleportRejections": sessionWarmupTeleportRejections
        ]
    }
}
