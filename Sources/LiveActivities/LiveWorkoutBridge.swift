import Foundation
import Flutter
import ActivityKit

/// Handles iOS Live Activities for workout tracking
/// Implements the MethodChannel bridge for `app.rolla/live_workout`
///
/// This class manages:
/// - Starting Live Activities with workout metrics
/// - Updating Live Activities in real-time
/// - Ending Live Activities when workouts finish
///
/// ## Usage
/// This bridge is automatically registered by AppDependencies.
/// Host apps don't need any manual setup - just create the Widget Extension.
///
/// ## Requirements
/// - iOS 16.1+ (gracefully degrades on older versions)
/// - Widget Extension target with LiveWorkoutAttributes.swift
/// - Push Notifications entitlement enabled
@available(iOS 16.1, *)
final class LiveWorkoutBridge: NSObject {

    // MARK: - Properties

    /// MethodChannel for Flutter <-> iOS communication
    private let channel: FlutterMethodChannel

    /// In-memory store of active Live Activities keyed by activityId
    /// This allows quick lookup without scanning all system activities
    private var activitiesById: [String: Activity<LiveWorkoutAttributes>] = [:]

    // MARK: - Initialization

    /// Initialize the Live Workout bridge
    /// - Parameter messenger: Flutter binary messenger for MethodChannel
    init(binaryMessenger: FlutterBinaryMessenger) {
        self.channel = FlutterMethodChannel(
            name: "app.rolla/live_workout",
            binaryMessenger: binaryMessenger
        )
        super.init()

        // Register method call handler
        channel.setMethodCallHandler { [weak self] call, result in
            self?.handleMethodCall(call, result: result)
        }

        print("✅ [LiveWorkoutBridge] Registered - Live Activities ready (iOS 16.1+)")
    }

    // MARK: - Method Call Handling

