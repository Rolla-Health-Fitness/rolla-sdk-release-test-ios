import Foundation

public enum RollaBandWorkoutType: UInt8, Sendable, Codable {
    case run = 0
    case cycling = 1
    case badminton = 2
    case football = 3
    case tennis = 4
    case yoga = 5
    case meditation = 6
    case dance = 7
    case basketball = 8
    case walk = 9
    case workout = 10
    case cricket = 11
    case hiking = 12
    case aerobics = 13
    case pingPong = 14
    case ropeJump = 15
    case sitUps = 16
    case volleyball = 17

    var code: UInt8 {
        return self.rawValue
    }
}
