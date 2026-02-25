import Foundation

public final class DefaultLocationTrackingUseCase: LocationTrackingUseCase {
    private let logger: Logging
    private let locationManager: CoreLocationManager
    private let dataProcessor: LocationDataProcessing

    public init(
        coreLocationManager: CoreLocationManager,
        dataProcessor: LocationDataProcessing,
        logger: Logging
    ) {
        self.logger = logger
        self.locationManager = coreLocationManager
        self.dataProcessor = dataProcessor
    }
    
    public func startLocationTracking(for activityType: LocationActivityType) async throws {
        guard !(await locationManager.isLocationTracking()) else {
            logger.info("Location tracking is already active", category: .location)
            return
        }

        logger.info("Starting location tracking for activity: \(activityType)", category: .location)

        await dataProcessor.updateConfiguration(for: activityType)
        await dataProcessor.resetCalibration()
        await dataProcessor.setTrackingStartTime(Date())

        await locationManager.setCurrentActivityType(activityType)
        try await locationManager.startLocationTracking(
            config: LocationTrackingConfig.forActivity(activityType)
        )

        logger.success("Location tracking started successfully for \(activityType)", category: .location)
    }
    
    public func stopLocationTracking() async {
        await locationManager.stopLocationTracking()
        logger.success("Location tracking stopped", category: .location)
    }

    public func getLocationStream() async -> AsyncStream<LocationData> {
        let rawLocationStream = await locationManager.locationStream()

        return AsyncStream<LocationData> { continuation in
            let task = Task {
                for await rawLocation in rawLocationStream {
                    if Task.isCancelled {
                        break
                    }

                    if let processedLocation = await dataProcessor.processLocation(rawLocation) {
                        continuation.yield(processedLocation)
                    }
                }
                continuation.finish()
            }

            continuation.onTermination = { _ in
                task.cancel()
            }
        }
    }

    public func resetCalibration() async {
        await dataProcessor.resetCalibration()
    }
}
