import Foundation
import CoreBluetooth
import CoreLocation

/// Handles iOS permission requests for Bluetooth and Location
/// Implements the RollaPermissionsHostApi Pigeon interface
///
/// This class manages:
/// - Bluetooth permission via CBCentralManager
/// - Location permission via CLLocationManager
/// - Async completion handling for permission dialogs
final class RollaPermissionsHandler: NSObject, RollaPermissionsHostApi {

    // MARK: - Properties

    /// Bluetooth manager for triggering and checking Bluetooth permissions
    private var bluetoothManager: CBCentralManager?

    /// Location manager for triggering and checking Location permissions
    private var locationManager: CLLocationManager?

    /// Completion handler for Bluetooth permission request
    /// Called when user responds to the system permission dialog
    private var bluetoothCompletion: ((Result<Bool, Error>) -> Void)?

    /// Completion handler for Location permission request
    /// Called when user responds to the system permission dialog
    private var locationCompletion: ((Result<Bool, Error>) -> Void)?

    // MARK: - RollaPermissionsHostApi Implementation

    /// Check current Bluetooth permission status
    /// - Parameter completion: Result with true if granted, false otherwise
    func checkBluetoothStatus(completion: @escaping (Result<Bool, Error>) -> Void) {
        let granted = checkBluetoothStatusInternal()
        completion(.success(granted))
    }

    /// Check current Location permission status
    /// - Parameter completion: Result with true if granted (WhenInUse or Always), false otherwise
    func checkLocationStatus(completion: @escaping (Result<Bool, Error>) -> Void) {
        let granted = checkLocationStatusInternal()
        completion(.success(granted))
    }

    /// Check current Background Location permission status
    /// - Parameter completion: Result with true if Always authorization is granted, false otherwise
    func checkBackgroundLocationStatus(completion: @escaping (Result<Bool, Error>) -> Void) {
        let granted = checkBackgroundLocationStatusInternal()
        completion(.success(granted))
    }

    /// Request Bluetooth permission from user
    /// Shows system permission dialog if not yet determined
    /// - Parameter completion: Result with true if granted, false if denied/restricted
    func requestBluetoothPermission(completion: @escaping (Result<Bool, Error>) -> Void) {
        requestBluetoothPermissionInternal { granted in
            completion(.success(granted))
        }
    }

    /// Request Location permission from user
    /// Shows system permission dialog if not yet determined
    /// - Parameter completion: Result with true if granted, false if denied/restricted
    func requestLocationPermission(completion: @escaping (Result<Bool, Error>) -> Void) {
        requestLocationPermissionInternal { granted in
            completion(.success(granted))
        }
    }

    // MARK: - Internal Permission Checks

