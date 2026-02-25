import Foundation

struct ScanOptions: Sendable, Equatable {
    let allowDuplicates: Bool
    let serviceUUIDs: [NormalizedUUID]?

    init(allowDuplicates: Bool = true, serviceUUIDs: [NormalizedUUID]? = nil) {
        self.allowDuplicates = allowDuplicates
        self.serviceUUIDs = serviceUUIDs
    }
}
