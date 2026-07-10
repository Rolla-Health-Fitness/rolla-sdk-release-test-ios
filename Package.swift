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
            dependencies: ["Flutter", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "health", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "FlutterPluginRegistrant",
            publicHeadersPath: "."
        ),

        // Swift wrapper API
        .target(
            name: "RollaSDK",
            dependencies: ["FlutterPluginRegistrant", "App", "Flutter", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "health", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "Sources"
        ),

        // Flutter module (Dart code compiled to native)
        .binaryTarget(
            name: "App",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.290/App.xcframework.zip",
            checksum: "4beba9a5e70e5230ad4cf61bbebad402f4a0b7568d40369167a34a09e458f809"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.290/Flutter.xcframework.zip",
            checksum: "de78c4b9d299087415ddf280fdcb30df88fb4f283c369316d342c58f28c76946"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.290/connectivity_plus.xcframework.zip",
            checksum: "64e9f850ba9bff98d7219835ffe62037d3f7c4ff0fe1d02b96bceec6d39784e9"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.290/device_info_plus.xcframework.zip",
            checksum: "b19a23f0a9b424f88fcb49fc0a5678f1549563667edc5c1430d17be64f6f9e96"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.290/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "f830760e3235ae4dc16670245a46856853d3aaac3540a2608996675844849d7d"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.290/flutter_local_notifications.xcframework.zip",
            checksum: "6883ea8d94e7b8107a2b92b4c9151cddbbdc28b52cc9a8f4d755eaaa0a6a1f5d"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.290/flutter_native_timezone_latest.xcframework.zip",
            checksum: "4fd6387fdc07825c8922d290a7e69cc37263764279298b11367a72b16f3619ad"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.290/flutter_secure_storage.xcframework.zip",
            checksum: "c636d8e21747dd263dfedb5396c53d6f7b247c341dbd87d83c3f4a6d69d54602"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.290/geolocator_apple.xcframework.zip",
            checksum: "14778c72efac38ef73ca234993e955cd8a462b1146fb3d24a570b700f2af53d1"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.290/health.xcframework.zip",
            checksum: "ed3d928c059128f9761ecde6a380f75e558aa617ce1cb2d68832852307916cd0"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.290/image_cropper.xcframework.zip",
            checksum: "97ffcf3fd63efcae7fba672f7d3ca597a53cbbb0675adaf4a16d93567069e2aa"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.290/image_picker_ios.xcframework.zip",
            checksum: "6f87d627bd57759927f76981a6c919231f1952329a6cd63b604a5e613793661d"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.290/mapbox_maps_flutter.xcframework.zip",
            checksum: "b50bf8051aeed027b3372ebf85bf7e0b35442a90f2dddb9bb83d0aec3cd2eeaf"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.290/MapboxCommon.xcframework.zip",
            checksum: "af26c1d637ac0a8e3633aee9cdfe0be1868f83c56eed7f14c3be030826998c5d"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.290/MapboxCoreMaps.xcframework.zip",
            checksum: "b0949d7a3dbd5e3a8db66bfcb37d45dc4cbd7a1ce54fdbfa692c5932aaa9b2cf"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.290/MapboxMaps.xcframework.zip",
            checksum: "1e30e007792f80bc944b8e5182cdb426698e69d1d6327156c7340ee12a7cd52c"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.290/NordicDFU.xcframework.zip",
            checksum: "663c995e2446fc392b986e1e8679a39782817bd2694aa89bac48af93038124a1"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.290/package_info_plus.xcframework.zip",
            checksum: "a8b707992958b7250ab3e993fd0d81849e0e31749193c4b6c20373afccd75192"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.290/path_provider_foundation.xcframework.zip",
            checksum: "73ba4ff5adcd1ff6dd30f87af5c5d733aeeb3c21339ef1f0c97afe3dd1b7dd75"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.290/permission_handler_apple.xcframework.zip",
            checksum: "1b7e145c4c09cb78797a00774fd1710f6db43ef91cd8337fdd4ff890443f6e50"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.290/share_plus.xcframework.zip",
            checksum: "c14288393ec204f12d013cda8b3fb21d9b1242a1500164c7b3a026932bc8a361"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.290/shared_preferences_foundation.xcframework.zip",
            checksum: "25d924c13efce23d0c06c3df2969f773c62181d38d2b20542f137a3469ec16e3"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.290/sqflite_darwin.xcframework.zip",
            checksum: "acc632b09c304715259626a08fc94fbeb30bd75319ee281fbeb34ee5df16c59e"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.290/TOCropViewController.xcframework.zip",
            checksum: "33234e1b68fbcaf4f5e3aca720185f31ca256cfafe3d718b8d0264d5c4e59254"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.290/Turf.xcframework.zip",
            checksum: "0e2d65e189b635f3396e8db4ae036768376db1f644b92fff80a2eb49748e9898"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.290/url_launcher_ios.xcframework.zip",
            checksum: "c79e9f14b88a5df18a3a351d88baf17206ec35d7c3cb45af5dbee1d44e869e3f"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.290/video_player_avfoundation.xcframework.zip",
            checksum: "a3bed52c7cdf7e6374a53651925f3c46d7d803ff58c739f591b72ba68b1c9c9e"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.290/wakelock_plus.xcframework.zip",
            checksum: "4c46f44a4a12ecb5268b503b62d35943b4a1ca868a2cd262c96d439b77798ceb"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.290/ZIPFoundation.xcframework.zip",
            checksum: "a466431a8cdfd7dc18b9003a37cdd8a4ff21e09b15695fc34cd4c4d919396fc6"
        )
    ]
)
