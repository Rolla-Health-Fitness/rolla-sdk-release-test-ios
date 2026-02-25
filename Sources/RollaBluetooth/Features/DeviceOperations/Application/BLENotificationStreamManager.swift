import Foundation

private struct BLECharacteristicKey: Hashable, Sendable {
    let deviceUUID: BLEDeviceIdentifier
    let serviceUUID: NormalizedUUID
    let characteristicUUID: NormalizedUUID

    init(
        deviceUUID: BLEDeviceIdentifier,
        serviceUUID: NormalizedUUID,
        characteristicUUID: NormalizedUUID
    ) {
        self.deviceUUID = deviceUUID
        self.serviceUUID = serviceUUID
        self.characteristicUUID = characteristicUUID
    }
}

actor BLENotificationStreamManager: BLENotificationStreamManaging {
    private var characteristicStreams: [BLECharacteristicKey: EventStreamSource<Data>] = [:]
    private var streamToCharacteristic: [UUID: BLECharacteristicKey] = [:]

    func observeNotifications(
        deviceID: BLEDeviceIdentifier,
        serviceUUID: NormalizedUUID,
        characteristicUUID: NormalizedUUID
    ) async -> (stream: AsyncStream<Data>, id: UUID) {

        let key = BLECharacteristicKey(
            deviceUUID: deviceID,
            serviceUUID: serviceUUID,
            characteristicUUID: characteristicUUID
        )

        let eventStream: EventStreamSource<Data>
        if let existing = characteristicStreams[key] {
            eventStream = existing
        } else {
            eventStream = EventStreamSource<Data>(
                maxContinuations: 50,
                bufferingPolicy: .unbounded
            )
            characteristicStreams[key] = eventStream
        }

        let (stream, id) = await eventStream.makeStream()
        streamToCharacteristic[id] = key

        let totalStreams = await eventStream.streamCount
        
        return (stream, id)
    }

    func stopObservingNotifications(id: UUID) async {
        guard let characteristicKey = streamToCharacteristic[id] else {
            return
        }

        guard let eventStream = characteristicStreams[characteristicKey] else {
            streamToCharacteristic.removeValue(forKey: id)
            return
        }

        let streamCountBefore = await eventStream.streamCount

        await eventStream.finishStream(id: id)

        streamToCharacteristic.removeValue(forKey: id)

        let streamCountAfter = await eventStream.streamCount

        if await eventStream.isEmpty {
            characteristicStreams.removeValue(forKey: characteristicKey)
        }
    }

    @available(*, deprecated, message: "Use observeNotifications() with manual timeout logic instead")
    func waitForNotification(
        deviceID: BLEDeviceIdentifier,
        serviceUUID: NormalizedUUID,
        characteristicUUID: NormalizedUUID,
        timeout: TimeInterval,
        matcher: NotificationMatcher?
    ) async throws -> Data? {
        let (stream, streamId) = await observeNotifications(
            deviceID: deviceID,
            serviceUUID: serviceUUID,
            characteristicUUID: characteristicUUID
        )

        defer {
            Task {
                await stopObservingNotifications(id: streamId)
            }
        }

        return try await withThrowingTaskGroup(of: Data?.self) { group in
            group.addTask {
                for await data in stream {
                    if matcher?.matches(data) ?? true {
                        return data
                    }
                }
                throw BLEPeripheralError.timeout
            }

            group.addTask {
                try await Task.sleep(nanoseconds: UInt64(timeout * 1_000_000_000))
                throw BLEPeripheralError.timeout
            }

            guard let result = try await group.next() else {
                throw BLEPeripheralError.timeout
            }

            group.cancelAll()
            return result
        }
    }

    func handleDidUpdateValueFor(
        characteristic: BLECharacteristic,
        serviceUUID: NormalizedUUID?,
        deviceUUID: BLEDeviceIdentifier,
        data: Data?,
        error: Error?
    ) async {
        guard let serviceUUID, let data, error == nil else {
            return
        }

        let matchingKeys = characteristicStreams.keys.filter { key in
            key.deviceUUID == deviceUUID &&
            key.serviceUUID == serviceUUID &&
            key.characteristicUUID == characteristic.uuid
        }

        if matchingKeys.isEmpty {
            return
        }

        for key in matchingKeys {
            if let eventStream = characteristicStreams[key] {
                let streamCount = await eventStream.streamCount
                await eventStream.yield(data)
            }
        }
    }
    
    func cleanupNotificationStream(
        for deviceUUID: BLEDeviceIdentifier,
        serviceUUID: NormalizedUUID,
        characteristicUUID: NormalizedUUID
    ) async {
        let key = BLECharacteristicKey(
            deviceUUID: deviceUUID,
            serviceUUID: serviceUUID,
            characteristicUUID: characteristicUUID
        )

        guard let eventStream = characteristicStreams[key] else { return }

        await eventStream.finishAll()

        characteristicStreams.removeValue(forKey: key)

        let streamIdsToRemove = streamToCharacteristic.filter { $0.value == key }.map { $0.key }
        for streamId in streamIdsToRemove {
            streamToCharacteristic.removeValue(forKey: streamId)
        }
    }

    func cleanupNotificationStreams(for deviceUUID: BLEDeviceIdentifier) async {
        let keysToRemove = characteristicStreams.keys.filter { $0.deviceUUID == deviceUUID }

        for key in keysToRemove {
            await cleanupNotificationStream(
                for: key.deviceUUID,
                serviceUUID: key.serviceUUID,
                characteristicUUID: key.characteristicUUID
            )
        }
    }
    
    func cleanupAllNotificationStreams() async {
        for eventStream in characteristicStreams.values {
            await eventStream.finishAll()
        }

        characteristicStreams.removeAll()
        streamToCharacteristic.removeAll()
    }
}
