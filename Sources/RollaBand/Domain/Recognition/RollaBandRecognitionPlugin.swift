import Foundation

public struct RollaBandRecognitionPlugin: DeviceRecognitionPlugin {
    public let name = "RollaBand"
    
    public var signatures: [DeviceSignature] {
        return [
            RollaBandPrimarySignature()
        ]
    }
    
    public init() {}
}
