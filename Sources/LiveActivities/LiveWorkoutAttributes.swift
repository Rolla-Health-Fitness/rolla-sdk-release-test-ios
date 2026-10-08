import Foundation
import ActivityKit

/// Shared ActivityKit attributes for the workout Live Activity.
///
/// ActivityKit serializes these attributes and `ContentState` (both Codable) in the app
/// process and WidgetKit deserializes them inside the host app's widget extension, so a type
/// with the same name and the same Codable shape must exist in both binaries: the SDK copy
/// (compiled into the `RollaSDK` module for native hosts, the `rolla_sdk` plugin for Flutter
/// hosts) and the host app's widget-extension copy. The module the type lives in does not
/// matter, the fields do: a non-optional field the widget expects but the app did not encode
/// fails decoding — a default value such as `= false` does not help — and the Live Activity
/// is never shown (a mismatched later update is dropped). Keep the copies byte-identical so
/// that cannot happen.
@available(iOS 16.1, *)
struct LiveWorkoutAttributes: ActivityAttributes {
    public struct Metric: Codable, Hashable {
        var label: String
        var value: String
    }

    public struct ContentState: Codable, Hashable {
        var metrics: [Metric]
        /// Determines how the widget should interpret/render `metrics[1]` (e.g. icon choice).
        /// Expected values: "distance" | "speed" | "activePoints".
        var secondaryMetricKind: String?
        /// Timer base date used for `Text(date, style: .timer)` so the Live Activity timer
        /// matches the in-app dashboard duration (pause-aware elapsed).
        var timerStartDate: Date?
        /// Raw HR value (bpm) so the widget can render an accurate zone indicator.
        var heartRateBpm: Int?
        /// User-specific HR max (bpm) used to compute zones (percent of HRmax).
        var maxHeartRateBpm: Int?
        /// True when the workout runs in phone-only mode (no band metrics UI).
        var isPhoneOnly: Bool = false
        var isPaused: Bool
        var isBandConnected: Bool
        /// Localized message (provided by the app) to display when the band is disconnected.
        var disconnectedMessage: String?
        /// Localized message (provided by the app) to display when the activity is paused.
        var pausedMessage: String?
        /// Localized message (provided by the app) to display when the Live Activity becomes stale
        /// (i.e. the app was killed or crashed and can no longer push updates).
        var staleMessage: String?
    }

    // Fixed properties (do not change during the activity)
    var activityId: String
    var name: String
    var sfSymbolName: String?
    var startDate: Date
}
