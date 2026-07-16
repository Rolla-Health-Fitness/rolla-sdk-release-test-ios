import Foundation
import UIKit

public struct RollaConfiguration {
    public let token: String
    public let refreshToken: String?
    public let tokenExpiresIn: TimeInterval?
    public let userId: String?
    public let partnerId: String
    public let environment: String
    public let disabledModules: Set<RollaDisabledModule>
    public let disabledDataSources: Set<RollaDataSource>
    /// SDK UI language. When set, it is authoritative for the Flutter engine's
    /// lifetime and replaces persisted picks and the user's backend profile
    /// language. nil keeps the profile-driven behavior.
    public let language: RollaLanguage?
    public let branding: RollaBranding?
    public let showSettingsButton: Bool
    public let removeRollaBandReferences: Bool

    public init(
        token: String,
        refreshToken: String? = nil,
        tokenExpiresIn: TimeInterval? = nil,
        userId: String? = nil,
        partnerId: String,
        environment: String = "rnd",
        disabledModules: Set<RollaDisabledModule> = [],
        disabledDataSources: Set<RollaDataSource> = [],
        language: RollaLanguage? = nil,
        branding: RollaBranding? = nil,
        showSettingsButton: Bool = true,
        removeRollaBandReferences: Bool = true
    ) {
        self.token = token
        self.refreshToken = refreshToken
        self.tokenExpiresIn = tokenExpiresIn
        self.userId = userId
        self.partnerId = partnerId
        self.environment = environment
        self.disabledModules = disabledModules
        self.disabledDataSources = disabledDataSources
        self.language = language
        self.branding = branding
        self.showSettingsButton = showSettingsButton
        self.removeRollaBandReferences = removeRollaBandReferences
    }
}

/// Visual identity of the SDK UI. Every field is optional: a set field
/// overrides the SDK's built-in default individually — unset fields keep it.
public struct RollaBranding {
    /// Display name of the host app, shown wherever SDK copy refers to the app
    /// (consent and permission texts). nil keeps the generic wording.
    public let hostAppName: String?
    /// Seeds the SDK's entire color scheme (buttons, navigation, inputs,
    /// charts, share cards) in both light and dark themes.
    public let primaryColor: UIColor?
    /// Theme the SDK UI starts in until the user picks one in SDK settings.
    public let defaultThemeMode: RollaThemeMode?
    /// Path of a logo asset pre-bundled into the SDK by Rolla, shown in the
    /// top app bar and on activity share cards.
    public let headerLogoAsset: String?
    /// Privacy policy URL linked from the consent screen.
    public let privacyUrl: String?

    public init(
        hostAppName: String? = nil,
        primaryColor: UIColor? = nil,
        defaultThemeMode: RollaThemeMode? = nil,
        headerLogoAsset: String? = nil,
        privacyUrl: String? = nil
    ) {
        self.hostAppName = hostAppName
        self.primaryColor = primaryColor
        self.defaultThemeMode = defaultThemeMode
        self.headerLogoAsset = headerLogoAsset
        self.privacyUrl = privacyUrl
    }

    func toDictionary() -> [String: Any] {
        var dict: [String: Any] = [:]

        if let hostAppName = hostAppName {
            dict["hostAppName"] = hostAppName
        }
        if let primaryColor = primaryColor {
            dict["primaryColor"] = primaryColor.toInt()
        }
        if let defaultThemeMode = defaultThemeMode {
            dict["defaultThemeMode"] = defaultThemeMode.rawValue
        }
        if let logo = headerLogoAsset {
            dict["headerLogoAsset"] = logo
        }
        if let privacy = privacyUrl {
            dict["privacyUrl"] = privacy
        }

        return dict
    }
}

/// Theme the SDK UI starts in until the user picks one in SDK settings.
public enum RollaThemeMode: String {
    case system
    case light
    case dark
}

private extension UIColor {
    func toInt() -> Int {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        let a = Int(alpha * 255) << 24
        let r = Int(red * 255) << 16
        let g = Int(green * 255) << 8
        let b = Int(blue * 255)

        return a | r | g | b
    }
}
