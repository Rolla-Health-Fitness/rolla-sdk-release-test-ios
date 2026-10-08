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

    // Sustained over-speed lockout. `maxConsecutiveRejections` implausible
    // fixes in a row mean the anchor — not the fixes — is stale (the user is
    // in a vehicle, or GPS came back somewhere else). The anchor is kept but
    // no longer trusted, and nothing emits until `lockoutExitRequiredFixes`
    // consecutive fixes describe plausible, moving travel relative to the
    // first fix of their run; the last of them becomes the new anchor. The
    // anchor must not be re-seeded from a single fix: the next vehicle fix
    // would teleport relative to the fresh seed and re-arm warm-up, whose
    // teleport guard would then hold the pipeline for the whole drive — which
    // is also why warm-up teleports count towards the lockout.
    private var isOverSpeedLockout: Bool = false
    private var lockoutRunStartFix: LocationData?
    private var lockoutPlausibleMovingFixes: Int = 0
    private var lockoutExitRequiredFixes: Int = lockoutExitConsecutiveFixes
    private var lastLockoutExitTimestamp: TimeInterval?
    private var vehicleDopplerSinceLockoutExit: Bool = false
    private static let lockoutExitConsecutiveFixes: Int = 4
    // Relapse hysteresis: a lockout re-entered shortly after an exit, with
    // vehicle-speed Doppler seen in between, is stop-and-go traffic that crept
    // at walking pace — not a walk. A car rarely holds ≤ maxSpeedMps for 12 s
    // straight; a walker does it trivially. The Doppler condition spares a
    // walker whose exit landed on a GPS shadow and snapped back: that
    // re-lockout shows no vehicle Doppler and keeps the short exit.
    private static let lockoutExitConsecutiveFixesAfterRelapse: Int = 12
    private static let lockoutRelapseWindowSec: TimeInterval = 60.0

    // Where the user plausibly was before continuity was lost (lockout or gap
    // reset), dated by when they were LAST seen there — not by the anchor's own
    // timestamp, which for a stop is the arrival time and would dilute the
    // bridge speed by the stop's duration. The first emit afterwards is checked
    // against it: if covering the distance would have needed more than
    // maxSpeedMps, that emit is flagged as the start of a new track segment so
    // consumers do not join it to the previous point (or count the gap as
    // distance). Kept across nested losses so the check always spans the whole
    // discontinuity.
    private struct ContinuityReference {
        let coordinate: Coordinate
        let lastSeenTimestamp: TimeInterval
    }
    private var continuityReference: ContinuityReference?

    // Remembered so the config snapshot can be re-emitted at session start,
    // after the debug capture file has been opened by the use case.
    private var activityType: LocationActivityType = .walk

    private static let pendingExitConfirmDistanceM: Double = 8.0
    private static let pendingExitConfirmAccuracyM: Double = 20.0
    private static let pendingExitTimeoutSec: TimeInterval = 60.0
    private static let pendingExitSpeedMps: Double = 0.5
    private static let pendingExitSpeedAccuracyM: Double = 20.0
    private static let pendingExitSpeedConsecutive: Int = 2
    // Warm-up shares the activity's recorded-track accuracy floor
    // (config.maxAccuracy) instead of a stricter hardcoded 15 m, so indoor
    // first-fixes aren't held to a precision the recorded track never requires.
    // Set from config in updateConfiguration(for:).
    private var warmUpMaxAccuracy: Double = 15.0

    // Caps the otherwise-unbounded post-calibration warm-up. The clock starts
    // only when isPostCalibrationWarmUp becomes true. On timeout we accept the
    // best-so-far fix so the recorded first point can't hang for tens of
    // seconds indoors waiting for a high-accuracy fix.
    private var warmUpStartTime: TimeInterval?
    private static let warmUpTimeoutSec: TimeInterval = 3.0

    // Session tallies; emitted as pipeline-summary at stopSession.
    private var sessionStart: Date?
    private var sessionInputCount: Int = 0
    private var sessionEmitCount: Int = 0
    private var sessionSuppressCounts: [String: Int] = [:]
    private var sessionGateRejections: [String: Int] = ["A": 0, "B": 0, "C": 0]
    private var sessionPendingArms: Int = 0
    private var sessionPendingConfirms: [String: Int] = ["distance": 0, "speed": 0, "timeout": 0]
    private var sessionOverSpeedLockouts: Int = 0
    private var sessionOverSpeedLockoutExits: Int = 0
    private var sessionSegmentStarts: Int = 0
    private var sessionWarmupReanchors: Int = 0
    private var sessionWarmupTimeoutEmits: Int = 0
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
        // Warm-up reuses the activity's recorded-track accuracy floor.
        self.warmUpMaxAccuracy = config.maxAccuracy
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
        // A new session has no previous segment to be continuous with.
        continuityReference = nil
        resetSessionCounters()
        logger.info("Calibration and pipeline state reset", category: .location)
    }

    func getLastValidLocation() async -> LocationData? {
        // The lockout exists because this anchor is no longer trusted.
        isOverSpeedLockout ? nil : lastAcceptedLocation
    }

    private func triggerGapReset() async {
        // The outage itself may hide a vehicle ride: remember where the user
        // last plausibly was so the first emit afterwards can be judged.
        rememberContinuityReference()
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
        warmUpStartTime = nil
        setConsecutiveRejections(0, gate: "reset")
        stationaryDetector.reset()
        pendingExitAt = nil
        pendingExitFromLocation = nil
        consecutiveWalkingFixes = 0
        lastPendingFix = nil
        lastInputFixIdentity = nil
        isOverSpeedLockout = false
        lockoutRunStartFix = nil
        lockoutPlausibleMovingFixes = 0
        lockoutExitRequiredFixes = Self.lockoutExitConsecutiveFixes
        lastLockoutExitTimestamp = nil
        vehicleDopplerSinceLockoutExit = false
    }

    /// Only the FIRST loss of continuity sets the reference: a later loss
    /// before any emit must not move it forward, or the check would judge
    /// only the tail of the discontinuity. `lastAcceptedTimestamp` is bumped
    /// by every fix that was consistent with the anchor (accepted, stationary-
    /// or pending-suppressed) and never by a gate rejection, so it is exactly
    /// "last seen near the anchor" — the stop-entry anchor itself only knows
    /// when the user arrived.
    private func rememberContinuityReference() {
        guard continuityReference == nil, let anchor = stationaryEntryLocation ?? lastAcceptedLocation else { return }
        continuityReference = ContinuityReference(
            coordinate: anchor.coordinate,
            lastSeenTimestamp: max(anchor.timestamp.timeIntervalSince1970, lastAcceptedTimestamp)
        )
    }

    /// Returns whether the lockout was entered by this call, so callers branch
    /// on the result instead of re-reading actor state after the suspension.
    private func checkOverSpeedLockout(triggeredBy locationData: LocationData) async -> Bool {
        guard consecutiveGateRejections >= config.maxConsecutiveRejections else { return false }
        await enterOverSpeedLockout(rejections: consecutiveGateRejections, triggeredBy: locationData)
        return true
    }

    /// Abandons the stale anchor after a run of implausible fixes. There is no
    /// stationary/pending exemption any more: those anchors are just as stale,
    /// and exempting them is exactly what pinned the pipeline forever when a
    /// stop preceded the vehicle ride. `lastAcceptedLocation` is deliberately
    /// kept non-nil — processLocation's calibrated branch re-seeds (and re-arms
    /// warm-up) whenever it is nil, which would bypass the lockout. Scatter
    /// cannot emit raw as a new anchor either: exiting needs a consistent run
    /// of moving fixes, not a single one.
    private func enterOverSpeedLockout(rejections: Int, triggeredBy locationData: LocationData) async {
        sessionOverSpeedLockouts += 1
        rememberContinuityReference()
        isOverSpeedLockout = true
        // The triggering fix does not open the first run: it is the tail of the
        // rejected burst, and seeding with it only moves the point at which a
        // long GPS-shadow burst exits onto the shadow by one fix.
        lockoutRunStartFix = nil
        lockoutPlausibleMovingFixes = 0
        let sinceExit = lastLockoutExitTimestamp.map { locationData.timestamp.timeIntervalSince1970 - $0 }
        let relapse = vehicleDopplerSinceLockoutExit && (sinceExit.map { $0 <= Self.lockoutRelapseWindowSec } ?? false)
        lockoutExitRequiredFixes = relapse ? Self.lockoutExitConsecutiveFixesAfterRelapse : Self.lockoutExitConsecutiveFixes
        setLastEmitted(nil, reason: "lockout")
        setSecondLastEmitted(nil, reason: "lockout")
        setSmoothed(nil, nil, reason: "lockout")
        setStationaryEntry(nil, reason: "lockout")
        pendingExitAt = nil
        pendingExitFromLocation = nil
        lastPendingFix = nil
        consecutiveWalkingFixes = 0
        isPostCalibrationWarmUp = false
        warmUpStartTime = nil
        setConsecutiveRejections(0, gate: "lockout")
        stationaryDetector.reset()
        await courseValidator.reset()
        logger.warning("\(rejections) consecutive rejections — anchor is stale, entering over-speed lockout (exit needs \(lockoutExitRequiredFixes) fixes)", category: .location)
        var details: [String: Any] = ["rejections": rejections, "exitRequiredFixes": lockoutExitRequiredFixes, "relapse": relapse]
        if let sinceExit = sinceExit { details["sinceLastExitSec"] = sinceExit }
        LocationDebugCapture.shared.logState(transition: "over-speed-lockout", details: details)
    }

    /// Lockout fixes are judged against the FIRST fix of the current run, not
    /// the anchor — the anchor is what we no longer trust — and not the
    /// previous fix either: 1 Hz position jitter makes consecutive-fix implied
    /// speed swing between 0 and 5 m/s during a steady walk, which would keep
    /// resetting the run, whereas over the run's whole span the jitter averages
    /// out while a vehicle still reads as tens of m/s. A fix that fails
    /// restarts the run at itself. "Moving" is decided by Doppler alone:
    /// position-implied speed between indoor scatter fixes is routinely
    /// 1–3 m/s, which would read as a plausible walk and re-anchor the pipeline
    /// onto scatter, while outdoor GPS fixes — the only ones worth recording —
    /// carry Doppler. Requiring motion also keeps a vehicle waiting at a light
    /// from re-acquiring the anchor; a genuinely stationary user has nothing to
    /// record until they walk anyway. A plausible fix WITHOUT Doppler is
    /// neutral — it neither extends nor restarts the run: it says nothing about
    /// motion, and restarting on every speed-less fix would only delay a
    /// legitimate exit. The fix that ends the run must also be precise enough
    /// to anchor on (same floor as a pending-exit confirm); a coarse one keeps
    /// the run alive and waits for a better fix.
    private func handleOverSpeedLockout(_ locationData: LocationData) async {
        guard let runStart = lockoutRunStartFix else {
            lastAcceptedTimestamp = locationData.timestamp.timeIntervalSince1970
            lockoutRunStartFix = locationData
            suppress(locationData, reason: "lockout_await", level: .info, msg: "Over-speed lockout — awaiting plausible motion")
            return
        }
        let dt = locationData.timestamp.timeIntervalSince(runStart.timestamp)
        guard dt > 0 else {
            // Unreachable for raw fixes (the regression guard rejects them first);
            // a centroid with an older timestamp must neither extend the run
            // nor wind `lastAcceptedTimestamp` back.
            lockoutPlausibleMovingFixes = 0
            suppress(locationData, reason: "lockout_dt_non_positive", level: .warning, msg: "Rejected: non-positive dt in lockout")
            return
        }
        lastAcceptedTimestamp = locationData.timestamp.timeIntervalSince1970
        let impliedSpeed = runStart.coordinate.distance(to: locationData.coordinate) / dt
        let hasDoppler = locationData.speed >= 0
        let plausible = impliedSpeed <= config.maxSpeedMps && (!hasDoppler || locationData.speed <= config.maxSpeedMps)
        let moving = hasDoppler && locationData.speed >= config.stationarySpeedExit
        let qualifies = plausible && moving
        let neutral = plausible && !hasDoppler
        if qualifies {
            lockoutPlausibleMovingFixes += 1
        } else if !neutral {
            lockoutPlausibleMovingFixes = 0
            lockoutRunStartFix = locationData
        }
        let reason: String
        if qualifies {
            reason = "lockout_plausible"
        } else if !plausible {
            reason = "lockout_implausible"
        } else {
            reason = hasDoppler ? "lockout_not_moving" : "lockout_no_doppler"
        }
        LocationDebugCapture.shared.logGate(
            gate: "lockout", passed: qualifies, reason: reason,
            inputs: ["impliedSpeedMps": impliedSpeed, "spd": locationData.speed, "limitMps": config.maxSpeedMps,
                     "minMovingMps": config.stationarySpeedExit, "acc": locationData.horizontalAccuracy,
                     "consecutive": lockoutPlausibleMovingFixes, "needed": lockoutExitRequiredFixes],
            fixTs: locationData.timestamp
        )
        if lockoutPlausibleMovingFixes >= lockoutExitRequiredFixes
            && locationData.horizontalAccuracy <= Self.pendingExitConfirmAccuracyM {
            await exitOverSpeedLockout(at: locationData)
            return
        }
        suppress(locationData, reason: "lockout_suppressed", level: .info,
                 msg: "Over-speed lockout — implied \(String(format: "%.1f", impliedSpeed))m/s, \(lockoutPlausibleMovingFixes)/\(lockoutExitRequiredFixes) plausible moving fixes")
    }

    /// The re-anchor fix itself is not emitted: the next fix passes the gates
    /// against it and is the one that carries the continuity verdict. The
    /// rejection counter is already 0 (nothing counts during the lockout).
    private func exitOverSpeedLockout(at locationData: LocationData) async {
        sessionOverSpeedLockoutExits += 1
        isOverSpeedLockout = false
        lockoutRunStartFix = nil
        lockoutPlausibleMovingFixes = 0
        lastLockoutExitTimestamp = locationData.timestamp.timeIntervalSince1970
        vehicleDopplerSinceLockoutExit = false
        setLastAccepted(locationData, reason: "lockout-exit")
        lastAcceptedTimestamp = locationData.timestamp.timeIntervalSince1970
        stationaryDetector.reset()
        await courseValidator.reset()
        logger.info("Over-speed lockout ended — re-anchored at \(fmtCoord(locationData.coordinate))", category: .location)
        LocationDebugCapture.shared.logState(transition: "over-speed-lockout-exit", details: [
            "lat": locationData.coordinate.latitude, "lon": locationData.coordinate.longitude,
            "acc": locationData.horizontalAccuracy, "spd": locationData.speed
        ])
        suppress(locationData, reason: "lockout_exit_reanchor", level: .info, msg: "Lockout exit — re-anchored, suppressed")
    }

    // MARK: - Pipeline

    private func applyPipeline(_ locationData: LocationData) async -> LocationData? {
        guard let last = lastAcceptedLocation else { return nil }

        // Vehicle evidence for the relapse hysteresis; cleared at lockout exit.
        if locationData.speed > config.maxSpeedMps {
            vehicleDopplerSinceLockoutExit = true
        }

        // Anchor abandoned: nothing below is meaningful until a consistent
        // run of moving fixes re-acquires one.
        if isOverSpeedLockout {
            await handleOverSpeedLockout(locationData)
            return nil
        }

        // Warm-up: replace centroid with first decent-accuracy fix, gated by
        // implied speed so a CL position-solution switch can't look like re-anchor.
        // warmUpMaxAccuracy is config.maxAccuracy (set per-activity).
        if isPostCalibrationWarmUp {
            if locationData.horizontalAccuracy <= warmUpMaxAccuracy {
                await handleWarmupReanchor(locationData, last: last)
                return nil
            }
            // Cap the warm-up wait for accuracy. Once we've been warming up
            // longer than the timeout, accept the best-so-far fix as the new
            // anchor and fall through to the normal pipeline so the recorded
            // first point can't hang indoors. Safety net only while
            // warmUpMaxAccuracy == config.maxAccuracy: isValidLocation already
            // enforces that floor, so the branch above always takes the fix;
            // this stays for the day the two floors diverge. Re-anchoring
            // lastAccepted here keeps Gate A's implied-speed baseline honest.
            let start = warmUpStartTime ?? locationData.timestamp.timeIntervalSince1970
            if locationData.timestamp.timeIntervalSince1970 - start > Self.warmUpTimeoutSec {
                isPostCalibrationWarmUp = false
                warmUpStartTime = nil
                sessionWarmupTimeoutEmits += 1
                setLastAccepted(locationData, reason: "warmup-timeout")
                lastAcceptedTimestamp = locationData.timestamp.timeIntervalSince1970
                logger.info("Warm-up timed out — accepting \(String(format: "%.1f", locationData.horizontalAccuracy))m fix as anchor", category: .location)
                LocationDebugCapture.shared.logState(transition: "warm-up-timeout", details: [
                    "acc": locationData.horizontalAccuracy
                ])
                // fall through to gates/emit below
            } else {
                LocationDebugCapture.shared.logGate(
                    gate: "warmup", passed: false, reason: "warmup_awaiting_accuracy",
                    inputs: ["acc": locationData.horizontalAccuracy, "limitM": warmUpMaxAccuracy],
                    fixTs: locationData.timestamp
                )
                return nil
            }
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

    private func handleWarmupReanchor(_ locationData: LocationData, last: LocationData) async {
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
            // A teleport relative to a fresh seed is the same evidence as a
            // Gate A rejection: sustained, it means the SEED is the stale
            // point (a re-seed taken mid-ride), so it must count towards the
            // lockout instead of holding the warm-up open indefinitely.
            setConsecutiveRejections(consecutiveGateRejections + 1, gate: "warmup")
            suppress(locationData, reason: "warm_up_teleport", level: .warning,
                     msg: "Warm-up rejected: teleport \(String(format: "%.1f", warmUpDist))m in \(String(format: "%.1f", warmUpDt))s = \(String(format: "%.1f", warmUpSpeed))m/s [#\(consecutiveGateRejections)]")
            _ = await checkOverSpeedLockout(triggeredBy: locationData)
            return
        }
        sessionWarmupReanchors += 1
        setLastAccepted(locationData, reason: "warmup-reanchor")
        lastAcceptedTimestamp = locationData.timestamp.timeIntervalSince1970
        setConsecutiveRejections(0, gate: "reset")
        isPostCalibrationWarmUp = false
        warmUpStartTime = nil
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
            warmUpStartTime = locationData.timestamp.timeIntervalSince1970 // arm warm-up timeout
            LocationDebugCapture.shared.logState(transition: "pending-exit-timeout", details: ["ageSec": age])
            lastAcceptedTimestamp = locationData.timestamp.timeIntervalSince1970
            suppress(locationData, reason: "pending_exit_timeout", level: .info, msg: "Pending exit timeout — restoring stop-entry anchor")
            return nil
        }

        // Vehicle-speed Doppler while pending is the same evidence as a Gate A
        // rejection: a car pulling away from the stop must converge on the
        // lockout, never confirm the exit — so such a fix never reaches the
        // tiers below (Doppler leads position, and the distance tier's
        // implied-speed guard alone would pass a 3 m step at 6 m/s Doppler).
        // Position-implied speed is left out here on purpose — indoor scatter
        // between consecutive pending fixes is routinely implausible and must
        // not count. Walking-pace Doppler is consistent with the anchor and
        // resets the run, keeping the counter's "consecutive" meaning.
        if locationData.speed > config.maxSpeedMps {
            setConsecutiveRejections(consecutiveGateRejections + 1, gate: "pending")
            let lockedOut = await checkOverSpeedLockout(triggeredBy: locationData)
            if !lockedOut {
                lastAcceptedTimestamp = locationData.timestamp.timeIntervalSince1970
                lastPendingFix = locationData
                consecutiveWalkingFixes = 0
            }
            suppress(locationData, reason: "pending_exit_overspeed", level: .warning,
                     msg: "Pending exit — doppler \(String(format: "%.1f", locationData.speed))m/s > max\(lockedOut ? ", lockout entered" : "")")
            return nil
        }
        if locationData.speed >= 0 {
            setConsecutiveRejections(0, gate: "reset")
        }

        // Two tiers: speed is outdoor fast-path; distance is the indoor fallback.
        // The speed tier is bounded above as well: only walking-pace Doppler may
        // confirm, otherwise a vehicle leaving the stop re-anchors onto itself.
        let movedMeters = exitFrom.coordinate.distance(to: locationData.coordinate)
        let walkingFix = locationData.speed >= Self.pendingExitSpeedMps
            && locationData.speed <= config.maxSpeedMps
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
            warmUpStartTime = locationData.timestamp.timeIntervalSince1970 // arm warm-up timeout
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
            _ = await checkOverSpeedLockout(triggeredBy: locationData)
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
                    _ = await checkOverSpeedLockout(triggeredBy: locationData)
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
            _ = await checkOverSpeedLockout(triggeredBy: locationData)
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

        let startsSegment = resolveSegmentContinuity(for: locationData)

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
            course: locationData.course, timestamp: locationData.timestamp,
            isSegmentStart: startsSegment
        )
        setSecondLastEmitted(lastEmittedLocation, reason: "gate-pass")
        setLastEmitted(emittedData, reason: "gate-pass")
        lastEmitAt = emittedData.timestamp
        sessionEmitCount += 1
        logger.info("Emitted | \(String(format: "%.1f", distanceFromLastEmit))m, α=\(String(format: "%.2f", alpha)), acc=\(String(format: "%.1f", locationData.horizontalAccuracy))m\(startsSegment ? " [new segment]" : "")", category: .location)
        LocationDebugCapture.shared.logEmit(emittedData)
        return emittedData
    }

    /// First emit after continuity was lost: does this point join the previous
    /// segment or start a new one? A GPS-shadow burst or a tunnel leaves the
    /// user where a walker could have got to, so the gap is bridged as before;
    /// a vehicle ride does not, so the gap stays open. Consumes the reference.
    /// A gap that cannot be timed (dt ≤ 0) cannot be vouched for either and
    /// stays open.
    private func resolveSegmentContinuity(for locationData: LocationData) -> Bool {
        guard let reference = continuityReference else { return false }
        continuityReference = nil
        let dt = locationData.timestamp.timeIntervalSince1970 - reference.lastSeenTimestamp
        let distance = reference.coordinate.distance(to: locationData.coordinate)
        let bridgeSpeed: Double? = dt > 0 ? distance / dt : nil
        let startsSegment = bridgeSpeed.map { $0 > config.maxSpeedMps } ?? true
        if startsSegment { sessionSegmentStarts += 1 }
        let speedText = bridgeSpeed.map { String(format: "%.1f", $0) + "m/s" } ?? "untimed"
        logger.info(
            "Continuity: \(String(format: "%.0f", distance))m in \(String(format: "%.0f", dt))s = \(speedText) → \(startsSegment ? "new segment" : "continued")",
            category: .location
        )
        var details: [String: Any] = ["bridgeDistM": distance, "bridgeDtSec": dt, "limitMps": config.maxSpeedMps]
        if let bridgeSpeed = bridgeSpeed { details["bridgeSpeedMps"] = bridgeSpeed }
        LocationDebugCapture.shared.logState(transition: startsSegment ? "segment-start" : "segment-continued", details: details)
        return startsSegment
    }

    private func seedInitialAnchor(_ locationData: LocationData) {
        setLastAccepted(locationData, reason: "calibration-seed")
        isPostCalibrationWarmUp = true
        warmUpStartTime = locationData.timestamp.timeIntervalSince1970 // arm warm-up timeout
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
        sessionOverSpeedLockouts = 0
        sessionOverSpeedLockoutExits = 0
        sessionSegmentStarts = 0
        sessionWarmupReanchors = 0
        sessionWarmupTimeoutEmits = 0
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
            "warmupMaxAccuracy": warmUpMaxAccuracy,
            "lockoutExitConsecutiveFixes": Self.lockoutExitConsecutiveFixes,
            "lockoutExitConsecutiveFixesAfterRelapse": Self.lockoutExitConsecutiveFixesAfterRelapse,
            "lockoutRelapseWindowSec": Self.lockoutRelapseWindowSec
        ]
    }

    private func pipelineSummaryPayload() -> [String: Any] {
        [
            "durationSec": sessionStart.map { Date().timeIntervalSince($0) } ?? 0,
            "inputCount": sessionInputCount, "emitCount": sessionEmitCount,
            "suppressCountByReason": sessionSuppressCounts,
            "gateRejectionCounts": sessionGateRejections,
            "pendingArms": sessionPendingArms, "pendingConfirms": sessionPendingConfirms,
            "overSpeedLockouts": sessionOverSpeedLockouts,
            "overSpeedLockoutExits": sessionOverSpeedLockoutExits,
            "segmentStarts": sessionSegmentStarts,
            "warmupReanchors": sessionWarmupReanchors,
            "warmupTimeoutEmits": sessionWarmupTimeoutEmits,
            "warmupTeleportRejections": sessionWarmupTeleportRejections
        ]
    }
}
