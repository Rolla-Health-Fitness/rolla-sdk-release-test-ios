import Foundation
import CoreMotion

final class PhonePedometerHandler: NSObject, PhonePedometerHostApi {
    private let flutterApi: PhonePedometerFlutterApiProtocol
    private let pedometer = CMPedometer()
    private var isRunning = false

    init(flutterApi: PhonePedometerFlutterApiProtocol) {
        self.flutterApi = flutterApi
        super.init()
    }

    deinit {
        if isRunning {
            pedometer.stopUpdates()
        }
    }

    func startPedometerUpdates(completion: @escaping (Result<Void, any Error>) -> Void) {
        guard CMPedometer.isStepCountingAvailable() else {
            completion(.failure(PedometerError.stepCountingUnavailable))
            return
        }
        guard !isRunning else {
            completion(.success(()))
            return
        }
        isRunning = true
        pedometer.startUpdates(from: Date()) { [weak self] data, error in
            guard let self, self.isRunning else { return }
            guard let data, error == nil else { return }

            let totalSteps = data.numberOfSteps.intValue
            let cadence: Int
            if let currentCadence = data.currentCadence {
                cadence = Int(currentCadence.doubleValue * 60.0)
            } else {
                cadence = 0
            }
            let distance: Double? = data.distance?.doubleValue

            DispatchQueue.main.async {
                self.flutterApi.onStepUpdate(
                    totalSteps: Int64(totalSteps),
                    cadenceSpm: Int64(cadence),
                    distanceMeters: distance
                ) { _ in }
            }
        }
        completion(.success(()))
    }

    func stopPedometerUpdates(completion: @escaping (Result<Void, any Error>) -> Void) {
        isRunning = false
        pedometer.stopUpdates()
        completion(.success(()))
    }

    func requestPermission(completion: @escaping (Result<PedometerPermissionStatus, any Error>) -> Void) {
        guard CMPedometer.isStepCountingAvailable() else {
            completion(.success(.restricted))
            return
        }

        let current = CMPedometer.authorizationStatus()
        switch current {
        case .authorized:
            completion(.success(.granted))
        case .denied:
            completion(.success(.denied))
        case .restricted:
            completion(.success(.restricted))
        case .notDetermined:
            // Trigger the system prompt by starting a short-lived pedometer session.
            // The handler fires once the user responds to the dialog.
            let probe = CMPedometer()
            probe.startUpdates(from: Date()) { _, _ in
                probe.stopUpdates()
                let resolved = CMPedometer.authorizationStatus()
                DispatchQueue.main.async {
                    switch resolved {
                    case .authorized:
                        completion(.success(.granted))
                    case .denied:
                        completion(.success(.denied))
                    case .restricted:
                        completion(.success(.restricted))
                    default:
                        completion(.success(.denied))
                    }
                }
            }
        @unknown default:
            completion(.success(.notDetermined))
        }
    }
}

private enum PedometerError: LocalizedError {
    case stepCountingUnavailable

    var errorDescription: String? {
        switch self {
        case .stepCountingUnavailable:
            return "Step counting is not available on this device"
        }
    }
}
