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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/App.xcframework.zip",
            checksum: "ddfd258d9e55965c26ed9971e94fd621a08402ae6e9a4eed2be4168118b7212d"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/Flutter.xcframework.zip",
            checksum: "987bd3dfe45d01098068572f74b8277703e2e53844ff58a434d87f8e9861bb9e"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/apple_health.xcframework.zip",
            checksum: "46e4e23957ed359f545f0ad1e9918f22a3964bbdde4036046e3304f1af484322"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/connectivity_plus.xcframework.zip",
            checksum: "07ee9d1014a90bcf147bf7578613112f928ef23aeeed854fcb480ebd17bf0edd"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/device_info_plus.xcframework.zip",
            checksum: "483f29aed3131314fa05c1dc0fb89eea7ee60952352f9a6a777dd95de92db566"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "405eb4421c2c2c6502cf021d021b03d79ece3845b2a1aab97909e2b48921baf7"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/flutter_local_notifications.xcframework.zip",
            checksum: "fa7ec22d4401c3299b6aa9f31a8e5a28e8fa314a1c2924e5bd9f28b767491052"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/flutter_native_timezone_latest.xcframework.zip",
            checksum: "e099e165d189ff19aa91216d49f538f93590e416dc577ed9d5e215a73b28bf45"
        )
,
        // Flutter plugin: flutter_secure_storage_darwin
        .binaryTarget(
            name: "flutter_secure_storage_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/flutter_secure_storage_darwin.xcframework.zip",
            checksum: "1a537b9cf9cdbfd0e74678d5471d2e91b5bed48824f4dd0f93c2230786d42804"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/geolocator_apple.xcframework.zip",
            checksum: "4a423e60f35bca536dbae51d6a3730d675b25ddc8d53cc64f4bed9c98ea28da9"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/image_cropper.xcframework.zip",
            checksum: "240bd8d99e0adb12626d21b4bd2663365528a876dd0423871b6b8ce7b6fb13da"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/image_picker_ios.xcframework.zip",
            checksum: "c16c2791785e0a306a9b2b89578b6af70f9a4e660cf25c77f2ac487da266210f"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/mapbox_maps_flutter.xcframework.zip",
            checksum: "f01572c996b4b9c572da3b7d7fdc7270ea66751062c2bec867d37163a1c6f1ba"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/MapboxCommon.xcframework.zip",
            checksum: "3a2c5a91524cfa3bc1d3cad6062dcdea6be67b32ec97992cc353c4dbfe1dff1d"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/MapboxCoreMaps.xcframework.zip",
            checksum: "69e03d14dfc7484ef444494abedd439db1c5d1082c45a9aa4c0e6615061b6f40"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/MapboxMaps.xcframework.zip",
            checksum: "aa941a795da382f67fd30c78e3757df511ef9e4af7ac6edd9f9ecfaa9a27861e"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/NordicDFU.xcframework.zip",
            checksum: "7f78c52fb89856581b22fdd92d237f8c7ee43803d9ebaaf6022abc1f4548acca"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/package_info_plus.xcframework.zip",
            checksum: "317483cbc4a7fdcd7d1c99037c03331fd54d1e4390158d1625d7b8c97a066635"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/permission_handler_apple.xcframework.zip",
            checksum: "279a80524359ec65ba4aa8258a7f10610d0569abfc6373eb5a79b01ed65d45a2"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/share_plus.xcframework.zip",
            checksum: "bbda9e61ad01a9057acca4e26f6985e43c575a70b0640d006b0d3eb0dd54e393"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/shared_preferences_foundation.xcframework.zip",
            checksum: "f3e18140133e8f87cee2f8f9615e35fe187e0f0ef7555fb68e27c6678fcee747"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/sqflite_darwin.xcframework.zip",
            checksum: "8010cd23b481f582304de9dbc2fec8e17762b48e311e74790438a14126a162c4"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/TOCropViewController.xcframework.zip",
            checksum: "0b8f839c90539ba3d9e8f2fc1e9aef984f8bee58b2c312ebd4ff686adc8a435a"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/Turf.xcframework.zip",
            checksum: "2b2bbedeb3ff936c8aa0560059b754964757c24165961c1f65e2ae8715879aed"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/url_launcher_ios.xcframework.zip",
            checksum: "99e6f68f8d474e39003e66e821b72b6e6bc7f3fd1141ef40adc9ac9e8e452623"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/video_player_avfoundation.xcframework.zip",
            checksum: "dbfa7d575ac14a8f72d8155d1d0f196972c59cf51a6017951864c3f3a39ddc34"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/wakelock_plus.xcframework.zip",
            checksum: "6f8e26acab25f289fc8b314e4fe9d31b96de07991b1ecc3f1dfb60d8f424e27d"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/ZIPFoundation.xcframework.zip",
            checksum: "a34d04a87568c8fc3a2187bdc61bc521ba6b5439beca704f6d523ba56db258f0"
        )
    ]
)
