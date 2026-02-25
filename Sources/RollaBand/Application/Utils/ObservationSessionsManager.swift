import Foundation

public actor ObservationSessionsManager<Value: Sendable> {
    private struct ObservationSession {
        let observationTask: Task<Void, Never>
        let eventSource: EventStreamSource<Value>
        let rawStreamId: UUID
    }

    private let characteristicObserver: CharacteristicObserver
    private var deviceSessions: [BLEDeviceIdentifier: ObservationSession] = [:]

    public init(characteristicObserver: CharacteristicObserver) {
        self.characteristicObserver = characteristicObserver
    }
    
    func startObservation(
        for deviceUUID: BLEDeviceIdentifier,
        serviceUUID: NormalizedUUID,
        characteristicUUID: NormalizedUUID,
        parser: @escaping @Sendable (Data, BLEDeviceIdentifier) -> Value?
    ) async -> AsyncStream<Value> {

        if let existingSession = deviceSessions[deviceUUID] {
            let (stream, _) = await existingSession.eventSource.makeStream()
            return stream
        }

        let (rawDataStream, rawStreamId) = await characteristicObserver.observeNotifications(
            deviceID: deviceUUID,
            serviceUUID: serviceUUID,
            characteristicUUID: characteristicUUID
        )

        let eventSource = EventStreamSource<Value>()

        let observationTask = Task { [weak self] in
            for await data in rawDataStream {
                guard !Task.isCancelled else {
                    await eventSource.finishAll()
                    break
                }

                if let value = parser(data, deviceUUID) {
                    await eventSource.yield(value)
                }
            }

            await eventSource.finishAll()

            await self?.removeSession(for: deviceUUID)
        }

        let session = ObservationSession(
            observationTask: observationTask,
            eventSource: eventSource,
            rawStreamId: rawStreamId
        )

        deviceSessions[deviceUUID] = session

        let (stream, _) = await eventSource.makeStream()
        return stream
    }

    func stopObservation(for deviceUUID: BLEDeviceIdentifier) async {
        guard let session = deviceSessions[deviceUUID] else { return }

        session.observationTask.cancel()

        await session.eventSource.finishAll()

        await characteristicObserver.stopObservingNotifications(id: session.rawStreamId)

        deviceSessions.removeValue(forKey: deviceUUID)
    }

    func stopAllObservations() async {
        let deviceUUIDs = Array(deviceSessions.keys)

        for deviceUUID in deviceUUIDs {
            await stopObservation(for: deviceUUID)
        }
    }

    private func removeSession(for deviceUUID: BLEDeviceIdentifier) {
        deviceSessions.removeValue(forKey: deviceUUID)
    }
}

