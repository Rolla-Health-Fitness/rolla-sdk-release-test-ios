
public protocol RollaBandRequestCommand: BLECommand {
    func execute(
        using commandExecutor: CommandExecutor,
        observer: CharacteristicObserver
    ) async throws -> Output
}
