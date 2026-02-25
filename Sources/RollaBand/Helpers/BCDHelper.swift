import Foundation

@inline(__always) func toBCD(_ v: Int) -> UInt8 {
    let tens = (v / 10) % 10
    let ones = v % 10
    return UInt8((tens << 4) | ones)
}

@inline(__always) func fromBCD(_ b: UInt8) -> Int {
    Int((b >> 4) & 0x0F) * 10 + Int(b & 0x0F)
}


