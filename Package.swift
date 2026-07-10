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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.289/App.xcframework.zip",
            checksum: "04fb52b2028b863f4ec80dc92f27529a5169e0ee1589aa08b1ef14421a158025"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.289/Flutter.xcframework.zip",
            checksum: "b1dbf9d17b7d85f6a235142f494b269b8c8b2f67136da3a52a974c2017a3a837"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.289/connectivity_plus.xcframework.zip",
            checksum: "bb9a436d166bdee600ddffe084f432c5310ff1edbe95599390895d1b957cc07d"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.289/device_info_plus.xcframework.zip",
            checksum: "23d270754981efbe5d37f0da99f7bb5558564e04ad7c7dea384806e01f4b9704"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.289/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "14ce2be4d2671b01c5959f6b8a2e6a3d4d60f8d40a03f2dffc776560825d3e2b"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.289/flutter_local_notifications.xcframework.zip",
            checksum: "c8ea13b310da44c870b5d089109da145fb8733403bb561a80827d72cb08ca8e9"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.289/flutter_native_timezone_latest.xcframework.zip",
            checksum: "7e5f31c21873c441e28a8d37dc047b05fff5316a9899798d2781fac3a678d0d5"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.289/flutter_secure_storage.xcframework.zip",
            checksum: "85ce36e5415baa31bef9d1e4ce5834d463aa92d9451446047b63efa0277ca2d5"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.289/geolocator_apple.xcframework.zip",
            checksum: "b2e08619bfd173dbbe4956cd562e165a9aa87353c73a62634d4db29adb569ee3"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.289/health.xcframework.zip",
            checksum: "c42f4ba846b48bf3ec20da53b98a0a7296b9d71b335ee8fc52acc9ad06608108"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.289/image_cropper.xcframework.zip",
            checksum: "5255f0ffa83644906e9ffff4b8d84dd12d3acf65704e807ed96ceec2dbc748a5"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.289/image_picker_ios.xcframework.zip",
            checksum: "2e7e4b4acc8dd988a3d3358f74023fbe8f04ef8a996cd96f5e44dcb9985e2c3f"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.289/mapbox_maps_flutter.xcframework.zip",
            checksum: "95258ac337420f00be4a95a0321e4f14b284d5783f28e14f338edac49668b7b1"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.289/MapboxCommon.xcframework.zip",
            checksum: "f70d6d824683b8311b2bc8ea86724f507258eef7a438a0c690073c8031a12842"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.289/MapboxCoreMaps.xcframework.zip",
            checksum: "cce1abafa07b55b17008de5b7acad645d219570545adaa3800e77dfb07c1db0d"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.289/MapboxMaps.xcframework.zip",
            checksum: "af04a0f2284bc0e22a929fd142d76877be9b1806f8350b795aaa66ba27d08f54"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.289/NordicDFU.xcframework.zip",
            checksum: "ba343618813e032de093a486d34ffb0fc543a7747a570bf76e809030a44e37cb"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.289/package_info_plus.xcframework.zip",
            checksum: "e042eff5a966bc225fa59b039c37f5940394f85ebf5bf989c911a34d4dd368ae"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.289/path_provider_foundation.xcframework.zip",
            checksum: "0c90d99741cdcda76208b3fe7ced72ce540f2931f1b24fea4340bb91371321c3"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.289/permission_handler_apple.xcframework.zip",
            checksum: "3abe3c1ab09a16a4c64ce52088ad106ada4b1e128607593be0517a721d7938e4"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.289/share_plus.xcframework.zip",
            checksum: "be443cf280a264eb6dea7258eed19136d1d23025ae43f99a310230407d05b1d1"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.289/shared_preferences_foundation.xcframework.zip",
            checksum: "e32fc014bd966c095917579feef79cdf9f85a7b453d88e14dcb9fb46e666017d"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.289/sqflite_darwin.xcframework.zip",
            checksum: "f36b42804cf13f5a1203243342984052b55b73e6f52c75e544b60914749f58d4"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.289/TOCropViewController.xcframework.zip",
            checksum: "b33c61c167e3b2adae62dfb14c9c89defdb2a45fef21c66a84849b37978a58c6"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.289/Turf.xcframework.zip",
            checksum: "ded0ff4b6e3986090f24bc4df534006dfb703878297842e9e6b9b6da28238e80"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.289/url_launcher_ios.xcframework.zip",
            checksum: "7e1b84da51d97f183654017f2bb96001fd8c295b944587dbac9347452a6e7594"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.289/video_player_avfoundation.xcframework.zip",
            checksum: "5cd71ae0f153167f212598cad1cf928d680511117ed2806d385db23679ab638a"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.289/wakelock_plus.xcframework.zip",
            checksum: "a88f6d0877f9b7d351ae43729eaa41c8b62d2d795f330da135f8571a46c41d84"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.289/ZIPFoundation.xcframework.zip",
            checksum: "1d6bd65f57f3b26f02f366a28206394befb4830f3b2920fe24aa9b2aa9ca2c16"
        )
    ]
)