    /// Internal Bluetooth status check
    /// - Returns: true if Bluetooth permission is granted
    private func checkBluetoothStatusInternal() -> Bool {
        if #available(iOS 13.1, *) {
            let status = CBCentralManager.authorization
            print("📱 [RollaPermissions] Bluetooth status: \(status.rawValue)")
            return status == .allowedAlways
        } else if #available(iOS 13.0, *) {
            // For iOS 13.0, reuse existing manager or create one
            if bluetoothManager == nil {
                bluetoothManager = CBCentralManager(
                    delegate: self,
                    queue: .global(qos: .userInitiated)
                )
            }
            let granted = bluetoothManager?.authorization == .allowedAlways
            print("📱 [RollaPermissions] Bluetooth status (iOS 13.0): \(granted)")
            return granted
        } else {
            // Pre-iOS 13, no runtime permission needed
            print("📱 [RollaPermissions] Bluetooth status (pre-iOS 13): true")
            return true
        }
    }

    /// Internal Location status check
    /// - Returns: true if Location permission is granted (WhenInUse or Always)
    private func checkLocationStatusInternal() -> Bool {
        let status = CLLocationManager.authorizationStatus()
        let granted = status == .authorizedWhenInUse || status == .authorizedAlways
        print("📱 [RollaPermissions] Location status: \(status.rawValue) -> granted: \(granted)")
        return granted
    }

    /// Internal Background Location status check
    /// - Returns: true if Always location authorization is granted
    private func checkBackgroundLocationStatusInternal() -> Bool {
        let status = CLLocationManager.authorizationStatus()
        let granted = status == .authorizedAlways
        print("📱 [RollaPermissions] Background Location status: \(status.rawValue) -> granted: \(granted)")
        return granted
    }

    // MARK: - Internal Permission Requests

    /// Internal Bluetooth permission request
    /// Initializes CBCentralManager which triggers iOS permission dialog
    /// - Parameter completion: Callback with true if granted, false otherwise
    private func requestBluetoothPermissionInternal(completion: @escaping (Bool) -> Void) {
        print("📱 [RollaPermissions] Requesting Bluetooth permission...")
        // Store completion handler for delegate callback
        // Note: bluetoothCompletion expects Result<Bool, Error>, so we wrap the Bool response
        self.bluetoothCompletion = { result in
            switch result {
            case .success(let granted):
                completion(granted)
            case .failure:
                completion(false)
            }
        }

        // Check if already authorized
        if #available(iOS 13.1, *) {
            let status = CBCentralManager.authorization
            if status == .allowedAlways {
                print("📱 [RollaPermissions] Bluetooth already authorized")
                completion(true)
                bluetoothCompletion = nil
                return
            } else if status == .denied || status == .restricted {
                print("📱 [RollaPermissions] Bluetooth denied/restricted")
                completion(false)
                bluetoothCompletion = nil
                return
            }
        }

        // Initialize CBCentralManager - this triggers the iOS permission dialog
        // The delegate callback will handle the completion
        print("📱 [RollaPermissions] Initializing CBCentralManager...")
        bluetoothManager = CBCentralManager(
            delegate: self,
            queue: .global(qos: .userInitiated)
        )
    }

    /// Internal Location permission request
    /// Requests WhenInUse authorization which triggers iOS permission dialog
    /// - Parameter completion: Callback with true if granted, false otherwise
    private func requestLocationPermissionInternal(completion: @escaping (Bool) -> Void) {
        print("📱 [RollaPermissions] Requesting Location permission...")
        // Store completion handler for delegate callback
        // Note: locationCompletion expects Result<Bool, Error>, so we wrap the Bool response
        self.locationCompletion = { result in
            switch result {
            case .success(let granted):
                completion(granted)
            case .failure:
                completion(false)
            }
        }

        // Check current status
        let status = CLLocationManager.authorizationStatus()
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            print("📱 [RollaPermissions] Location already authorized")
            completion(true)
            locationCompletion = nil
            return
        } else if status == .denied || status == .restricted {
            print("📱 [RollaPermissions] Location denied/restricted")
            completion(false)
            locationCompletion = nil
            return
        }

        // Request authorization - delegate callback will handle completion
        print("📱 [RollaPermissions] Requesting WhenInUse authorization...")
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
    }
}

// MARK: - CBCentralManagerDelegate

extension RollaPermissionsHandler: CBCentralManagerDelegate {

    /// Called when Bluetooth manager state changes
    /// Used to detect when user responds to permission dialog
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print("📱 [RollaPermissions] Bluetooth state updated: \(central.state.rawValue)")

        // Check if we're waiting for user response
        guard let completion = bluetoothCompletion else { return }

        // Ensure completion is called on main thread
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }

            // User has responded (or permission was already determined)
            if #available(iOS 13.1, *) {
                let status = CBCentralManager.authorization
                print("📱 [RollaPermissions] Bluetooth authorization: \(status.rawValue)")
                let granted = status == .allowedAlways
                completion(.success(granted))
                self.bluetoothCompletion = nil
            } else if #available(iOS 13.0, *) {
                let status = central.authorization
                print("📱 [RollaPermissions] Bluetooth authorization: \(status.rawValue)")
                let granted = status == .allowedAlways
                completion(.success(granted))
                self.bluetoothCompletion = nil
            } else {
                // Pre-iOS 13, no runtime permission needed
                completion(.success(true))
                self.bluetoothCompletion = nil
            }
        }
    }
}

// MARK: - CLLocationManagerDelegate

extension RollaPermissionsHandler: CLLocationManagerDelegate {

    /// Called when Location authorization status changes
    /// Used to detect when user responds to permission dialog
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status: CLAuthorizationStatus
        if #available(iOS 14.0, *) {
            status = manager.authorizationStatus
            print("📱 [RollaPermissions] Location authorization changed: \(status.rawValue)")
        } else {
            status = CLLocationManager.authorizationStatus()
            print("📱 [RollaPermissions] Location authorization changed: \(status.rawValue)")
        }

        // Check if we're waiting for user response
        guard let completion = locationCompletion else { return }

        // Ensure completion is called on main thread
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }

            // Only respond when we have an actual authorization decision from the user
            // Ignore .notDetermined (dialog still showing or not yet shown)
            if status == .notDetermined {
                print("📱 [RollaPermissions] Location status is notDetermined, waiting for user response")
                return
            }

            // User has responded (or permission was already determined)
            let granted = status == .authorizedWhenInUse || status == .authorizedAlways
            print("📱 [RollaPermissions] Location granted: \(granted)")
            completion(.success(granted))
            self.locationCompletion = nil
        }
    }
}
