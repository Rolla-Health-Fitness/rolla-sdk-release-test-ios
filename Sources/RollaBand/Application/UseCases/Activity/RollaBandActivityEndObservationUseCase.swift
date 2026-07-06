import Foundation

/// Concrete marker yielded when the band ends an activity on its own. A struct
/// (never `Void`) so it satisfies `ObservationSessionsManager`'s `Value: Sendable`
/// constraint, matching the other observation values (HeartRateData, etc.).
public struct RollaBandActivityEndMarker: Sendable {
    public init() {}
}

public protocol ActivityEndObservationUseCase: Sendable {
    func observeActivityEndedByBand(for deviceId: String) async throws -> AsyncStream<RollaBandActivityEndMarker>
    func stopObservingActivityEnd(for deviceId: String) async throws
}

/// Standing router for the band's SPONTANEOUS end-of-exercise frames on the notify
/// characteristic (FFF7). The band ends an activity on its own (charger attach,
/// firmware auto-end, user pressing stop on the band) by emitting:
///   • `0x16 06 00` — the "exercise End" push (JStyle §27), and/or
///   • `0x18 0xFF`  — the per-second exercise heartbeat carrying the 0xFF
///                    "exercise mode ended" sentinel (JStyle §29).
/// Neither is detected today: the live HR parser drops `0x18 0xFF` (returns nil),
/// and `0x16 06 00` is only matched by the EPHEMERAL listener inside
/// `ActivityControlCommand` — which exists only while the host is sending a
/// start/stop. With no command in flight the frames are dropped and the iOS HR
/// stream simply goes silent, freezing the UI and losing the workout (QA-207).
///
/// This use case installs a standing observation (its OWN
/// `ObservationSessionsManager` instance on the shared FFF7 characteristic, which
/// fans out independently of the HR observer) and yields a marker on the first
/// end frame so the host can auto-finalize the activity and notify the user.
public final class RollaBandActivityEndObservationUseCase: ActivityEndObservationUseCase {
    private let observationManager: ObservationSessionsManager<RollaBandActivityEndMarker>
    private let deviceIdentityManager: DeviceIdentityManaging
    private let deviceManager: DeviceManager
    private let commandExecutor: CommandExecutor
    private let logger: Logging

    public init(
        observationManager: ObservationSessionsManager<RollaBandActivityEndMarker>,
        deviceIdentityManager: DeviceIdentityManaging,
        deviceManager: DeviceManager,
        commandExecutor: CommandExecutor,
        logger: Logging
    ) {
        self.observationManager = observationManager
        self.deviceIdentityManager = deviceIdentityManager
        self.deviceManager = deviceManager
        self.commandExecutor = commandExecutor
        self.logger = logger
    }

    /// Returns a marker when `data` is a band-initiated end frame, else nil.
    /// Static + free of captured state so it satisfies the `@Sendable` parser.
    static func parseActivityEnd(from data: Data) -> RollaBandActivityEndMarker? {
        let bytes = [UInt8](data)

        // 0x16 06 00 — band-initiated "exercise End" push.
        if bytes.count >= 3, bytes[0] == 0x16, bytes[1] == 0x06, bytes[2] == 0x00 {
            return RollaBandActivityEndMarker()
        }

        // 0x18 0xFF — exercise heartbeat carrying the "ended" sentinel (R5).
        // We surface this as an end event but never as a BPM value (the HR
        // parser still drops the 0xFF so no 255 reaches metrics).
        if bytes.count >= 2, bytes[0] == 0x18, bytes[1] == 0xFF {
            return RollaBandActivityEndMarker()
        }

        return nil
    }
}

extension RollaBandActivityEndObservationUseCase {
    public func observeActivityEndedByBand(for deviceId: String) async throws -> AsyncStream<RollaBandActivityEndMarker> {

        guard let deviceUUID = await deviceIdentityManager.resolveDeviceIdentifier(deviceId) else {
            throw BLEPeripheralError.deviceNotFound(deviceId)
        }

        guard await deviceManager.isDeviceConnected(deviceUUID: deviceUUID) else {
            throw BLEConnectionError.deviceNotConnected(deviceUUID)
        }

        let deviceName = await deviceManager.getDeviceName(deviceId: deviceUUID)

        try await commandExecutor.execute(EnableNotificationCommand(
            deviceID: deviceUUID,
            serviceUUID: BLEServiceType.rollaBand.uuid,
            characteristicUUID: BLECharacteristicType.rollaBandNotification.uuid,
            timeout: 10.0
        ))

        let stream = await observationManager.startObservation(
            for: deviceUUID,
            serviceUUID: BLEServiceType.rollaBand.uuid,
            characteristicUUID: BLECharacteristicType.rollaBandNotification.uuid,
            parser: { data, _ in
                RollaBandActivityEndObservationUseCase.parseActivityEnd(from: data)
            }
        )

        logger.success("Started band-end observation for \(deviceName ?? "Unknown Device")", category: .workout)

        return stream
    }

    public func stopObservingActivityEnd(for deviceId: String) async throws {
        guard let deviceUUID = await deviceIdentityManager.resolveDeviceIdentifier(deviceId) else {
            throw BLEPeripheralError.deviceNotFound(deviceId)
        }

        await observationManager.stopObservation(for: deviceUUID)

        logger.success("Stopped band-end observation for device \(deviceId)", category: .workout)
    }
}
