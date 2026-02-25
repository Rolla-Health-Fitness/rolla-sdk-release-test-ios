import Foundation
import UIKit

public struct RollaConfiguration {
    public let token: String
    public let refreshToken: String?
    public let tokenExpiresIn: TimeInterval?
    public let userId: String?
    public let partnerId: String
    public let environment: String
    public let modules: [String]?
    public let branding: RollaBranding?

    public init(
        token: String,
        refreshToken: String? = nil,
        tokenExpiresIn: TimeInterval? = nil,
        userId: String? = nil,
        partnerId: String,
        environment: String = "rnd",
        modules: [String]? = nil,
        branding: RollaBranding? = nil
    ) {
        self.token = token
        self.refreshToken = refreshToken
        self.tokenExpiresIn = tokenExpiresIn
        self.userId = userId
        self.partnerId = partnerId
        self.environment = environment
        self.modules = modules
        self.branding = branding
    }
}

public struct RollaBranding {
    public let appName: String
    public let primaryColor: UIColor
    public let secondaryColor: UIColor
    public let accentColor: UIColor
    public let brightness: String
    public let defaultThemeMode: String
    public let defaultLocale: String?
    public let headerLogoAsset: String?
    public let termsUrl: String?
    public let privacyUrl: String?
    
    public init(
        appName: String,
        primaryColor: UIColor,
        secondaryColor: UIColor,
        accentColor: UIColor,
        brightness: String = "light",
        defaultThemeMode: String = "system",
        defaultLocale: String? = nil,
        headerLogoAsset: String? = nil,
        termsUrl: String? = nil,
        privacyUrl: String? = nil
    ) {
        self.appName = appName
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
        self.accentColor = accentColor
        self.brightness = brightness
        self.defaultThemeMode = defaultThemeMode
        self.defaultLocale = defaultLocale
        self.headerLogoAsset = headerLogoAsset
        self.termsUrl = termsUrl
        self.privacyUrl = privacyUrl
    }

    func toDictionary() -> [String: Any] {
        var dict: [String: Any] = [
            "appName": appName,
            "primaryColor": primaryColor.toInt(),
            "secondaryColor": secondaryColor.toInt(),
            "accentColor": accentColor.toInt(),
            "brightness": brightness,
            "defaultThemeMode": defaultThemeMode,
        ]
        
        if let locale = defaultLocale {
            dict["defaultLanguage"] = locale
        }
        if let logo = headerLogoAsset {
            dict["headerLogoAsset"] = logo
        }
        if let terms = termsUrl {
            dict["termsUrl"] = terms
        }
        if let privacy = privacyUrl {
            dict["privacyUrl"] = privacy
        }
        
        return dict
    }
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
