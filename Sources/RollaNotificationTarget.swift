import Foundation
import UserNotifications

/// Where a tap on a Rolla SDK notification should lead, resolved via
/// ``Rolla/notificationTarget(userInfo:)`` or
/// ``Rolla/notificationTarget(response:)``.
///
/// Every notification the SDK produces carries a payload naming its
/// destination; a `nil` resolution means the notification is not Rolla's.
public enum RollaNotificationTarget: Equatable {

    /// Take the user to the OS app-settings page — the notification asks them
    /// to fix a permission (e.g. background location during a workout), so an
    /// SDK screen would not help. Open it with
    /// `UIApplication.openSettingsURLString`.
    case appSettings

    /// Open the screen via ``Rolla/openScreen(_:from:transition:completion:)``.
    case screen(RollaScreen)

    // Wire contract shared verbatim with the Dart RollaNotificationPayload
    // and the Android RollaNotificationTarget — keep all three in sync.
    private static let payloadKey = "payload"
    private static let markerKey = "rolla"
    private static let targetKey = "target"
    private static let targetAppSettings = "appSettings"

    static func parse(userInfo: [AnyHashable: Any]) -> RollaNotificationTarget? {
        guard let payload = userInfo[payloadKey] as? String, !payload.isEmpty,
              let data = payload.data(using: .utf8),
              let json = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any],
              // Any integer marker version >= 1 is a Rolla notification; an
              // unknown target from a newer contract still resolves — to
              // Home. Strictly a JSON integer — JSONSerialization bridges
              // booleans and doubles to NSNumber too, and those must not
              // count, matching the Dart parser exactly.
              let marker = json[markerKey] as? NSNumber,
              CFGetTypeID(marker) != CFBooleanGetTypeID(),
              !CFNumberIsFloatType(marker),
              marker.intValue >= 1
        else { return nil }
        let target = json[targetKey] as? String ?? ""
        if target == targetAppSettings { return .appSettings }
        return .screen(RollaScreen(rawValue: target) ?? .home)
    }
}

public extension Rolla {

    /// Identify a Rolla SDK notification tap and resolve where it should
    /// lead.
    ///
    /// The SDK never claims your app's `UNUserNotificationCenter` delegate —
    /// your app receives every tap. From your delegate's
    /// `userNotificationCenter(_:didReceive:withCompletionHandler:)`, pass the
    /// response's `userInfo` (or use ``notificationTarget(response:)``) and
    /// act on the result: `nil` means the notification is not Rolla's;
    /// ``RollaNotificationTarget/screen(_:)`` names the screen to pass to
    /// ``openScreen(_:from:transition:completion:)``;
    /// ``RollaNotificationTarget/appSettings`` asks for the OS app-settings
    /// page. The same call from
    /// `userNotificationCenter(_:willPresent:withCompletionHandler:)` tells
    /// you whether a foreground notification is Rolla's when choosing its
    /// presentation options.
    static func notificationTarget(userInfo: [AnyHashable: Any]) -> RollaNotificationTarget? {
        RollaNotificationTarget.parse(userInfo: userInfo)
    }

    /// Convenience for ``notificationTarget(userInfo:)`` taking the response
    /// delivered to `userNotificationCenter(_:didReceive:withCompletionHandler:)`.
    static func notificationTarget(response: UNNotificationResponse) -> RollaNotificationTarget? {
        notificationTarget(userInfo: response.notification.request.content.userInfo)
    }
}
