import Foundation

public actor DeviceIdentityManager {
    private var pairedDevices: [String: DeviceIdentity] = [:]
    private let userDefaults: UserDefaults
    private let storageKey = "pairedDeviceIdentities"
    private let logger: Logging
    private let logCategory: LogCategory = .deviceIdentity

    public init(userDefaults: UserDefaults = .standard, logger: Logging) {
        self.userDefaults = userDefaults
        self.logger = logger
        Task {
            await loadFromStorage()
        }
    }
}

extension DeviceIdentityManager: DeviceIdentityManaging {
    public func registerDevice(
        mac: String,
        appleUUID: UUID,
        name: String?,
        brand: DeviceBrand,
        type: BLEDeviceType
    ) async {
        let existingIdentityForMAC = pairedDevices[mac]
        pairedDevices.removeValue(forKey: mac)
        
        let macsToRemove = pairedDevices.compactMap { (key, value) in
            value.appleUUID == appleUUID ? key : nil
        }
        for macToRemove in macsToRemove {
            pairedDevices.removeValue(forKey: macToRemove)
        }
        
        let newIdentity = DeviceIdentity(
            mac: mac,
            appleUUID: appleUUID,
            name: name ?? existingIdentityForMAC?.name,
            lastSeen: Date(),
            brand: brand.rawValue,
            type: type.rawValue,
            dateAdded: Date()
        )
        
        pairedDevices[mac] = newIdentity
        saveToStorage()
    }
    
    public func getAppleUUID(for mac: String) async -> UUID? {
        return pairedDevices[mac]?.appleUUID
    }
    
    public func getMAC(for appleUUID: UUID) async -> String? {
        return pairedDevices.values.first { $0.appleUUID == appleUUID }?.mac
    }
    
    public func isDevicePaired(mac: String) async -> Bool {
        return pairedDevices[mac] != nil
    }
    
    public func isDevicePaired(appleUUID: UUID) async -> Bool {
        return pairedDevices.values.contains { $0.appleUUID == appleUUID }
    }

    public func resolveDeviceIdentifier(_ identifier: String) async -> BLEDeviceIdentifier? {
        guard let connectionIdentifier = ConnectionIdentifier(string: identifier) else {
            logger.error("Invalid identifier format: '\(identifier)'", category: logCategory)
            return nil
        }
        
        switch connectionIdentifier {
        case .appleUUID(let appleUUID):
            return appleUUID
            
        case .mac(let macAddress):
            guard let appleUUID = pairedDevices[macAddress.value]?.appleUUID else {
                logger.info("Couldn't find uuid for device with MAC address: \(macAddress.value)", category: logCategory)
                return nil
            }
            return BLEDeviceIdentifier(appleUUID)
        }
    }
    
    public func getPairedDevice(mac: String) async -> PairedDevice? {
        guard let identity = pairedDevices[mac] else {
            return nil
        }

        let pairedDevice = PairedDevice(
            macAddress: identity.mac,
            appleUUID: identity.appleUUID,
            name: identity.name,
            lastSeen: identity.lastSeen,
            deviceType: identity.deviceType,
            brand: identity.deviceBrand
        )

        return pairedDevice
    }

    public func getPairedDevice(identifier: String) async -> PairedDevice? {
        guard let connectionIdentifier = ConnectionIdentifier(string: identifier) else {
            logger.error("Invalid identifier format: '\(identifier)'", category: logCategory)
            return nil
        }

        switch connectionIdentifier {
        case .appleUUID(let appleUUID):
            logger.info("Looking up paired device by UUID: \(appleUUID.uuidString)", category: logCategory)

            guard let identity = pairedDevices.values.first(where: { $0.appleUUID == appleUUID.value }) else {
                logger.info("Couldn't find paired device with UUID: \(appleUUID.uuidString)", category: logCategory)
                return nil
            }

            return PairedDevice(
                macAddress: identity.mac,
                appleUUID: identity.appleUUID,
                name: identity.name,
                lastSeen: identity.lastSeen,
                deviceType: identity.deviceType,
                brand: identity.deviceBrand
            )

        case .mac(let macAddress):
            logger.info("Looking up paired device by MAC: \(macAddress.value)", category: logCategory)

            guard let identity = pairedDevices[macAddress.value] else {
                logger.info("Couldn't find paired device with MAC address: \(macAddress.value)", category: logCategory)
                return nil
            }

            return PairedDevice(
                macAddress: identity.mac,
                appleUUID: identity.appleUUID,
                name: identity.name,
                lastSeen: identity.lastSeen,
                deviceType: identity.deviceType,
                brand: identity.deviceBrand
            )
        }
    }

    public func removeDevice(identifier: BLEDeviceIdentifier) async {
        if let mac = pairedDevices.values.first(where: { $0.appleUUID == identifier.value })?.mac {
            pairedDevices.removeValue(forKey: mac)
            saveToStorage()
        }
    }

    private func saveToStorage() {
        do {
            let data = try JSONEncoder().encode(pairedDevices)
            userDefaults.set(data, forKey: storageKey)
        } catch {
        }
    }
    
    private func loadFromStorage() {
        guard let data = userDefaults.data(forKey: storageKey) else {
            return
        }
        do {
            pairedDevices = try JSONDecoder().decode([String: DeviceIdentity].self, from: data)
        } catch {
            pairedDevices = [:]
        }
    }
    
    public func removeAllDevices() async {
        pairedDevices.removeAll()
        userDefaults.removeObject(forKey: storageKey)
    }
}

private enum ConnectionIdentifier: Sendable {
    case mac(MACAddress)
    case appleUUID(BLEDeviceIdentifier)
    
    init?(string: String) {
        if let mac = MACAddress(string) {
            self = .mac(mac)
        } else if let uuid = BLEDeviceIdentifier(string) {
            self = .appleUUID(uuid)
        } else {
            return nil
        }
    }
}
