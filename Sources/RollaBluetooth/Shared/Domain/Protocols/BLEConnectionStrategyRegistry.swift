import Foundation

public struct StrategyKey: Hashable, Sendable {
    public let brand: DeviceBrand
    public let type: BLEDeviceType
    
    public init(brand: DeviceBrand, type: BLEDeviceType) {
        self.brand = brand
        self.type = type
    }
}

final class BLEConnectionStrategyRegistry: @unchecked Sendable {
    private var specificStrategies: [StrategyKey: BLEConnectionStrategy]
    private let defaultStrategy: BLEConnectionStrategy
    
    init(
        specificStrategies: [StrategyKey: BLEConnectionStrategy] = [:],
        defaultStrategy: BLEConnectionStrategy
    ) {
        self.specificStrategies = specificStrategies
        self.defaultStrategy = defaultStrategy
    }
    
    public func strategy(for device: DiscoveredDevice) -> BLEConnectionStrategy {
        let specificKey = StrategyKey(brand: device.brand, type: device.type)
        if let specificStrategy = specificStrategies[specificKey] {
            return specificStrategy
        }
        return defaultStrategy
    }
    
    public func strategy(for device: ConnectedDevice) -> BLEConnectionStrategy {
        let specificKey = StrategyKey(brand: device.brand, type: device.deviceType)
        if let specificStrategy = specificStrategies[specificKey] {
            return specificStrategy
        }
        return defaultStrategy
    }
    
    public func hasSpecificStrategy(for device: DiscoveredDevice) -> Bool {
        let specificKey = StrategyKey(brand: device.brand, type: device.type)
        return specificStrategies[specificKey] != nil
    }

    public func register(_ strategy: BLEConnectionStrategy, for key: StrategyKey) {
        specificStrategies[key] = strategy
    }

    public func unregisterStrategy(for key: StrategyKey) {
        specificStrategies.removeValue(forKey: key)
    }
}
