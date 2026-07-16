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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.301/App.xcframework.zip",
            checksum: "e1ff9fe0192e52fbed2130bfd2b45e03b06b8e169123a965f714a7ebbb196436"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.301/Flutter.xcframework.zip",
            checksum: "76b13155af5b37ae9d3f6af4aeef91222b2ba495e2f4a3def996d49318530499"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.301/connectivity_plus.xcframework.zip",
            checksum: "0a4a853a79e1b9b3c40fcb29731c2da8df7d0b7843d20fcbf3a11a76499b851a"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.301/device_info_plus.xcframework.zip",
            checksum: "7cc535410e8095f64bb3d7d99e3d7291f16144e672b2b3310b4fec74f353e5ff"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.301/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "c34e1257ed65b71f190ea67d9df20a041dcdb633a678e1b379b10454eb288513"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.301/flutter_local_notifications.xcframework.zip",
            checksum: "29c4627b7dce18891165ad20a6667f52fe76c8844e8ac921a3fb674e8c2f3174"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.301/flutter_native_timezone_latest.xcframework.zip",
            checksum: "991bac4c4af049c2cf8bbf39a9bc2536fc5211025fb8b54bb288dfb0a4013aeb"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.301/flutter_secure_storage.xcframework.zip",
            checksum: "cf7b785163fed3250d434f6081f4dee7f23b42a8024e006a91c91b5c4147ad77"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.301/geolocator_apple.xcframework.zip",
            checksum: "15791866247a7bc5f6f6843028f5c7f1ca06dbeab6f1f370525786097044f884"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.301/health.xcframework.zip",
            checksum: "e3fb24c864b89731787ded3d987c0775cfa85f0d402197e130796d3b326ba81b"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.301/image_cropper.xcframework.zip",
            checksum: "c2467a7e742b777135ff9599020cdadeeefaf7bd8263ad973fd2ea5fe4bea19f"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.301/image_picker_ios.xcframework.zip",
            checksum: "cffc9abbc5c0934c30ffdf718b8de8e4de70bb6bde71079c8a71781c464d8e4a"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.301/mapbox_maps_flutter.xcframework.zip",
            checksum: "3285d8a61a96c57a3f9639b6c84ecd0a55b180bf5555de2f5aeccd37262fca70"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.301/MapboxCommon.xcframework.zip",
            checksum: "365767301d2471dbd5e7e91837a22bc1d95f07bdbd8f9085287e065abdeab4f8"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.301/MapboxCoreMaps.xcframework.zip",
            checksum: "30840a991e845761591ca7ae8313369be87b11a848262f9647bf015877b98ac3"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.301/MapboxMaps.xcframework.zip",
            checksum: "d64850d74dc604e3cc439c99723f47d9060c62abe5a526d08e4e5cf683e9a56a"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.301/NordicDFU.xcframework.zip",
            checksum: "ede708f6625c8ec3f5fc0cc2d8e526d54c275bdb392d2a63fcb87452146df5bf"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.301/package_info_plus.xcframework.zip",
            checksum: "31c3e15340f0378009a6a0f39fbb509d0a76af4d8edd6fd9d8f21cc354bd00e9"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.301/path_provider_foundation.xcframework.zip",
            checksum: "9fcfe99903bcfaffac9c61ee2961afcf15431d325b67a1779ca70613f31007c5"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.301/permission_handler_apple.xcframework.zip",
            checksum: "b1397b16dec009136b140f18715290ddfc027f5a26220c8b18b881a33a782f7a"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.301/share_plus.xcframework.zip",
            checksum: "871bfb7c1a93dbb554a0abc10798789ad09d0d8c4443f4e9345d1c7f22f3de48"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.301/shared_preferences_foundation.xcframework.zip",
            checksum: "b15f93cbb697a015a8d7a4f7cd997d7d4af1fb69b739d2a4ca5a34f2c88d3498"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.301/sqflite_darwin.xcframework.zip",
            checksum: "dcab0c3155020a2515339a70a65914e76dc1f80928edb84425bf970d59714757"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.301/TOCropViewController.xcframework.zip",
            checksum: "2e34b3fd7c11448a8645f77e831ede0dd5f6647165e86dc96f066db6f4e87f5e"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.301/Turf.xcframework.zip",
            checksum: "bcc7b68a9997d45a62c80ba2a5646e6f5c4cd47560573913d5dc19f3b05191eb"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.301/url_launcher_ios.xcframework.zip",
            checksum: "f4e93c7a7a00d5e4a7fa0f85ac23f9df4dc51359ce9013a518c001a677c1ed71"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.301/video_player_avfoundation.xcframework.zip",
            checksum: "813621c9ef650867a4bfa6fcf4907bb7088aa3ba2adf23b2f9f7d33113372a9e"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.301/wakelock_plus.xcframework.zip",
            checksum: "af9962649cf65c64644c332d9d353dfd82b9b96a66c44a16cc4b13cd32908bdc"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.301/ZIPFoundation.xcframework.zip",
            checksum: "0924ecfae56edbef8c1d8b70f49667edbbfd227bfecf0ef41648da6402f97340"
        )
    ]
)
