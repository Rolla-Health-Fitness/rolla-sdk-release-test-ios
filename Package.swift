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
            dependencies: ["Flutter", "apple_health", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "FlutterPluginRegistrant",
            publicHeadersPath: "."
        ),

        // Swift wrapper API
        .target(
            name: "RollaSDK",
            dependencies: ["FlutterPluginRegistrant", "App", "Flutter", "apple_health", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "Sources"
        ),

        // Flutter module (Dart code compiled to native)
        .binaryTarget(
            name: "App",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/App.xcframework.zip",
            checksum: "8779aec34138c8886750f6fa85bb02a48ffb4eaaea2d40d310c57f5b1d471626"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/Flutter.xcframework.zip",
            checksum: "38b84ddd68e14c66311cbc35a6bbd06d3fcdb51aec3e3ef96f18f92c7ab66f0c"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/apple_health.xcframework.zip",
            checksum: "c51d22bc2378b24b0449233c427c382990457971cdec1f4f0e75f20d6242ed98"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/connectivity_plus.xcframework.zip",
            checksum: "539a27733885ccbf72b7ec8c68418677ac3c0eab7b1cc386dfa90968f2a6bbde"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/device_info_plus.xcframework.zip",
            checksum: "74b701e731ae0f872be8df96194e4e76c8f567db91c94227fb16ee582c4e07df"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "270d5e1735d925f310ce97b2fa23e546bf0a2cc9263fc8ca525a2be53f1431c6"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/flutter_local_notifications.xcframework.zip",
            checksum: "598f2716eaef7f505b2bda4448a6d24f77af827bcb85ab090aafbd46e8bee958"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/flutter_native_timezone_latest.xcframework.zip",
            checksum: "3f3ad936ee6d1625bbf34820476b27658b73fe8ede1e9e18ee6552a99718c194"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/flutter_secure_storage.xcframework.zip",
            checksum: "0d9e81533d13f978798baeb1580b45c6b0df2c0187fb899141009f51c7793218"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/geolocator_apple.xcframework.zip",
            checksum: "1c4ed6e0fd70c5b896b3867fe6e32b82347e688e631ee0e537954a71631816dc"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/image_cropper.xcframework.zip",
            checksum: "1fd4db478bbcbaf3e5149bf76028a258aa8ecb8a2b34bef0ad971ab427052291"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/image_picker_ios.xcframework.zip",
            checksum: "58f1cb1937925ddf9ba35bbdff15e478998de4bf155da7ddead94bf803363a2a"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/mapbox_maps_flutter.xcframework.zip",
            checksum: "5877490c53c5840fd6ff8e3d7ff3d031b602cfe53c8bfbb191395959f72b8035"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/MapboxCommon.xcframework.zip",
            checksum: "b8ab9f022907e203e3c54b177103c46b2cef128acdd8e85e6293fcc47f2f4421"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/MapboxCoreMaps.xcframework.zip",
            checksum: "0923bfc1e53b0c0559e75fe35d0318a3ad60f7870dd68b410cffa0989a692f2b"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/MapboxMaps.xcframework.zip",
            checksum: "90281ba33a8e4f7a9a609e698f812414a6f69cfd0b8a351b3922452fd99d390a"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/NordicDFU.xcframework.zip",
            checksum: "d49aa730cdd2262893d833be6528f9a6d2032636f0173ff08a184fda5124b766"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/package_info_plus.xcframework.zip",
            checksum: "48d63f39227447be0d2155ccfe2b6c92176bd29cb3eaf1d23902b279e31cf9ad"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/path_provider_foundation.xcframework.zip",
            checksum: "0a2f3ef7aa15c858e32376f832d61d0a59dcc2150b8eb96cb49014358a2a97e4"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/permission_handler_apple.xcframework.zip",
            checksum: "5366552661f4317be5d3e39b7fd8dce845fd5857339604527e008d8bdaf9883f"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/share_plus.xcframework.zip",
            checksum: "5c3431a4c183f2caabd23e3b72393f3f4d73e5edcc804cefa77f6073f383b071"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/shared_preferences_foundation.xcframework.zip",
            checksum: "2ea3e64c15b67c4bfe2d5cca53bef099e4ced930e58237f70c5fd96dc03c65d6"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/sqflite_darwin.xcframework.zip",
            checksum: "f3d9799b32801216ef8efa4a9ca6137729f3873fc73b79706277204fcd72f6ca"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/TOCropViewController.xcframework.zip",
            checksum: "7bf9c2f7276057f5f734b722b54918ab56eb77e7c2ed58facae2d6f1f4fa075b"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/Turf.xcframework.zip",
            checksum: "6ccde05c5e1cc95fabc6c7329fdcf24c8e37c22504a0b9e23f520b7ccee2d7fa"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/url_launcher_ios.xcframework.zip",
            checksum: "d9bbf71e6dd6c4f995c0e84f9c0cffadb47b4772c6b73e93cebc4c7b8135fe7f"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/video_player_avfoundation.xcframework.zip",
            checksum: "3ca04922e3e659c3e5cd214c7d521f8b5ead46aff8d53405a5d4892e19b01768"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/wakelock_plus.xcframework.zip",
            checksum: "3e4715ecd2662a90dee5e1347d289f1de5ca1d525e2703454576cea360cfe50a"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/ZIPFoundation.xcframework.zip",
            checksum: "9281b1a08b614939fd4b4309cbec6b662428ec827a63c3abe3c349ec2b4dbe53"
        )
    ]
)
