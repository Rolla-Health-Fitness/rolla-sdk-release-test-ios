import Foundation

public struct UserInfo: Sendable, Equatable {
    public let gender: Gender
    public let age: Int
    public let height: Int  // in cm
    public let weight: Double  // in kg

    public init(
        gender: Gender,
        age: Int,
        height: Int,
        weight: Double
    ) {
        self.gender = gender
        self.age = age
        self.height = height
        self.weight = weight
    }
}

public enum Gender: UInt8, Sendable, CaseIterable {
    case female = 0
    case male = 1

    public var displayName: String {
        switch self {
        case .female: return "Female"
        case .male: return "Male"
        }
    }
}


