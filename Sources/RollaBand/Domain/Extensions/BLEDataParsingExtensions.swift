import Foundation

extension Data {
    var bytes: [UInt8] {
        return Array(self)
    }
    
    func hasMinimumLength(_ length: Int) -> Bool {
        return count >= length
    }
    
    func hasExactLength(_ length: Int) -> Bool {
        return count == length
    }
    
    func hasLengthInRange(_ range: ClosedRange<Int>) -> Bool {
        return range.contains(count)
    }
}

extension Array where Element == UInt8 {
    func uint8(at index: Int) -> UInt8? {
        guard index < count else { return nil }
        return self[index]
    }
    
    func uint16LE(at index: Int) -> UInt16? {
        guard index + 1 < count else { return nil }
        return UInt16(self[index]) | (UInt16(self[index + 1]) << 8)
    }

    func uint16BE(at index: Int) -> UInt16? {
        guard index + 1 < count else { return nil }
        return (UInt16(self[index]) << 8) | UInt16(self[index + 1])
    }

    func uint32LE(at index: Int) -> UInt32? {
        guard index + 3 < count else { return nil }
        return UInt32(self[index]) |
               (UInt32(self[index + 1]) << 8) |
               (UInt32(self[index + 2]) << 16) |
               (UInt32(self[index + 3]) << 24)
    }

    func uint32BE(at index: Int) -> UInt32? {
        guard index + 3 < count else { return nil }
        return (UInt32(self[index]) << 24) |
               (UInt32(self[index + 1]) << 16) |
               (UInt32(self[index + 2]) << 8) |
               UInt32(self[index + 3])
    }
    
    func int8(at index: Int) -> Int8? {
        guard let value = uint8(at: index) else { return nil }
        return Int8(bitPattern: value)
    }

    func int16LE(at index: Int) -> Int16? {
        guard let value = uint16LE(at: index) else { return nil }
        return Int16(bitPattern: value)
    }

    func int16BE(at index: Int) -> Int16? {
        guard let value = uint16BE(at: index) else { return nil }
        return Int16(bitPattern: value)
    }

    func int32LE(at index: Int) -> Int32? {
        guard let value = uint32LE(at: index) else { return nil }
        return Int32(bitPattern: value)
    }

    func int32BE(at index: Int) -> Int32? {
        guard let value = uint32BE(at: index) else { return nil }
        return Int32(bitPattern: value)
    }

    func floatLE(at index: Int) -> Float? {
        guard let value = uint32LE(at: index) else { return nil }
        return Float(bitPattern: value)
    }

    func floatBE(at index: Int) -> Float? {
        guard let value = uint32BE(at: index) else { return nil }
        return Float(bitPattern: value)
    }

    func doubleFromFloatLE(at index: Int) -> Double? {
        guard let floatValue = floatLE(at: index) else { return nil }
        return Double(floatValue)
    }

    func doubleFromFloatBE(at index: Int) -> Double? {
        guard let floatValue = floatBE(at: index) else { return nil }
        return Double(floatValue)
    }

    func subarray(from startIndex: Int, length: Int) -> [UInt8]? {
        guard startIndex >= 0,
              startIndex + length <= count else { return nil }
        return Array(self[startIndex..<(startIndex + length)])
    }

    func isBitSet(at byteIndex: Int, bit: Int) -> Bool? {
        guard let byte = uint8(at: byteIndex),
              bit >= 0, bit < 8 else { return nil }
        return (byte & (1 << bit)) != 0
    }

    func extractBits(at byteIndex: Int, mask: UInt8, shift: Int = 0) -> UInt8? {
        guard let byte = uint8(at: byteIndex) else { return nil }
        return (byte & mask) >> shift
    }
}

//TODO: REMOVE THIs
public struct BLEDataParser {
    private let bytes: [UInt8]
    private var currentIndex: Int = 0
    
    public init(bytes: [UInt8]) {
        self.bytes = bytes
    }
    
