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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.258.1/App.xcframework.zip",
            checksum: "e97c5a8d4c9f3bd38e1c503e4b67ad4584c1a0fb76fa70d220672384abb5a43b"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.258.1/Flutter.xcframework.zip",
            checksum: "66d968698218d3eff782074a0cd29f79a40bda589d47eeff80e3bccc944f0779"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.258.1/apple_health.xcframework.zip",
            checksum: "b4057388ad1b27fa85c552b2b93592512004b949a99cfc72e2c3a93f76077010"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.258.1/connectivity_plus.xcframework.zip",
            checksum: "126df3aaeb8b0a4d7567570bbd0bb9745fe2b14a78ab6c064899b212add2ec27"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.258.1/device_info_plus.xcframework.zip",
            checksum: "f8da0e59306404f201cb3fc64056494ad414f9026a56de96c665393b79b5c4df"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.258.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "da7dacdd19ff6e765f0f52b3584d023c38cfa567ba6620e24c922778ed4d8fb3"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.258.1/flutter_local_notifications.xcframework.zip",
            checksum: "1681721bf5ada5f32f301dea11c6b9e02017c60dc53c1ab72d5f198bc6c787f2"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.258.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "51318145a27c5a091a7a89048bd871636cae343e7da88369a1d5c125fcf67847"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.258.1/flutter_secure_storage.xcframework.zip",
            checksum: "e540d947da19fa399eaf9566ad3057c46e15788bf3eaa4182a5e7c28d30f478b"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.258.1/geolocator_apple.xcframework.zip",
            checksum: "292b8c1379e56a11efdbc9ba5ef94d1acc95441d86e235c9ecbfbbae867b8b83"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.258.1/health.xcframework.zip",
            checksum: "8af944367add629bdbbc7f8eb49c7bb51ee9e39846509c75d53ecbbcde0a56b3"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.258.1/image_cropper.xcframework.zip",
            checksum: "b58665abfc7b352a71ece93fc888b87bc2e3e28c8bcffa8ea50a5cd30abfdbb1"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.258.1/image_picker_ios.xcframework.zip",
            checksum: "b3540adc901831db8d57cbb6e3513a776965cbd80565954352209819ed129786"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.258.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "5a6df4359905860dd20297fe59f73a91ba771b0af6849b470c89ab696789a99a"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.258.1/MapboxCommon.xcframework.zip",
            checksum: "d4640726e1db6573244394bc6deab8ac69f47f2fbaa5634f675c1b986bf9eba8"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.258.1/MapboxCoreMaps.xcframework.zip",
            checksum: "8cf99615ef1141c6128895c1d76bb3047ad7828977f4fb5f25fed6566ba40f75"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.258.1/MapboxMaps.xcframework.zip",
            checksum: "3ae5b27fa8c3aabc0ef466e038ae9e05aa009fb796403aed8bac5d1f7a179072"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.258.1/NordicDFU.xcframework.zip",
            checksum: "ada586a15d03dc1fa778ebe0a18a1a604119ab9b123cf520ab2e3af616f75033"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.258.1/package_info_plus.xcframework.zip",
            checksum: "338071c0ba187a6ccf0567a99652050910751dec6d1f11302d3afcaee96b390d"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.258.1/path_provider_foundation.xcframework.zip",
            checksum: "5aedd63485cb9a8bb5feee73115ebcbe6a8fdc92c31f913647a8db4bdb592d14"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.258.1/permission_handler_apple.xcframework.zip",
            checksum: "149edb75760cb191784f89d51406aa9d339a0d0367d36301bd80ffb983994c84"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.258.1/share_plus.xcframework.zip",
            checksum: "f50b7ce58f495c3ff0dc5ea65cf414dde66cdeb99ddb5320857b57e7ef59c52e"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.258.1/shared_preferences_foundation.xcframework.zip",
            checksum: "54ee102b370d67b0cb1a99d66aff2c9a938165e8d50b00a338f2f7d43675e6b3"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.258.1/sqflite_darwin.xcframework.zip",
            checksum: "7401684debba9c3f140022e217a7a895157f8b13d44cc4c1343006f691c0cbf0"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.258.1/TOCropViewController.xcframework.zip",
            checksum: "9ca9c0cd74bd43884310ea2cca824a738c0d46f5a8b8e538962d4f02994acab2"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.258.1/Turf.xcframework.zip",
            checksum: "8fe29040887856a7c8881b0b1248e4f712784fc32eaf75a8b376c9165fd6b327"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.258.1/url_launcher_ios.xcframework.zip",
            checksum: "c832fbd1d19cd3dbd1d1d515246044eab5d6bc49d57a31c2c3306db26609ebb5"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.258.1/video_player_avfoundation.xcframework.zip",
            checksum: "e413ca48005ab4c7e4a1e477d532ca3d868f3c364d746539193e85e288219451"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.258.1/wakelock_plus.xcframework.zip",
            checksum: "a1f8e0fdd62501e1ee373c6bb8a4c91025f145ae44ba4e466a9c1c08f3f69865"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.258.1/ZIPFoundation.xcframework.zip",
            checksum: "6b0fc75d64732d7ed6a10d7442500f09d7bed48cb96a67967294b4b3625a5fdf"
        )
    ]
)
