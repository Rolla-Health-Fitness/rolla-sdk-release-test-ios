import Foundation

public protocol RollaDelegate: AnyObject {
    func rollaDidClose(_ rolla: Rolla, reason: RollaCloseReason)
    func rolla(_ rolla: Rolla, didFailWithError error: RollaError)

    /// Called when the SDK successfully refreshes tokens internally.
    ///
    /// Use this to sync your app's token storage with the SDK's refreshed tokens.
    ///
    /// - Parameters:
    ///   - rolla: The Rolla instance that refreshed the token.
    ///   - token: The new access token.
    ///   - refreshToken: The new refresh token, if provided.
    ///   - expiresIn: Time interval in seconds until the new access token expires, if known.
    func rollaDidRefreshToken(_ rolla: Rolla, token: String, refreshToken: String?, expiresIn: TimeInterval?)

    /// Called when the SDK's internal token refresh fails and the host app needs to provide new tokens.
    ///
    /// When this is called, the host app should obtain fresh tokens from its own auth backend
    /// and push them to the SDK via ``Rolla/updateToken(token:refreshToken:expiresIn:completion:)``.
    ///
    /// - Parameter rolla: The Rolla instance that needs fresh tokens.
    func rollaDidRequestTokenRefresh(_ rolla: Rolla)
}

public extension RollaDelegate {
    func rollaDidClose(_ rolla: Rolla, reason: RollaCloseReason) {}
    func rolla(_ rolla: Rolla, didFailWithError error: RollaError) {}
    func rollaDidRefreshToken(_ rolla: Rolla, token: String, refreshToken: String?, expiresIn: TimeInterval?) {}
    func rollaDidRequestTokenRefresh(_ rolla: Rolla) {}
}
