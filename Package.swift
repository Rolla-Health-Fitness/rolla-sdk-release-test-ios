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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.254.1/App.xcframework.zip",
            checksum: "6e37b90af316ea497965a52b7b682ca94075242406b56a0c985fe5338dbdf4d2"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.254.1/Flutter.xcframework.zip",
            checksum: "e9b86dd754fb7bf9a72c55d5620cad27c8c4f59f09dca6005f266bedabaa19e6"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.254.1/apple_health.xcframework.zip",
            checksum: "3d83a6c4b74750111ffac0aa9f0cf2c24216cd8c7cae627882fe287f7e088311"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.254.1/connectivity_plus.xcframework.zip",
            checksum: "d0504460cd7b80442492b63158d4a0622873ea5d25298ac1a90b43205a554f95"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.254.1/device_info_plus.xcframework.zip",
            checksum: "07e8df67189efb4b7a9e0cb88ee7164e1208b3037f4662eaae544e199fe7774d"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.254.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "06e30c0d78ca895a4649083fccc2e96b82321c40585693e4803a388435167135"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.254.1/flutter_local_notifications.xcframework.zip",
            checksum: "a8cfba2a7ed3eae71504edd7acb5add66a2243328de85b4275ea224fcdc77953"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.254.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "2a829b0fa261096a99f758e6cf9841fa13315a829058eca6932d33227ac31554"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.254.1/flutter_secure_storage.xcframework.zip",
            checksum: "9fe113cab6d8a7a000d539fa99501124e20cda925910bcefb4f9a98e4b22acb2"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.254.1/geolocator_apple.xcframework.zip",
            checksum: "fa15f274ca8ef8aa1337e273792319a3a001a6874136e93fa185d95f76c40180"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.254.1/health.xcframework.zip",
            checksum: "894d97c49ba8ed61ad10e079ec2b07f60d31731472d827c2224a62477766432e"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.254.1/image_cropper.xcframework.zip",
            checksum: "1a46688fb379af72a5c535bead02ab90f512817d8e13405dc8633b67e8af1f86"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.254.1/image_picker_ios.xcframework.zip",
            checksum: "5563b3030b9d75607643cffb741a256f28e8aa4d11936ca0d75686f8eff5661f"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.254.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "139dff85f29a2b55dc0a07c4218357083b43780d0a39f369da00ee35cc27b46e"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.254.1/MapboxCommon.xcframework.zip",
            checksum: "5f6b2c01f8c1cdacff4122b00d52e2cb4c77647441ee68452f12df018e97612c"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.254.1/MapboxCoreMaps.xcframework.zip",
            checksum: "abe2857cdb576b67be3076320b79c01cfd631316404fbf41102626ad83ea494b"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.254.1/MapboxMaps.xcframework.zip",
            checksum: "26929833252ec7adad1e7950d717352514d4ea22c73df52584c01392286f5949"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.254.1/NordicDFU.xcframework.zip",
            checksum: "66c8a814de259eb024bd2319a045cb4cc015e3c8873cc85f8fd2b0f841958fb1"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.254.1/package_info_plus.xcframework.zip",
            checksum: "82ec6ef1a6bf6c5de44045f9cb82461e8de9c97fb7efd8b7f556c478c0997619"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.254.1/path_provider_foundation.xcframework.zip",
            checksum: "dea1c7deb6ad818e8984243e1f25ca9febfce7bd5668bdbe1d9c761bd299e5f5"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.254.1/permission_handler_apple.xcframework.zip",
            checksum: "faa17bda7502a2dbd066e1ae4475894b71885fb742fa06a70870d2422fc2fa00"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.254.1/share_plus.xcframework.zip",
            checksum: "2c563bdf8672f3b9c4a9c4f349b6073cc92e55dfa56eafc463d5e2f4edc2e350"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.254.1/shared_preferences_foundation.xcframework.zip",
            checksum: "a452329602af2730792203e86c83444451063b342d51e2699769594a9f4a473d"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.254.1/sqflite_darwin.xcframework.zip",
            checksum: "5ef47d4c3f854393470d186993580ab1f05375f94b0568a6018968adb7a32f6a"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.254.1/TOCropViewController.xcframework.zip",
            checksum: "33f1200385e8d645c5bc3862360b957f987012869931dcfb364681f751774b38"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.254.1/Turf.xcframework.zip",
            checksum: "dac42fe4f28b74bb75ac542a4f343bf8901c2b5a3f02b1a4d83e2c3fe828b6da"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.254.1/url_launcher_ios.xcframework.zip",
            checksum: "fecbf8cb80535e2d6c84310fcfe33419a0fe95a5b2753d68e73695d09da0185a"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.254.1/video_player_avfoundation.xcframework.zip",
            checksum: "ff61ded3bb57f0c1f6d6cdce689c53573478ef703365ab5fd8dd276e2e8890b6"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.254.1/wakelock_plus.xcframework.zip",
            checksum: "45e59ef38ff95580a10bf584165e2b4062508c5c254ed724ac20370f7a0507fe"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.254.1/ZIPFoundation.xcframework.zip",
            checksum: "93cb114be2fd790ad9db1d7cec6f92256eb690fdc28524100952d9fcb4f48950"
        )
    ]
)
