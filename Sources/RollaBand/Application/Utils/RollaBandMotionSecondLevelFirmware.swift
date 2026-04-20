import Foundation

/// Detects second-level motion firmware from common band version strings, e.g.
/// - `14.01.2026` (DD.MM.YYYY)
/// - `V_30353938-260114` (suffix **YYMMDD** after the last `-`, same style as user-info parsing)
enum RollaBandMotionSecondLevelFirmware {
    private static let dayMonthYearPattern: NSRegularExpression? = try? NSRegularExpression(
        pattern: #"(?:^|[^\d])(\d{2})\.(\d{2})\.(\d{4})(?:[^\d]|$)"#
    )

    private static let yyMMddSuffixPattern: NSRegularExpression? = try? NSRegularExpression(
        pattern: #"-(\d{6})$"#
    )

    static func isSupported(firmwareVersion: String?) -> Bool {
        guard let firmwareVersion = firmwareVersion?.trimmingCharacters(in: .whitespacesAndNewlines),
              !firmwareVersion.isEmpty
        else { return false }

        if let ymd = parseDayMonthYear(from: firmwareVersion) {
            return ymd >= (2026, 1, 14)
        }
        if let ymd = parseYYMMDDSuffix(from: firmwareVersion) {
            return ymd >= (2026, 1, 14)
        }
        return false
    }

    private static func parseDayMonthYear(from s: String) -> (Int, Int, Int)? {
        guard let pattern = dayMonthYearPattern else { return nil }
        let range = NSRange(location: 0, length: (s as NSString).length)
        guard let match = pattern.firstMatch(in: s, options: [], range: range),
              match.numberOfRanges >= 4,
              let dayR = Range(match.range(at: 1), in: s),
              let monthR = Range(match.range(at: 2), in: s),
              let yearR = Range(match.range(at: 3), in: s),
              let day = Int(s[dayR]),
              let month = Int(s[monthR]),
              let year = Int(s[yearR])
        else { return nil }
        return (year, month, day)
    }

    /// `-260114` → 2026-01-14 (YY MM DD)
    private static func parseYYMMDDSuffix(from s: String) -> (Int, Int, Int)? {
        guard let pattern = yyMMddSuffixPattern else { return nil }
        let range = NSRange(location: 0, length: (s as NSString).length)
        guard let match = pattern.firstMatch(in: s, options: [], range: range),
              match.numberOfRanges >= 2,
              let g = Range(match.range(at: 1), in: s),
              s[g].count == 6
        else { return nil }

        let digits = String(s[g])
        guard let yy = Int(digits.prefix(2)),
              let mm = Int(digits.dropFirst(2).prefix(2)),
              let dd = Int(digits.suffix(2))
        else { return nil }

        return (2000 + yy, mm, dd)
    }
}
