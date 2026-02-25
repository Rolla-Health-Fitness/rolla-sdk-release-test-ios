import Foundation

public protocol LocationPermissionUseCase: Sendable {
    func requestAlwaysLocationPermission() async throws
}

public final class DefaultLocationPermissionUseCase: LocationPermissionUseCase {
    private let locationManager: LocationManaging
    private let logger: Logging

    public init(
        locationManager: LocationManaging,
        logger: Logging
    ) {
        self.locationManager = locationManager
        self.logger = logger
    }

    public func requestAlwaysLocationPermission() async throws {
        logger.info("Requesting always location permission", category: .location)
        
        do {
            try await locationManager.requestAlwaysLocationPermission()
            logger.success("Location permission request completed successfully", category: .location)
        } catch {
            logger.error("Location permission request failed: \(error)", category: .location)
            throw error
        }
    }
}