    public init(data: Data) {
        self.bytes = data.bytes
    }
    
    public mutating func readUInt8() -> UInt8? {
        guard currentIndex < bytes.count else { return nil }
        let value = bytes[currentIndex]
        currentIndex += 1
        return value
    }
    
    public mutating func readInt8() -> Int8? {
        guard let value = readUInt8() else { return nil }
        return Int8(bitPattern: value)
    }
    
    public mutating func readUInt16LE() -> UInt16? {
        guard let value = bytes.uint16LE(at: currentIndex) else { return nil }
        currentIndex += 2
        return value
    }

    public mutating func readUInt16BE() -> UInt16? {
        guard let value = bytes.uint16BE(at: currentIndex) else { return nil }
        currentIndex += 2
        return value
    }

    public mutating func readInt16LE() -> Int16? {
        guard let value = readUInt16LE() else { return nil }
        return Int16(bitPattern: value)
    }

    public mutating func readInt16BE() -> Int16? {
        guard let value = readUInt16BE() else { return nil }
        return Int16(bitPattern: value)
    }

    public mutating func readUInt32LE() -> UInt32? {
        guard let value = bytes.uint32LE(at: currentIndex) else { return nil }
        currentIndex += 4
        return value
    }

    public mutating func readUInt32BE() -> UInt32? {
        guard let value = bytes.uint32BE(at: currentIndex) else { return nil }
        currentIndex += 4
        return value
    }

    public mutating func readInt32LE() -> Int32? {
        guard let value = readUInt32LE() else { return nil }
        return Int32(bitPattern: value)
    }

    public mutating func readInt32BE() -> Int32? {
        guard let value = readUInt32BE() else { return nil }
        return Int32(bitPattern: value)
    }

    public mutating func readFloatLE() -> Float? {
        guard let value = bytes.floatLE(at: currentIndex) else { return nil }
        currentIndex += 4
        return value
    }

    public mutating func readFloatBE() -> Float? {
        guard let value = bytes.floatBE(at: currentIndex) else { return nil }
        currentIndex += 4
        return value
    }

    public mutating func readDoubleFromFloatLE() -> Double? {
        guard let value = bytes.doubleFromFloatLE(at: currentIndex) else { return nil }
        currentIndex += 4
        return value
    }

    public mutating func readDoubleFromFloatBE() -> Double? {
        guard let value = bytes.doubleFromFloatBE(at: currentIndex) else { return nil }
        currentIndex += 4
        return value
    }

    public mutating func readBytes(count: Int) -> [UInt8]? {
        guard let subarray = bytes.subarray(from: currentIndex, length: count) else { return nil }
        currentIndex += count
        return subarray
    }
    
    public func isBitSet(at byteOffset: Int, bit: Int) -> Bool? {
        let absoluteIndex = currentIndex + byteOffset
        return bytes.isBitSet(at: absoluteIndex, bit: bit)
    }
    
    public func extractBits(at byteOffset: Int, mask: UInt8, shift: Int = 0) -> UInt8? {
        let absoluteIndex = currentIndex + byteOffset
        return bytes.extractBits(at: absoluteIndex, mask: mask, shift: shift)
    }
    
    public var hasMoreData: Bool {
        return currentIndex < bytes.count
    }
    
    public var remainingBytes: Int {
        return max(0, bytes.count - currentIndex)
    }
    
    public var currentPosition: Int {
        return currentIndex
    }
    
    public var totalBytes: Int {
        return bytes.count
    }
    
    public mutating func skip(bytes: Int) -> Bool {
        guard currentIndex + bytes <= self.bytes.count else { return false }
        currentIndex += bytes
        return true
    }
    
    public mutating func reset() {
        currentIndex = 0
    }
    
    public mutating func seek(to position: Int) -> Bool {
        guard position >= 0 && position <= bytes.count else { return false }
        currentIndex = position
        return true
    }
}
