import Foundation

final class LocationHostApiHandler: @unchecked Sendable {
    private let flutterApi: RollaBandGpsApi
    private let dependencies: LocationDependencies
    private var streamingTask: Task<Void, Never>?
    
    init(
        flutterApi: RollaBandGpsApi,
        dependencies: LocationDependencies
    ) {
        self.flutterApi = flutterApi
        self.dependencies = dependencies
    }
}

extension LocationHostApiHandler: LocationHostApi {
    func startLocationTracking(type: BandActivityType, completion: @escaping (Result<Void, any Error>) -> Void) {

        let completionResolver = CompletionResolver(completion)

        Task {
            do {
                let locationActivityType = convertToLocationActivityType(type)
                try await dependencies.locationTrackingUseCase.startLocationTracking(for: locationActivityType)
                
                let processedLocationStream = await dependencies.locationTrackingUseCase.getLocationStream()
                
                await startLocationStreaming(processedLocationStream)
                
                await MainActor.run {
                    completionResolver.resolve(.success(()))
                }
            } catch {
                await MainActor.run {
                    completionResolver.resolve(.failure(error))
                }
            }
        }
    }
    
    func stopLocationTracking(completion: @escaping (Result<Void, Error>) -> Void) {
        let completionResolver = CompletionResolver(completion)
        
        Task {
            await dependencies.locationTrackingUseCase.stopLocationTracking()
            await stopLocationStreaming()
            
            await MainActor.run {
                completionResolver.resolve(.success(()))
            }
        }
    }
    
    func requestAlwaysLocationPermission(completion: @escaping (Result<Void, any Error>) -> Void) {
        let completionResolver = CompletionResolver(completion)

        Task {
            do {
                try await dependencies.locationPermissionUseCase.requestAlwaysLocationPermission()

                await MainActor.run {
                    completionResolver.resolve(.success(()))
                }
            } catch {
                await MainActor.run {
                    completionResolver.resolve(.failure(error))
                }
            }
        }
    }
    
    private func startLocationStreaming(_ locationStream: AsyncStream<LocationData>) async {
        streamingTask = Task {
            do {
                for await locationData in locationStream {
                    try Task.checkCancellation()
                    
                    let gpsData = GpsData(
                        latitude: locationData.coordinate.latitude,
                        longitude: locationData.coordinate.longitude,
                        altitude: locationData.altitude,
                        timestamp: Int64(locationData.timestamp.timeIntervalSince1970)
                    )
                    
                    await MainActor.run {
                        flutterApi.onGpsDataReceived(data: gpsData) { _ in }
                    }
                }
            } catch { }
        }
    }
    
    private func stopLocationStreaming() async {
        streamingTask?.cancel()
        streamingTask = nil
    }

    private func convertToLocationActivityType(_ bandType: BandActivityType) -> LocationActivityType {
        switch bandType {
        case .walk:
            return .walk
        case .run:
            return .run
        case .cycling:
            return .cycling
        case .hiking:
            return .hiking
        default:
            return .other
        }
    }
}
