import Foundation

public struct BLEDeviceIdentifier: Equatable, Hashable, Sendable, Codable {
    public let value: UUID
    
    public init(_ uuid: UUID) {
        self.value = uuid
    }
    
    public init?(_ string: String) {
        guard let uuid = UUID(uuidString: string) else {
            return nil
        }
        self.value = uuid
    }
    
    public var uuidString: String {
        value.uuidString.uppercased()
    }
}

public struct MACAddress: Equatable, Hashable, Sendable {
    public let value: String

    public init?(_ string: String) {
        guard string.isValidMACAddress else {
            return nil
        }
        self.value = string
    }
}
