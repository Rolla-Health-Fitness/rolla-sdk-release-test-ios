import Foundation

public struct NormalizedUUID: Equatable, Hashable, Sendable {
    public let uuidString: String
    
    public init(stringIdentifier: String) {
        self.uuidString = Self.normalize(stringIdentifier)
    }
    
    public var normalizedShortForm: String {
        let clean = uuidString.replacingOccurrences(of: "-", with: "")
        
        if uuidString.hasPrefix("0000") && uuidString.hasSuffix("-0000-1000-8000-00805F9B34FB") {
            return String(clean.dropFirst(4).prefix(4))
        }
        
        return String(clean.prefix(4))
    }
    
    private static func normalize(_ uuid: String) -> String {
        let cleaned = uuid.replacingOccurrences(of: "-", with: "").uppercased()
        
        if cleaned.count == 4 {
            return "0000\(cleaned)-0000-1000-8000-00805F9B34FB"
        }
        
        if cleaned.count == 8 {
            return "\(cleaned)-0000-1000-8000-00805F9B34FB"
        }
        
        if cleaned.count == 32 {
            let uuid = cleaned
            return "\(uuid.prefix(8))-\(uuid.dropFirst(8).prefix(4))-\(uuid.dropFirst(12).prefix(4))-\(uuid.dropFirst(16).prefix(4))-\(uuid.dropFirst(20))"
        }
        
        return uuid.uppercased()
    }
}
