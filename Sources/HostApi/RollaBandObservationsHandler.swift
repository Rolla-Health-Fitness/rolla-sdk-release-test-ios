import Foundation

extension BandBatteryFlutterApi: @unchecked Sendable { }

final class RollaBandObservationsHandler: @unchecked Sendable {
    private let rollaBandManager: RollaBandManager
    private let batteryFlutterApi: BandBatteryFlutterApiProtocol
    private let chargingStateFlutterApi: BandChargingStateFlutterApiProtocol
    private let logger: Logging

    private var batteryTask: Task<Void, Never>?
    private var chargingTask: Task<Void, Never>?

    init(
        rollaBandManager: RollaBandManager,
        batteryFlutterApi: BandBatteryFlutterApiProtocol,
        chargingStateFlutterApi: BandChargingStateFlutterApiProtocol,
        logger: Logging
    ) {
        self.rollaBandManager = rollaBandManager
        self.batteryFlutterApi = batteryFlutterApi
        self.chargingStateFlutterApi = chargingStateFlutterApi
        self.logger = logger

        self.batteryTask = Task { [weak self] in
            guard let self = self else { return }

            let batteryStream = await self.rollaBandManager.observeBatteryEvents()

            for await batteryData in batteryStream {
                if Task.isCancelled { break }

                self.logger.info("Battery level received: \(batteryData.batteryLevel)%", category: .deviceInfo)

                await MainActor.run {
                    self.batteryFlutterApi.onBatteryLevelReceived(
                        level: Int64(batteryData.batteryLevel)
                    ) { _ in }
                }
            }
        }

        self.chargingTask = Task { [weak self] in
            guard let self = self else { return }

            let chargingStream = await self.rollaBandManager.observeChargingStateEvents()

            for await chargingData in chargingStream {
                if Task.isCancelled { break }

                let stateString = chargingData.state == .charging ? "charging" : "not charging"
                self.logger.info("Charging state received: \(stateString)", category: .deviceInfo)

                let pigeonState: BandChargingState = chargingData.state == .charging ? .charging : .notCharging

                await MainActor.run {
                    self.chargingStateFlutterApi.onChargingStateReceived(
                        state: pigeonState
                    ) { _ in }
                }
            }
        }
    }

    deinit {
        batteryTask?.cancel()
        chargingTask?.cancel()
    }
}


