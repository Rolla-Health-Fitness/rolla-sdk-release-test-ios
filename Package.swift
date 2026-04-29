// swift-tools-version:5.5
// Rolla SDK for iOS
//
// Usage in Xcode:
// PROJECT → Package Dependencies → Add Package Dependency
// URL: https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios.git

import PackageDescription

let package = Package(
    name: "RollaSDK",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "RollaSDK",
            targets: ["RollaSDK"]
        )
    ],
    targets: [
        // ObjC plugin registrant (separate target: SwiftPM/Xcode doesn't allow mixed-language in one target)
        .target(
            name: "FlutterPluginRegistrant",
            dependencies: ["Flutter", "apple_health", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage_darwin", "geolocator_apple", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "FlutterPluginRegistrant",
            publicHeadersPath: "."
        ),

        // Swift wrapper API
        .target(
            name: "RollaSDK",
            dependencies: ["FlutterPluginRegistrant", "App", "Flutter", "apple_health", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage_darwin", "geolocator_apple", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "Sources"
        ),

        // Flutter module (Dart code compiled to native)
        .binaryTarget(
            name: "App",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test/App.xcframework.zip",
            checksum: "f2817e7ed1717719a70a219375cc897bffe664e16d57a0df5002855800aee78f"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test/Flutter.xcframework.zip",
            checksum: "d35ff88cd74557e1f4814e1aba092f15fef82a4519d030f3ac9c59e88c569bd4"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test/apple_health.xcframework.zip",
            checksum: "0f347f0a243a7861a16f16b0d468ef1ed57162972664be97a5716ee555b17f88"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test/connectivity_plus.xcframework.zip",
            checksum: "ad49138fac38c9699a911a586832bde4c4274f626d270ddbd08c2ae92e65117f"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test/device_info_plus.xcframework.zip",
            checksum: "6a1da182ac34cca13ce4b339da137e61b27c1f3c718eb3db7fe52745fe0b7d15"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "9cc25e64732548b8a85e310f03d799bc862f46b8f78f68378d7ebf9e8b2b0049"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test/flutter_local_notifications.xcframework.zip",
            checksum: "c5f7f676630ed524fda89463edd08530ae90c47f341ef3b0e96b0c616ce7eae9"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test/flutter_native_timezone_latest.xcframework.zip",
            checksum: "5a8b604a5b151db27d0f21637b4694a583be4f0a63fce4254943ce42e06ed82e"
        )
,
        // Flutter plugin: flutter_secure_storage_darwin
        .binaryTarget(
            name: "flutter_secure_storage_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test/flutter_secure_storage_darwin.xcframework.zip",
            checksum: "25a094d8443463c13c10e72bd93105bf924cd593bed688d4b3fc3f36d2bda8e2"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test/geolocator_apple.xcframework.zip",
            checksum: "ad46ae28d6a5a4e035d5d73341a6d2db11592cf55e9a52a745baca0fb6d991a4"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test/image_cropper.xcframework.zip",
            checksum: "b54f24d04e1bbdc59d6522757b508f0ef424251f2060e84460919b7de4e22744"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test/image_picker_ios.xcframework.zip",
            checksum: "dc7d08ce26cc28feeb3424722b6b87300eb1105c0e881358f5c9ebb469ae867f"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test/mapbox_maps_flutter.xcframework.zip",
            checksum: "30aac99e22f28a65feae9df366504d559847d6950e3137bf89b585d5796efa30"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test/MapboxCommon.xcframework.zip",
            checksum: "26aca371b48da20e05cd32610d60b81c7ec2dcb6d55ff3f351d3303e997620ae"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test/MapboxCoreMaps.xcframework.zip",
            checksum: "2630891248007706424fc35c9e2a9a0b15d1db831c958417e44cbbce712bbcbb"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test/MapboxMaps.xcframework.zip",
            checksum: "beb58fa324fca6dbf0477fa1de8cc499d5ffe47cd4c1a5aaccdad69ab902b48a"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test/NordicDFU.xcframework.zip",
            checksum: "3daf500e239a3506e2146e9809f68d22193294cb5e167616bd7e5dd6b0f47e3b"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test/package_info_plus.xcframework.zip",
            checksum: "7b5f668d1838146152f05e70531b6a3f45457d530b0793c3036e72b09d9c0dfd"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test/permission_handler_apple.xcframework.zip",
            checksum: "8d781c06eccf3b38e7e8c9a05fbdc44db6665bb65bd9a0d278ba0c6ed7bf7cef"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test/share_plus.xcframework.zip",
            checksum: "8584497d39c44ca49bd91b898ae0560ad8c1910ac0b8254ab94492512604f20a"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test/shared_preferences_foundation.xcframework.zip",
            checksum: "6938bfe273ad85c52afbbc5348bcbddc71dbe53c8aab1b2cd0e24811a6687b0b"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test/sqflite_darwin.xcframework.zip",
            checksum: "dbe9f6d29da9c2ce5b542ba1757856a29b6a5a5449efba8a7c011b413dc72ca2"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test/TOCropViewController.xcframework.zip",
            checksum: "f29990d43a445f20517cd7f226cb15c684f57d464017b8a92817eaa4fe49ad02"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test/Turf.xcframework.zip",
            checksum: "42495d3d115afffc094b07e6a01aaaaced1c3658c9a2520ef3e941457e1e0b44"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test/url_launcher_ios.xcframework.zip",
            checksum: "bfd8d8352ed61e2d4f2058359a6ab486753bdc82b858655e1a95d3eb200883dc"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test/video_player_avfoundation.xcframework.zip",
            checksum: "c661b17e3967a8553f5919e29161b55081b79832279d44212645fd18f67cfa88"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test/wakelock_plus.xcframework.zip",
            checksum: "b7f6aae78aaf79b33a6ea05d31f258c55d41c069a92b954500d62b24aff2d2ff"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test/ZIPFoundation.xcframework.zip",
            checksum: "b85e6f7d5abd23db2339df4df5db8601b5e49b33a5b0f380fc8e8e9de4f2b7c1"
        )
    ]
)
