import Foundation

public extension Array where Element == UInt8 {
    mutating func withChecksum() {
        guard !isEmpty else { return }
        let sum = self[0..<count - 1].reduce(0) { $0 + Int($1) }
        self[count - 1] = UInt8(sum & 0xFF)
    }
    
    mutating func fillTimestamp(from timestamp: Int) {
        guard count >= 10 else { return }

        let date = Date(timeIntervalSince1970: TimeInterval(timestamp / 1000))
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(abbreviation: "UTC") ?? TimeZone.current

        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)

        self[4] = toBCD((components.year ?? 0) % 100)
        self[5] = toBCD(components.month ?? 0)
        self[6] = toBCD(components.day ?? 0)
        self[7] = toBCD(components.hour ?? 0)
        self[8] = toBCD(components.minute ?? 0)
        self[9] = toBCD(components.second ?? 0)
    }
}
