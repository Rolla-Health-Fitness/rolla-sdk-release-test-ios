import Foundation

public protocol DeviceRecognitionPlugin: Sendable {
    var name: String { get }
    var signatures: [DeviceSignature] { get }
}
