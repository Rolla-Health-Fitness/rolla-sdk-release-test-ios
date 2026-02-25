import Foundation

public enum RollaBluetoothSDK {
    public static func configure(with configuration: SDKConfiguration) {
        RollaBluetoothDependencies.configure(with: configuration)
    }
}

