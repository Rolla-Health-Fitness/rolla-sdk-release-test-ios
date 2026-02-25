import Foundation

extension Data {
    var extractedMACAddress: String? {
        guard count >= 6 else { return nil }
        
        let macBytes = suffix(6)
        let macAddress = macBytes
            .map { String(format: "%02X", $0) }
            .joined(separator: ":")
        
        let macPattern = "^([0-9A-F]{2}:){5}[0-9A-F]{2}$"
        let regex = try? NSRegularExpression(pattern: macPattern)
        let range = NSRange(location: 0, length: macAddress.count)
        
        guard regex?.firstMatch(in: macAddress, options: [], range: range) != nil else {
            return nil
        }
        
        return macAddress
    }
}

