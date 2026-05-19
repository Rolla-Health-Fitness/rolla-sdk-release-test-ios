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
            dependencies: ["Flutter", "apple_health", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "health", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "FlutterPluginRegistrant",
            publicHeadersPath: "."
        ),

        // Swift wrapper API
        .target(
            name: "RollaSDK",
            dependencies: ["FlutterPluginRegistrant", "App", "Flutter", "apple_health", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "health", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "Sources"
        ),

        // Flutter module (Dart code compiled to native)
        .binaryTarget(
            name: "App",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.245.1/App.xcframework.zip",
            checksum: "bdc0fe48b0c3c225f57d1830db70f67250bbedc0e91bad98c5ff9ae0ce07ab4a"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.245.1/Flutter.xcframework.zip",
            checksum: "63c6e5c4061138fb0fd967c2b83f1308d5702b92c34f3411732e762dce0862fd"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.245.1/apple_health.xcframework.zip",
            checksum: "51f90cd7c4f799ae1810cc76c03af4c0f52ec5dc4baef8798c9bfe641788d96a"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.245.1/connectivity_plus.xcframework.zip",
            checksum: "4215e15dfa37e3c457790cfd90fd6f8d33b69d9ac22d455696716c2509bfdc09"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.245.1/device_info_plus.xcframework.zip",
            checksum: "6fdd67243cd445deecb8510a75fe49811e0ce70e9ae22dfc82c832037032d4ab"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.245.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "07c7dfa4f3aeff5f09f702947aa52eab39bcfa13a76081a0ccc585bc90ba081b"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.245.1/flutter_local_notifications.xcframework.zip",
            checksum: "f2d84d8af57509c75d6ef6b604d97b2b3d1bcc85c07fd9089dff38de99416180"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.245.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "4119dd4b3622fceb60f6dfccb4134b29e752ae18a18c0ca7a970ef5d7767bfe8"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.245.1/flutter_secure_storage.xcframework.zip",
            checksum: "86939a6f50b458579d552d01d70327d7b8e1b4631f0ff620e825c623df41409b"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.245.1/geolocator_apple.xcframework.zip",
            checksum: "f04db1df71fc0eabb2c8c7528a8398969f2d9efbba1d6333acf9572b42610c5f"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.245.1/health.xcframework.zip",
            checksum: "59d3b97127c0e5a1bf75306f2d0f5f7b6fc313fa2e7d6287324084d138c15d64"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.245.1/image_cropper.xcframework.zip",
            checksum: "93e4f2ab7894f9a82595e5759dc0bf254cf9ac074d41fd8b0a983bcddeca698f"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.245.1/image_picker_ios.xcframework.zip",
            checksum: "e232244659180b50ea74b5302bc136e7d264962bb8756165d66d263efb5c2621"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.245.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "0c7d26c783fda4c97c4142ad97257060efc77e7dc147541bda67b58bda0b78c7"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.245.1/MapboxCommon.xcframework.zip",
            checksum: "821c0a7e3bd59065641b4adcabab75e0696165b8c4d562166b834cd3bd818700"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.245.1/MapboxCoreMaps.xcframework.zip",
            checksum: "811796bd31d60c2ab1f4dbf8b0203023fb199c7247ebde6457525caefda1975b"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.245.1/MapboxMaps.xcframework.zip",
            checksum: "3ebeb37cab05e5caf541b14396ab0ab164f2274af8bf03de63d92b37c5892204"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.245.1/NordicDFU.xcframework.zip",
            checksum: "6ac0af514a33d88fb8c8e9ebe4a71724854aee3105a33bbe2fc911ad12907478"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.245.1/package_info_plus.xcframework.zip",
            checksum: "2a243b57f68538c7d62cb2c070a322795f7f8eac98540192e4e91694e56998ca"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.245.1/path_provider_foundation.xcframework.zip",
            checksum: "a9ca48b7c2f1d80dc189ab6023d6328b0c64f7d329766793e3a8d3af7a7d8fbb"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.245.1/permission_handler_apple.xcframework.zip",
            checksum: "aad4eacbd28334765e8faeee3c20306c32005763d5ea8383639cbc4f6863efbf"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.245.1/share_plus.xcframework.zip",
            checksum: "8a2805e70bdc66aba2bfaa24293db67db38618d90b524c74e0f19f11dfb5d72b"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.245.1/shared_preferences_foundation.xcframework.zip",
            checksum: "bd4fa8c23b0f6005143d1161fd2a9fa4eaa30491afc1a0a1ed99efd20b586694"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.245.1/sqflite_darwin.xcframework.zip",
            checksum: "a41f33df24d8da8061e3124322b49f7567c600f6515b7d70c9d88a092671da63"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.245.1/TOCropViewController.xcframework.zip",
            checksum: "0ab048f3b793d03ed9be12d54953fcab03e752fa3978231cdcf60d27c3cace46"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.245.1/Turf.xcframework.zip",
            checksum: "d5eda895e91adfe3fe7d971882a5a4f997c2ee6b846e325cd24528070555f91a"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.245.1/url_launcher_ios.xcframework.zip",
            checksum: "86fa33d5cb147401181cb6dd9c0f2d382acb68566b19388a3637270b870e0244"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.245.1/video_player_avfoundation.xcframework.zip",
            checksum: "166b24a3ca5de5770e7e83bdf4bcd170067ed72dde354e2be69d0832eb892415"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.245.1/wakelock_plus.xcframework.zip",
            checksum: "2299c447c80748179bd257c5caf0d3069329d21dc1a0987a7c56a327255ec57a"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.245.1/ZIPFoundation.xcframework.zip",
            checksum: "793f8097ee4d9237582fc5dbe22ee0a3b6631695cec11cfac2a57b9ed6f5cd3c"
        )
    ]
)
