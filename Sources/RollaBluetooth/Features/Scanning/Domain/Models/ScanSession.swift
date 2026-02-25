import Foundation

struct ScanSession: Sendable, Equatable, Identifiable {
    let id: UUID = UUID()
    let owner: String
    let filters: ScanFilters
}
