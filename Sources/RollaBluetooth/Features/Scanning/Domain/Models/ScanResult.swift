import Foundation

struct ScanResult: Sendable, Equatable {
    let deviceUUID: UUID
    let name: String?
    let rssi: Int
    let advertisedServices: [NormalizedUUID]
    let manufacturerData: Data?
    let timestamp: Date = Date()
}
