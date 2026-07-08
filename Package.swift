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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.284/App.xcframework.zip",
            checksum: "7fbe6626a2dd53ba11f59b23c29e0ec256b2822c6fd80676c77131ef2c5bcfe8"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.284/Flutter.xcframework.zip",
            checksum: "db4e6331335095aff33f2629e50e5032996bce281f69fbfd1fdb534f4ed4065b"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.284/connectivity_plus.xcframework.zip",
            checksum: "159b7e48fc9725a93e36024a905dcda58232aadc394c3637a6a20c2df8d217f3"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.284/device_info_plus.xcframework.zip",
            checksum: "bb7fe6adc7c713c24fe00761de18f3d16cfb81bb0dd7fe081f10dc5dca4d7b08"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.284/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "acdf27c16a11316cc4a86f3b65b4eedf248b9d5d28c47269ba551ae0b64e98a3"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.284/flutter_local_notifications.xcframework.zip",
            checksum: "ff103f7eea612acd87aca2625a5f10d2dfab70109156f3c5f74d5f1aabdc3973"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.284/flutter_native_timezone_latest.xcframework.zip",
            checksum: "6b6b1e643685c41a9db9b0c80e1154f7af9429fad04d4198ae054faf7983c022"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.284/flutter_secure_storage.xcframework.zip",
            checksum: "a4e7666b825b1bb52610cd0c888c8fc3135e010a01ebcf795846615a19e662e9"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.284/geolocator_apple.xcframework.zip",
            checksum: "566201c930e5ed5c43de98a60046e8e1da8a4ba859772dc03562d3797e8df235"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.284/health.xcframework.zip",
            checksum: "d621836e18150995bda1d11547d430b353718d204d8f0629c0043eb93f26c620"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.284/image_cropper.xcframework.zip",
            checksum: "ef15d95d1a57e59af55994edb25240f9a7b6aae5cb4c65fd83d030a79ae7a2d4"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.284/image_picker_ios.xcframework.zip",
            checksum: "abfa76809a1bb3e1b6fec47e06d8587e34d88165639079b5098f21d775244214"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.284/mapbox_maps_flutter.xcframework.zip",
            checksum: "53ee35557a3dc765130892ab15ae8fb6f3e61693e88765b3f8f92d4347030413"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.284/MapboxCommon.xcframework.zip",
            checksum: "9ebc1f5af3767d055bbc223065f0d4c240de4d9bbdb8e7481f8d41533803e2a6"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.284/MapboxCoreMaps.xcframework.zip",
            checksum: "66650e8393914d462e3aecfb6ee2dd0a1dcd8a1856e5b3ee7ad29cddea1dd492"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.284/MapboxMaps.xcframework.zip",
            checksum: "320326716265d2259a14b1286bd878d61e897cd006d6914b910d6ff6356df1db"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.284/NordicDFU.xcframework.zip",
            checksum: "e15c50ff69ef38425ef8f368fefc716d10f8ff2ff09010ebb6b0f0511b103780"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.284/package_info_plus.xcframework.zip",
            checksum: "a6469e66b4f5b0c09a88b1cad187ab31e2d8b6d11f508741b5539463214a55e6"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.284/path_provider_foundation.xcframework.zip",
            checksum: "51f33460c837f6578567d73faef19b3623b336321b8c36430bc9399a791b16f3"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.284/permission_handler_apple.xcframework.zip",
            checksum: "2a539d964faa585ac0ee99077feff61e70fb111bffdfbb38a71f173b0447f92a"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.284/share_plus.xcframework.zip",
            checksum: "eac5078ee05acfe6e2e76b773245074d7c31f03d0ac6c800fbfcdcbf6c5107d9"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.284/shared_preferences_foundation.xcframework.zip",
            checksum: "a2fdcb4a6ae817b9bdf12c4430cb4f329bfdc1332774466162c128ac157abbcf"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.284/sqflite_darwin.xcframework.zip",
            checksum: "9b5521eb225660b2fc1586a71a6e00649b5dd4d4ffb365d6ebbcd3f757361e44"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.284/TOCropViewController.xcframework.zip",
            checksum: "45a87cbbf0277016fb659ee7b4675902d6f7d6ee6340ae2bc1afb276a6f03fd8"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.284/Turf.xcframework.zip",
            checksum: "157dfc747640f8b678215f3283a8ea549d0c3b5b21d741228deb1f3402ca9647"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.284/url_launcher_ios.xcframework.zip",
            checksum: "4423538fd956bff93045b9c36244468410038db44c957ec0a225c4354447e954"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.284/video_player_avfoundation.xcframework.zip",
            checksum: "53f7886fa06d961db429f7f43fb467644015e97f2a11f4a2bc7ddc739a58cd36"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.284/wakelock_plus.xcframework.zip",
            checksum: "47e9c4dbf3ca6988828c4cf75e7920b19fe91f1690a6cc9ec95a1e9ef4f8c270"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.284/ZIPFoundation.xcframework.zip",
            checksum: "6acadae5c18b47b31a5857a5684ff149a420cf9132484ca80eebda6fa1fa6e62"
        )
    ]
)
