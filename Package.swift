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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.324/App.xcframework.zip",
            checksum: "64fd063d4da79edb9234ff42d12e97d929984977e9f03194aa5f8318f4f035d1"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.324/Flutter.xcframework.zip",
            checksum: "ec7ae6fe44dcf904521be50794ed95caf9d936d3ccfd056b4efee5d398892b43"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.324/connectivity_plus.xcframework.zip",
            checksum: "e466891b9c81e3d4140756517e5dbe300938d205fb83c68d044a90fb8dfe7542"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.324/device_info_plus.xcframework.zip",
            checksum: "b56b6c7eaf8a3bb493e0eb83ebda75930dd8bf46c5967017188af9f0dedaa868"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.324/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "f76b6d098f9a86771de6c57f51b47bcc79358c10a50f8a5323808078a18fb595"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.324/flutter_local_notifications.xcframework.zip",
            checksum: "cff252f473199ea04428c3957e1fdd87ad83dde95965c46a316ec5a1c3ce4a68"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.324/flutter_native_timezone_latest.xcframework.zip",
            checksum: "ff51c3fc1be09660ee82d3d5cd64ff0fb8792589b5174d3ebc5fb365ebc27797"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.324/flutter_secure_storage.xcframework.zip",
            checksum: "55a43d8f2ae9b5b4b7fd2165c1ae858ec83aca58f94ae680651659b82f90ab70"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.324/geolocator_apple.xcframework.zip",
            checksum: "3dd6acdf9d36dda1fc67c5027f1e50ddc1defc75c14a50e6a7e80decd7fe0d64"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.324/health.xcframework.zip",
            checksum: "06eff404729865f39c126471b782f8d151bdef22c65da5b8584de917e0f0d7a0"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.324/image_cropper.xcframework.zip",
            checksum: "d890c8e49ebb5670a83fb700f3ca185472379138ba9d0ba63fe7c34d684bc2df"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.324/image_picker_ios.xcframework.zip",
            checksum: "5ca0a65922bd1dd2fa72786876113b4b07c37d0532e339cb9f02df1ebdd3cbb7"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.324/mapbox_maps_flutter.xcframework.zip",
            checksum: "22640c23df5d9932a8aaf6f9a31d475fbfc32eecca5f2085d64394d06f53103c"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.324/MapboxCommon.xcframework.zip",
            checksum: "3e4d7da9ef9565f1db6fa282e2e0439ba40e6594d44e4d3693b21b2c84affcb5"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.324/MapboxCoreMaps.xcframework.zip",
            checksum: "c3468512282144d973e1a260273fd6726fd7efac57060363ed2714d5a74a1567"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.324/MapboxMaps.xcframework.zip",
            checksum: "9e3564a2b7e9a66aad79076edaa8b1e70c6109c1649c15151920fc0b2e72cbd3"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.324/NordicDFU.xcframework.zip",
            checksum: "2e34785c7abaa8b0c8aea794ee9da7c2450e80939b8fe427409fafeeea3530a4"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.324/package_info_plus.xcframework.zip",
            checksum: "397c39fed64fcd276967184ba01c8a9e900ea079133a04deae3eae3e83168014"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.324/path_provider_foundation.xcframework.zip",
            checksum: "eb20d4cc095ee8f9578e3d0c0e3dc716b51445f5001328be963b928f14b80f0f"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.324/permission_handler_apple.xcframework.zip",
            checksum: "cd21c5e80f05a1b245ae93f629364e56563b36f6ffffd8f25a7644cdeb7daccf"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.324/share_plus.xcframework.zip",
            checksum: "1065277ed7e4d0e5f353ecc092759272800937a864da66beeebd02b0770dd111"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.324/shared_preferences_foundation.xcframework.zip",
            checksum: "066d67d4984b98bfcbff0bf68e90bb53f164ee0fc5bd45146d359bcb11d81b0d"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.324/sqflite_darwin.xcframework.zip",
            checksum: "0217c9f8f3a1197e7045b6069cc4379ff9f320adc693e20042ad984c0a24b70c"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.324/TOCropViewController.xcframework.zip",
            checksum: "6d0ff8992123e9a98c300504d54d4296752c8e20fd411026b83549e4e68454ca"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.324/Turf.xcframework.zip",
            checksum: "3a45e195de3d2302ba4ada42466798a102c3d6932edc958be685f46ca3162048"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.324/url_launcher_ios.xcframework.zip",
            checksum: "1fc6e2e5925b71cd492f1aefc181f6e8b58831070173b13a033a3302c22cc28c"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.324/video_player_avfoundation.xcframework.zip",
            checksum: "5ee5c90fa85a4c11683adb1f3ff72acb9e75e3001315a495b725139e64c7e9b4"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.324/wakelock_plus.xcframework.zip",
            checksum: "06feecafa6ba8c1b813d7eb4e012b5b1b40d3f06c377eccfb129a85946905c60"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.324/ZIPFoundation.xcframework.zip",
            checksum: "3a1a99159c4a48399b9d2610ce44b59a6d8d222eab5ddb233ef76f31028c97fe"
        )
    ]
)
