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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.30-test.312/App.xcframework.zip",
            checksum: "f307346a7560c5e3196a117551988ad9ff5fa9db31e4f4c92423b0d1a6def1f3"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.30-test.312/Flutter.xcframework.zip",
            checksum: "bb4964bb1b46b73fef917e50e6ed843f5603b9f4d29b8f2cc48417e85c6b88ef"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.30-test.312/connectivity_plus.xcframework.zip",
            checksum: "d0bad0e278f0b713c998337682ff3fa8e10bf77be5e3b5f5eb0240e7ae28013a"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.30-test.312/device_info_plus.xcframework.zip",
            checksum: "bd2049843d344e915658850cb47075b878c14153f2be00a86e7933bab715d366"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.30-test.312/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "a72b39df0bf7a83716bfb80aedf66fdb71e4faf368975745c2deae5ceec07b25"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.30-test.312/flutter_local_notifications.xcframework.zip",
            checksum: "53780ef73e2a842c80e6f5d18d609a5f9f4e10eb1d62006825977bfea0aad5bd"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.30-test.312/flutter_native_timezone_latest.xcframework.zip",
            checksum: "8502227b6119c93642a460a3f7f6b3280370aee0bd2f843fd4ef16da8f626d30"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.30-test.312/flutter_secure_storage.xcframework.zip",
            checksum: "23f6f67878be594b0356165c7e9371b8082ab5a0d9949e4314a4dea78ac95b7e"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.30-test.312/geolocator_apple.xcframework.zip",
            checksum: "8f6264390357bf868464444668f04b2a2236d1bbdd7c7ed017f4ba0a30097129"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.30-test.312/health.xcframework.zip",
            checksum: "c7f2a333845b9613b90a709e1d870a0482349feb8ecdb0036861cf84e5347703"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.30-test.312/image_cropper.xcframework.zip",
            checksum: "fd601faa18a96cb653488628abb5f530de5a0f77576af019e7d3224d23c18384"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.30-test.312/image_picker_ios.xcframework.zip",
            checksum: "38b86f01622cf0f08f822fae390953975971b1e36ad7a31fd5064ff816540a0e"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.30-test.312/mapbox_maps_flutter.xcframework.zip",
            checksum: "b7774cf6005dd2476b63846fbc55877fe63c2fa980c199cd5fd3c21fc02da64c"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.30-test.312/MapboxCommon.xcframework.zip",
            checksum: "ce5407827e95d7be74715328dd23c6e1592f22de37228572c726531eb6ca91fe"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.30-test.312/MapboxCoreMaps.xcframework.zip",
            checksum: "25ed26fd5bdbb63c195cded2b3ef3ede7ff778979caafca37e3fc81a7c22dd84"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.30-test.312/MapboxMaps.xcframework.zip",
            checksum: "25b05815bc72f9abb551c4ffb63e4d6ec299f6934bb09faed58ab865da927852"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.30-test.312/NordicDFU.xcframework.zip",
            checksum: "dc192ca733ef13d27af844b01d71853993ec80e62fe692eb1ecca8fe909db7e3"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.30-test.312/package_info_plus.xcframework.zip",
            checksum: "8001ebb8e1366e81d5ddce8541380bc3a89731227b22704ed78a0a7a7383096b"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.30-test.312/path_provider_foundation.xcframework.zip",
            checksum: "95df1a1e93128ec7855046830e855db66a89b88f514b8fa5dd63af950aedf330"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.30-test.312/permission_handler_apple.xcframework.zip",
            checksum: "3a3a0113f4ac5e69af52903d213ff21e2c499c26f4b1f1ddeaab12f9c2823626"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.30-test.312/share_plus.xcframework.zip",
            checksum: "67413317810aff7be280da2a56d340d2c3fc743cbb8adebe4e2d3c8ca9a4cbf3"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.30-test.312/shared_preferences_foundation.xcframework.zip",
            checksum: "7d46d3883a1caa0757d4e180a1ece173c0e4d6675ed5660228bd4f875e27930b"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.30-test.312/sqflite_darwin.xcframework.zip",
            checksum: "1a1c09d88e185d8301ef3b91b26041d228269bbf594b01c48753b241e0408fd9"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.30-test.312/TOCropViewController.xcframework.zip",
            checksum: "bd0105aae0138f49c9be7cad81bea529ae6d669a859419ae361ecaa18b6167f2"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.30-test.312/Turf.xcframework.zip",
            checksum: "4281559e7b99df1ff81f755e242d0f062d8df74af65f30cfb693a54555bae634"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.30-test.312/url_launcher_ios.xcframework.zip",
            checksum: "444e2102dbbde4588b6b3b7864cb0b78ed30674a35d1cc46ff4f095c9cf6327d"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.30-test.312/video_player_avfoundation.xcframework.zip",
            checksum: "b339e2b47971709e1d50243683b092f76dc34694ddaea6391ab32af592ea5f23"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.30-test.312/wakelock_plus.xcframework.zip",
            checksum: "a245069b779c002f1435b0e5221c7e8ca19aaca66c74f019171f79e6f871354e"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.30-test.312/ZIPFoundation.xcframework.zip",
            checksum: "67746237edab8896fa6d7684e4aaf3d3607738e8c4ff6dd34087caa536b10a0e"
        )
    ]
)
