import Foundation

public enum BLECharacteristicProperty: String, Sendable, Equatable, Hashable, CaseIterable {
    case read = "read"
    case write = "write"
    case writeWithoutResponse = "write_without_response"
    case notify = "notify"
    case indicate = "indicate"
    case authenticatedSignedWrites = "authenticated_signed_writes"
    case extendedProperties = "extended_properties"
    case notifyEncryptionRequired = "notify_encryption_required"
    case indicateEncryptionRequired = "indicate_encryption_required"
}
