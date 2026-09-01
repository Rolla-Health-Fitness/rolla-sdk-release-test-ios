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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.36-test.345/App.xcframework.zip",
            checksum: "4c4cf6fda998212bd405452fab8fe6e630f7529e4e282f0362077a054112ead6"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.36-test.345/Flutter.xcframework.zip",
            checksum: "66b5807bebdae07af83cd45bde25b5cc3725e10cb3b5bc71ef057314ad4373cf"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.36-test.345/connectivity_plus.xcframework.zip",
            checksum: "f5030857f09c4f66e56a2919e17cec2a71656e3b8d7efdb082a3ae7492c2ef1a"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.36-test.345/device_info_plus.xcframework.zip",
            checksum: "7100fa06a359f4f435e58ddb8b852fbc487aaeccbf3eb03610b442a99682f752"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.36-test.345/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "a04cbd061d0844047569f40913158aa65391bd4dbf57722230de77d4a8c46d37"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.36-test.345/flutter_local_notifications.xcframework.zip",
            checksum: "7387937e349fb41552fde1cc1a4a5373a463a07c4f3c79ab00a501002a204390"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.36-test.345/flutter_native_timezone_latest.xcframework.zip",
            checksum: "ed1546f88dc46b26deaafb79e9c59148520bd3aa9df8b4a534c71b0fb12866f1"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.36-test.345/flutter_secure_storage.xcframework.zip",
            checksum: "b2cdb0871bbe390e7ee907677ff2233237e1f7406dd2b53914f8008fff6c66db"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.36-test.345/geolocator_apple.xcframework.zip",
            checksum: "f50dfbd1b461655bffd8c944f56a5a327db8101f15ce232a1cd935a4d1e68951"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.36-test.345/health.xcframework.zip",
            checksum: "9362dce9e10eb494d40dc4298a21771201e5252417fd31bbb2595e6d0571be0c"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.36-test.345/image_cropper.xcframework.zip",
            checksum: "4a664497e1c934058b12e9a7dc3a54e77ff559b1dcbcb93898f808aaea6b86f1"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.36-test.345/image_picker_ios.xcframework.zip",
            checksum: "e5819249af07f04dc6aceffced8d4352517cb71fd708a9ee30eb8d97af8ef23b"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.36-test.345/mapbox_maps_flutter.xcframework.zip",
            checksum: "804d7fb3b0bc49257503e580f8ea5c3ea3546ff315867b17cd2c4e43d823e022"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.36-test.345/MapboxCommon.xcframework.zip",
            checksum: "0ad5378e9906fb1dd892d6d383a7352215f5ab8f20539529ed6a128305bcb585"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.36-test.345/MapboxCoreMaps.xcframework.zip",
            checksum: "80aa70ad71423af8162dafed03d65544cd7e4036d2c89157c36207bfe44bdde5"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.36-test.345/MapboxMaps.xcframework.zip",
            checksum: "e98083cea962285c5af5255f652ed6ece83c11573b84468f7af01dc57fa4e84e"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.36-test.345/NordicDFU.xcframework.zip",
            checksum: "a6516f178347f126787db3bf16209ca5c2a90116ed0599de926d266fdf64b17b"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.36-test.345/package_info_plus.xcframework.zip",
            checksum: "1448b9b8bfb5b5258ea3d81e4ef91c96ce41cc61584aa1548b23ba4160531061"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.36-test.345/path_provider_foundation.xcframework.zip",
            checksum: "a498e18ed97a4a8bc170d9e79ecdead4a9c927cd79c8e1f4e01522c9ad7fc2d7"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.36-test.345/permission_handler_apple.xcframework.zip",
            checksum: "1136e764496b6d49ad3c91983ebfe2f28a547cd415912ef1da0549c77d130f22"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.36-test.345/share_plus.xcframework.zip",
            checksum: "14b029f1ae002850b031c06993f07ca14ba67dc8d5107a1cfd62065857346ae9"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.36-test.345/shared_preferences_foundation.xcframework.zip",
            checksum: "7d7466c1da336dbca0af3044599799a626e21bdb1844b59a0c18fe877d66e959"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.36-test.345/sqflite_darwin.xcframework.zip",
            checksum: "a6798c16acbbca5d932861261bdc2f2ab36fcba071b3df3f9575c666599551d9"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.36-test.345/TOCropViewController.xcframework.zip",
            checksum: "6e559dbdfab52c94d148e772b8132bf661e127dacdb754a210b56951567445ae"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.36-test.345/Turf.xcframework.zip",
            checksum: "06d8b9d54763a307d4eab87cc2b1a13718bbba9b5288aca5b035f15145700cfb"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.36-test.345/url_launcher_ios.xcframework.zip",
            checksum: "2f4cc3f2d80164c6dd54e13d110ec5ed7684bd01f3ab2a108d74d373fb0ef4ea"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.36-test.345/video_player_avfoundation.xcframework.zip",
            checksum: "e4f2ca25baf7f4f99a14009f5896cdecd2c7149e2b3a3b2b61fcee1e899e1b10"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.36-test.345/wakelock_plus.xcframework.zip",
            checksum: "d74bec6842fee65b6ac8a3f8ee2b8f353e89c12fb3f436a3e883402865de4137"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.36-test.345/ZIPFoundation.xcframework.zip",
            checksum: "62761e76e0fa3a98d61f4ce977374672b216d6dde450d1614e17239a876ff8c5"
        )
    ]
)
