import Foundation
import CoreBluetooth

extension CBBluetoothState {
    init(cbState: CBManagerState) {
        switch cbState {
        case .unknown:      self = .unknown
        case .resetting:    self = .resetting
        case .unsupported:  self = .unsupported
        case .unauthorized: self = .unauthorized
        case .poweredOff:   self = .poweredOff
        case .poweredOn:    self = .poweredOn
        @unknown default:   self = .unknown
        }
    }
}
