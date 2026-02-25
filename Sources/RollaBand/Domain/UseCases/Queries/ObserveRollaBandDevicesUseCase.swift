import Foundation

public protocol ObserveRollaBandDevicesUseCase: Sendable {
    func execute() async -> AsyncStream<[RollaBandDevice]>
}

