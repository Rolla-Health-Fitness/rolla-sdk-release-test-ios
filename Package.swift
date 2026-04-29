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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test/App.xcframework.zip",
            checksum: "63397862c10e6ca5eddcc2f99122ed5d7bcfabf88af22418cff1bd6520afc8d6"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test/Flutter.xcframework.zip",
            checksum: "f7f84a7f9e18bc560481230c7bf042935cd943bcce90e4fd03de4c4d52d19eae"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test/apple_health.xcframework.zip",
            checksum: "50727fea3bbd2a9d4e76c5b85167f4d2b232b77dd5d8d95c33d207519bdb9da9"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test/connectivity_plus.xcframework.zip",
            checksum: "97e2d4523c79a80dfd32e56cc7341808d6a9d8eb9fb70531923bc77e4846107c"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test/device_info_plus.xcframework.zip",
            checksum: "c08ca8cf826cecfa2d6bb2814cf4703c6e4913ab962276aa7d25e8e98b100848"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "6f6d389238906f530fd23be2b7e15bfe68cddad620d861192b4b23e2cdd709d7"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test/flutter_local_notifications.xcframework.zip",
            checksum: "efd7cfb56c87961c663ba62feee89ec72dacf86ecb4ed0847cccf01d32739ee1"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test/flutter_native_timezone_latest.xcframework.zip",
            checksum: "5867383a278c2388ba9b88899b0da872b8aeb2d122dc53e5d552d6aa2148a369"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test/flutter_secure_storage.xcframework.zip",
            checksum: "977fa7c360edb08fbd6e629ab60937eba545bd068b8ea18c1c3f06dbf162282a"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test/geolocator_apple.xcframework.zip",
            checksum: "b993e8a9a3e69895ad0513b30247bcd854c81c8d5ea019b5065e75e72bbcd86b"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test/health.xcframework.zip",
            checksum: "c6ba34de05f6e00c65d7d1c6485b082247c1f84ee687f20fbbbd7226ccff80fa"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test/image_cropper.xcframework.zip",
            checksum: "722c6e4605b0dae1c5f7d1b4cca26809c1a88f73fa8742e02baa7d2ce02486d6"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test/image_picker_ios.xcframework.zip",
            checksum: "4eb0601a9276910d0204c555c0c76e894dcf9834fd36a1792b36bfbcb97d9a03"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test/mapbox_maps_flutter.xcframework.zip",
            checksum: "3b16032bd3b295a256eed021c5fcf54c21d45d1a6fd1f73951d4b4284565b3f2"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test/MapboxCommon.xcframework.zip",
            checksum: "b5fa17ca20cd103b73375bcd69f059529e03c4b08e5891002e885f754391e259"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test/MapboxCoreMaps.xcframework.zip",
            checksum: "33dabf58101bfc76c0cdcec92bce793a0a3a143111f39445c80147d1086adb4b"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test/MapboxMaps.xcframework.zip",
            checksum: "f9db4cfbe946cec2ae614b8386c241b0f67abd479541c8605cb34b89232312a9"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test/NordicDFU.xcframework.zip",
            checksum: "cc4e484f1f24a5f34d02fc77ab16845b346db2b5344d617825b23b1246bdd619"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test/package_info_plus.xcframework.zip",
            checksum: "9f8bda0ec8142b187f32d6f7ac679d70476919a555b6c97c9af3f123a83197f1"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test/path_provider_foundation.xcframework.zip",
            checksum: "e37bd3eed2e4edaf057c03b19ea4f8d1c202994cbe203943d50c4d007128e251"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test/permission_handler_apple.xcframework.zip",
            checksum: "2e0bf74b2a9c747ae2173398b3277314854f18e457b9fd94ad0738cac4fa3635"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test/share_plus.xcframework.zip",
            checksum: "1df12d391645777a82683ed09e98a75358d06f5d50a2bdf16102f2a291a9c305"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test/shared_preferences_foundation.xcframework.zip",
            checksum: "b28b770b87ac7201af571d792d8c815e7a0a2f485565c7eca879217736a8a152"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test/sqflite_darwin.xcframework.zip",
            checksum: "0ac1d673970d3b42e8696f2f5a9f689c99efd46be387fa0eb3dd054852e9bed2"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test/TOCropViewController.xcframework.zip",
            checksum: "8925ac548de48c67114a8591ca1305451ce7aeef40e5ed2e5e4944d2c1b1cbd7"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test/Turf.xcframework.zip",
            checksum: "7eae09be92e202dca1f3f26f288e12be2ae04df91ead0f3d09bc26051f0cae12"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test/url_launcher_ios.xcframework.zip",
            checksum: "8d8971a4e06c4a0a2ee2d360d8627a868e5d4615c7c57844c67f5d758a4659b8"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test/video_player_avfoundation.xcframework.zip",
            checksum: "4b38f12af7dbd8a487fd0723cbbf86a4260dee4adaacf2639409c96402f072b6"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test/wakelock_plus.xcframework.zip",
            checksum: "90123c576e84caf0bc57bf63913d3f4569060930c13dea0c71115ea8356e49d7"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test/ZIPFoundation.xcframework.zip",
            checksum: "bd414d8f398c9725444bef5f4c65abf44ccfcbb30308d129ec1970af43181423"
        )
    ]
)
