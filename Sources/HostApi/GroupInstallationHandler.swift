import Foundation

/// Per-install marker for group sessions.
///
/// Stored in Application Support and excluded from backup, so it is created once per
/// installation, never restored onto another device, and gone after an uninstall. Combined
/// with the keychain-backed installation id it lets the SDK tell a reinstall from an app
/// update, which the keychain alone cannot do because it outlives the app.
final class GroupInstallationHandler: GroupInstallationHostApi {
    private static let markerFile = "rolla_group_installation"

    func installationMarker() throws -> String {
        do {
            let directory = try FileManager.default.url(
                for: .applicationSupportDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: true
            )
            var url = directory.appendingPathComponent(Self.markerFile)
            var attributes = URLResourceValues()
            attributes.isExcludedFromBackup = true
            let value: String
            if FileManager.default.fileExists(atPath: url.path) {
                value = try String(contentsOf: url, encoding: .utf8)
            } else {
                value = UUID().uuidString.lowercased()
                try value.write(to: url, atomically: true, encoding: .utf8)
            }
            try url.setResourceValues(attributes)
            return value
        } catch {
            throw PigeonError(code: "STORAGE_UNAVAILABLE", message: "Installation storage unavailable", details: nil)
        }
    }
}
