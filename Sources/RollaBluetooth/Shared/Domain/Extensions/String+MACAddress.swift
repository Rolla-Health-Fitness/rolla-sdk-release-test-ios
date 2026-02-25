import Foundation

public extension String {
    var isValidMACAddress: Bool {
        let macRegex = "^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$"
        let macTest = NSPredicate(format: "SELF MATCHES %@", macRegex)
        return macTest.evaluate(with: self)
    }

    var isValidAppleUUID: Bool {
        return UUID(uuidString: self) != nil
    }
}
