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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.243.1/App.xcframework.zip",
            checksum: "bc6682eb4dfc8a4466f1e64622d6bf24b9547e292d168c464ca334c4a2ce6d70"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.243.1/Flutter.xcframework.zip",
            checksum: "a0f678331fb175e95480e23c45c46ef4582ad6dc08df4b0337a021aac4564cba"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.243.1/apple_health.xcframework.zip",
            checksum: "28d7533382687b3de0fd0165de8922c8959642345f4ddad4337b4148ed6245d6"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.243.1/connectivity_plus.xcframework.zip",
            checksum: "fd48a61bbff2ce82ae1d3aaa4dc9f21dec6fab4ef27ff5a264870dd7bb523618"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.243.1/device_info_plus.xcframework.zip",
            checksum: "29464bbf33d9eaab0aa3d464ff88516b27496226017aa3f32ddec6f283a81e01"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.243.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "5ede344d5c0729cbef508851c5f1410e6f28df826431d881a7fe7ab7ccfb4040"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.243.1/flutter_local_notifications.xcframework.zip",
            checksum: "a7545958aa8035860cc649726727852cae328a15c8c694f960be306b1cfad6c6"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.243.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "32ed6fe9bb9c65dda35b63b83848ba1fbda50d55a82fca859dadd54a07225aa5"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.243.1/flutter_secure_storage.xcframework.zip",
            checksum: "d4d98d436eb1786788a7ad3b48b5c7affb2a0c47dc295491be05d5114558ab3c"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.243.1/geolocator_apple.xcframework.zip",
            checksum: "122da0ba99ad60bd8927bf4c6117ba0c106c9dac09c73ef1e0d2b98b79d37876"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.243.1/health.xcframework.zip",
            checksum: "e2687147f07fcbc1dff98d7ca0242ed05437cb8ac23e45994c7a9aebb90f87cd"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.243.1/image_cropper.xcframework.zip",
            checksum: "72576d1cb097da525c8bfe5f6a4f98f4362884163de50b1741b3c4bef218bfea"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.243.1/image_picker_ios.xcframework.zip",
            checksum: "d707019a1567894877bf0db02c1cec2f0cf110751937e37c3bc9dc42da63e0f7"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.243.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "a6edfa27620038927c1ac470547f6f71c91b7784ed35c293a5b7cdc4ba879210"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.243.1/MapboxCommon.xcframework.zip",
            checksum: "b4940c79da7bd58808c5578965b07a38a3348a5122b31de00832fc64057c2a70"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.243.1/MapboxCoreMaps.xcframework.zip",
            checksum: "6352e88dd94cfa5e98b26690f579a3c06ce5e2970709dc4d7501b3650b7be132"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.243.1/MapboxMaps.xcframework.zip",
            checksum: "568d3ee87d1db67e698480288980e491abed9d292a85272872b78410c5def924"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.243.1/NordicDFU.xcframework.zip",
            checksum: "255d881822c924c0eeb9c4416346f4bae9388e0a2f93aeb299ffafb5d2d0017f"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.243.1/package_info_plus.xcframework.zip",
            checksum: "a2654d9a292f21afe7a40877525f27e78d6c88ed79a480c2b32927e3f80684fe"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.243.1/path_provider_foundation.xcframework.zip",
            checksum: "10869ac5b52a8fea225beba4a73260a624b472273d7db19438e63ba4bd5c2cc1"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.243.1/permission_handler_apple.xcframework.zip",
            checksum: "cac90f9be12d982d39504761f8c6b75717b8fc50dbaec2ab2251393472e5d918"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.243.1/share_plus.xcframework.zip",
            checksum: "d8397df1388669929b91b7619000d06e969a36c3f6d313accd5f61ee01dcc82a"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.243.1/shared_preferences_foundation.xcframework.zip",
            checksum: "b4c0a4510d865438b931d18a74824040058ea20b849b28721783cd16d92397dd"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.243.1/sqflite_darwin.xcframework.zip",
            checksum: "c8cb33315cf6a509cfa71fb155178d8dca768da1330533cbfa2bfb8b48f6e9f9"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.243.1/TOCropViewController.xcframework.zip",
            checksum: "6c3faa18bad57a8d4657bf50436818cf13df6b2737a0403325b1b05e2ab815b4"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.243.1/Turf.xcframework.zip",
            checksum: "e94267adc20dd040fdde2c57de12d152b0130a9f4f99ebdf4e8da710e45a8248"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.243.1/url_launcher_ios.xcframework.zip",
            checksum: "ae2bebb9143e82838f71de178eb9163b0642e81d053f442da6ede1d83811a34e"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.243.1/video_player_avfoundation.xcframework.zip",
            checksum: "c2e7afc58cb6da6935677a1b2706dc4ea1f65f111c28f8d8158f6e6359d27a4d"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.243.1/wakelock_plus.xcframework.zip",
            checksum: "88c602aa4d657a75351f90189ea3ba3ad3dbd656fdee646d9ae8b15eabf06ba5"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.243.1/ZIPFoundation.xcframework.zip",
            checksum: "5d635e861b4bedda63290320c28d0c5840a946a6e23cb15fec879694b912df14"
        )
    ]
)
