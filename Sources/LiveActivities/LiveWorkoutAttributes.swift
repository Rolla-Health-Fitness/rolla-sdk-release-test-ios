import Foundation
import ActivityKit

/// Shared ActivityKit attributes for the `liveworkout` Live Activity.
///
/// This file must be compiled into BOTH targets:
/// - Runner (so the app can start/update/end the Live Activity)
/// - liveworkout (so the widget can render it)
@available(iOS 16.1, *)
struct LiveWorkoutAttributes: ActivityAttributes {
    public struct Metric: Codable, Hashable {
        var label: String
        var value: String
    }

    public struct ContentState: Codable, Hashable {
        var metrics: [Metric]
        /// Determines how the widget should interpret/render `metrics[1]` (e.g. icon choice).
        /// Expected values: "distance" | "activePoints".
        var secondaryMetricKind: String?
        /// Timer base date used for `Text(date, style: .timer)` so the Live Activity timer
        /// matches the in-app dashboard duration (pause-aware elapsed).
        var timerStartDate: Date?
        /// Raw HR value (bpm) so the widget can render an accurate zone indicator.
        var heartRateBpm: Int?
        /// User-specific HR max (bpm) used to compute zones (percent of HRmax).
        var maxHeartRateBpm: Int?
        var isPaused: Bool
        var isBandConnected: Bool
        /// Localized message (provided by the app) to display when the band is disconnected.
        var disconnectedMessage: String?
        /// Localized message (provided by the app) to display when the activity is paused.
        var pausedMessage: String?
    }

    // Fixed properties (do not change during the activity)
    var activityId: String
    var name: String
    var sfSymbolName: String?
    var startDate: Date
}
