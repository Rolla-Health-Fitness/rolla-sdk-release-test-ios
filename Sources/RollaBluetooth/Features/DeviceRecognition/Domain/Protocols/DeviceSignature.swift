import Foundation

public protocol DeviceSignature: Sendable {
    var priority: Int { get }
    
    func recognize(name: String?, services: [NormalizedUUID], manufacturerData: Data?) -> RecognizedDevice?
}