    /// Handle incoming Flutter method calls
    /// - Parameters:
    ///   - call: Method call from Flutter
    ///   - result: Result callback to Flutter
    private func handleMethodCall(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "start":
            handleStart(call, result: result)
        case "update":
            handleUpdate(call, result: result)
        case "end":
            handleEnd(call, result: result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    // MARK: - Start Live Activity

    /// Start a new Live Activity for a workout
    ///
    /// Expected arguments:
    /// - activityId: String - Unique ID for this workout
    /// - name: String - Workout name (e.g., "Walking", "Running")
    /// - sfSymbolName: String? - SF Symbol for workout icon
    /// - startEpochMs: Int64 - Workout start timestamp in milliseconds
    /// - timerStartEpochMs: Int64 - Timer base timestamp (pause-aware)
    /// - metrics: [[String: Any]] - Array of {label, value} metric dicts
    /// - secondaryMetricKind: String? - "distance" or "activePoints"
    /// - heartRateBpm: Int? - Current heart rate
    /// - maxHeartRateBpm: Int? - User's max heart rate
    /// - isBandConnected: Bool - Band connection status
    /// - disconnectedMessage: String? - Localized message for disconnect state
    /// - pausedMessage: String? - Localized message for paused state
    ///
    /// - Returns: String? - System activity ID if successful, null if failed
    private func handleStart(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        // Check if Live Activities are enabled by the user
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
            print("⚠️ [LiveWorkoutBridge] Live Activities disabled by user")
            result(nil)
            return
        }

        guard let args = call.arguments as? [String: Any] else {
            print("❌ [LiveWorkoutBridge] Invalid arguments for start")
            result(nil)
            return
        }

        // Extract required parameters
        guard let activityId = args["activityId"] as? String,
              let name = args["name"] as? String else {
            print("❌ [LiveWorkoutBridge] Missing required parameters (activityId or name)")
            result(nil)
            return
        }

        // Extract optional parameters
        let sfSymbolName = args["sfSymbolName"] as? String
        let startEpochMs = args["startEpochMs"] as? Int64
        let startDate = startEpochMs != nil
            ? Date(timeIntervalSince1970: TimeInterval(startEpochMs!) / 1000.0)
            : Date()

        let timerStartEpochMs = args["timerStartEpochMs"] as? Int64
        let timerStartDate = timerStartEpochMs != nil
            ? Date(timeIntervalSince1970: TimeInterval(timerStartEpochMs!) / 1000.0)
            : startDate

        let metrics = parseMetrics(args["metrics"])
        let secondaryMetricKind = args["secondaryMetricKind"] as? String
        let isBandConnected = args["isBandConnected"] as? Bool ?? true
        let disconnectedMessage = args["disconnectedMessage"] as? String
        let pausedMessage = args["pausedMessage"] as? String
        let heartRateBpm = parseOptionalInt(args["heartRateBpm"])
        let maxHeartRateBpm = parseOptionalInt(args["maxHeartRateBpm"])

        // Build ActivityKit attributes (fixed data)
        let attributes = LiveWorkoutAttributes(
            activityId: activityId,
            name: name,
            sfSymbolName: sfSymbolName,
            startDate: startDate
        )

        // Build initial content state (dynamic data)
        let initialState = LiveWorkoutAttributes.ContentState(
            metrics: metrics,
            secondaryMetricKind: secondaryMetricKind,
            timerStartDate: timerStartDate,
            heartRateBpm: heartRateBpm,
            maxHeartRateBpm: maxHeartRateBpm,
            isPaused: false,
            isBandConnected: isBandConnected,
            disconnectedMessage: disconnectedMessage,
            pausedMessage: pausedMessage
        )

        // Request the Live Activity from iOS
        do {
            let activity = try Activity.request(
                attributes: attributes,
                contentState: initialState,
                pushType: nil  // Not using remote push
            )

            // Store for later updates
            activitiesById[activityId] = activity

            print("✅ [LiveWorkoutBridge] Started Live Activity: \(activityId) -> \(activity.id)")
            result(activity.id)
        } catch {
            print("❌ [LiveWorkoutBridge] Failed to start Live Activity: \(error)")
            result(nil)
        }
    }

    // MARK: - Update Live Activity

    /// Update an existing Live Activity with new metrics
    ///
    /// Expected arguments:
    /// - activityId: String - ID of the workout to update
    /// - timerStartEpochMs: Int64 - Updated timer base (for pause/resume)
    /// - metrics: [[String: Any]] - Updated metrics
    /// - secondaryMetricKind: String? - "distance" or "activePoints"
    /// - heartRateBpm: Int? - Updated heart rate
    /// - maxHeartRateBpm: Int? - User's max heart rate
    /// - isPaused: Bool - Whether workout is paused
    /// - isBandConnected: Bool - Band connection status
    /// - disconnectedMessage: String? - Localized disconnect message
    /// - pausedMessage: String? - Localized pause message
    ///
    /// - Returns: Bool - true if updated successfully, false otherwise
    private func handleUpdate(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let args = call.arguments as? [String: Any] else {
            print("❌ [LiveWorkoutBridge] Invalid arguments for update")
            result(false)
            return
        }

        guard let activityId = args["activityId"] as? String else {
            print("❌ [LiveWorkoutBridge] Missing activityId for update")
            result(false)
            return
        }

        // Extract update parameters
        let timerStartEpochMs = args["timerStartEpochMs"] as? Int64
        let timerStartDate = timerStartEpochMs != nil
            ? Date(timeIntervalSince1970: TimeInterval(timerStartEpochMs!) / 1000.0)
            : nil

        let metrics = parseMetrics(args["metrics"])
        let secondaryMetricKind = args["secondaryMetricKind"] as? String
        let isPaused = args["isPaused"] as? Bool ?? false
        let isBandConnected = args["isBandConnected"] as? Bool ?? true
        let disconnectedMessage = args["disconnectedMessage"] as? String
        let pausedMessage = args["pausedMessage"] as? String
        let heartRateBpm = parseOptionalInt(args["heartRateBpm"])
        let maxHeartRateBpm = parseOptionalInt(args["maxHeartRateBpm"])

        // Find the activity (check cache first, then scan all activities)
        let activity = activitiesById[activityId]
            ?? Activity<LiveWorkoutAttributes>.activities.first(where: { $0.attributes.activityId == activityId })

        guard let activity = activity else {
            print("⚠️ [LiveWorkoutBridge] Activity not found for update: \(activityId)")
            result(false)
            return
        }

        // Build updated content state
        let newState = LiveWorkoutAttributes.ContentState(
            metrics: metrics,
            secondaryMetricKind: secondaryMetricKind,
            timerStartDate: timerStartDate,
            heartRateBpm: heartRateBpm,
            maxHeartRateBpm: maxHeartRateBpm,
            isPaused: isPaused,
            isBandConnected: isBandConnected,
            disconnectedMessage: disconnectedMessage,
            pausedMessage: pausedMessage
        )

        // Update the Live Activity asynchronously
        Task {
            await activity.update(using: newState)
            // Update cache
            self.activitiesById[activityId] = activity
            print("🔄 [LiveWorkoutBridge] Updated Live Activity: \(activityId)")
            result(true)
        }
    }

    // MARK: - End Live Activity

    /// End a Live Activity
    ///
    /// Expected arguments:
    /// - activityId: String - ID of the workout to end
    ///
    /// - Returns: Bool - true if ended successfully, false otherwise
    private func handleEnd(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let args = call.arguments as? [String: Any] else {
            print("❌ [LiveWorkoutBridge] Invalid arguments for end")
            result(false)
            return
        }

        guard let activityId = args["activityId"] as? String else {
            print("❌ [LiveWorkoutBridge] Missing activityId for end")
            result(false)
            return
        }

        // Find the activity (check cache first, then scan all activities)
        let activity = activitiesById[activityId]
            ?? Activity<LiveWorkoutAttributes>.activities.first(where: { $0.attributes.activityId == activityId })

        guard let activity = activity else {
            print("⚠️ [LiveWorkoutBridge] Activity not found for end: \(activityId)")
            result(false)
            return
        }

        // End the Live Activity asynchronously
        Task {
            await activity.end(dismissalPolicy: .immediate)
            // Remove from cache
            self.activitiesById.removeValue(forKey: activityId)
            print("🔴 [LiveWorkoutBridge] Ended Live Activity: \(activityId)")
            result(true)
        }
    }

    // MARK: - Helper Methods

    /// Parse metrics array from Flutter
    /// - Parameter raw: Raw object from Flutter (expected: [[String: Any]])
    /// - Returns: Array of LiveWorkoutAttributes.Metric
    private func parseMetrics(_ raw: Any?) -> [LiveWorkoutAttributes.Metric] {
        guard let list = raw as? [[String: Any]] else {
            return []
        }

        return list.compactMap { dict in
            guard let label = dict["label"] as? String,
                  let value = dict["value"] as? String else {
                return nil
            }
            return LiveWorkoutAttributes.Metric(label: label, value: value)
        }
    }

    /// Parse optional integer from Flutter
    /// Dart ints can arrive as NSNumber, Int, or Int64 on iOS
    /// - Parameter raw: Raw object from Flutter
    /// - Returns: Int if parseable, nil otherwise
    private func parseOptionalInt(_ raw: Any?) -> Int? {
        if let n = raw as? NSNumber { return n.intValue }
        if let i = raw as? Int { return i }
        if let i64 = raw as? Int64 { return Int(i64) }
        return nil
    }
}
