import Foundation

enum PeripheralOperationResult: Sendable {
    case services([BLEService])
    case characteristics([BLECharacteristic])
    case value(Data?)
    case notification(Data?)
    case void
}
