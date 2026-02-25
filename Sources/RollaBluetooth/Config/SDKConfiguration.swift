import Foundation

public struct SDKConfiguration: Sendable {
    public let bluetoothQueueLabel: String
    public let recognitionPlugins: [DeviceRecognitionPlugin]
    public let isDebugLoggingEnabled: Bool
    public let logLevel: LogLevel

    public init(
        bluetoothQueueLabel: String = "rolla.bluetooth.sdk",
        recognitionPlugins: [DeviceRecognitionPlugin] = [],
        isDebugLoggingEnabled: Bool = false,
        logLevel: LogLevel = .info
    ) {
        self.bluetoothQueueLabel = bluetoothQueueLabel
        self.recognitionPlugins = recognitionPlugins
        self.isDebugLoggingEnabled = isDebugLoggingEnabled
        self.logLevel = logLevel
    }

    public static let `default` = SDKConfiguration(
        bluetoothQueueLabel: "rolla.bluetooth.sdk",
        recognitionPlugins: [],
        isDebugLoggingEnabled: false,
        logLevel: .info
    )
}
