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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.276/App.xcframework.zip",
            checksum: "e5c469d48c44afbb5f1b26cf1dbd80f2b35dc60b985f786b6d001c5a8a02eb22"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.276/Flutter.xcframework.zip",
            checksum: "fa5d509729bc3ed7f76e99504511f3ace8f8d0478a44947b9d1a6e9301fac98f"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.276/connectivity_plus.xcframework.zip",
            checksum: "2d7a1afc9ccb0617b4a5d6f0005cf7c0b2460279669cbc6432b1b6a700f82656"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.276/device_info_plus.xcframework.zip",
            checksum: "40514be2be65ff5d7fbc34b6329bce7486062880ae266aa55285498e5c3bdaee"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.276/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "5a806b7f18966df728f08b7ee2debfa5c337c9655b0a6e61ca34f7648b1e1ab9"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.276/flutter_local_notifications.xcframework.zip",
            checksum: "9c7ab331e25ddb63bb291af0d9617e1407aa07f3f99eebce383a2edb7966ee8c"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.276/flutter_native_timezone_latest.xcframework.zip",
            checksum: "bd7a4e47754cfc6fe958962a3fbe157542497cf4f44f7a2c7619e6d591fa8075"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.276/flutter_secure_storage.xcframework.zip",
            checksum: "3f0712447d9a2fcd3857cdd75b333faf61aa0718cba9da1e57afef484e8a88e6"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.276/geolocator_apple.xcframework.zip",
            checksum: "75e9b2da1d09db3ef283f74648e145c36831606c33b777f54bd10bc83b7478a8"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.276/health.xcframework.zip",
            checksum: "f490529ba5e656b0b810c6b2d9d2b9bc3487f5778f2af99962a03318ce9cf4b0"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.276/image_cropper.xcframework.zip",
            checksum: "b27c5e648b547cc463b77edba5776323d65778268d44f46206cf25013cedbec2"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.276/image_picker_ios.xcframework.zip",
            checksum: "0b7ec8db3ea5b7d413b264f332a38d7589bcae53996a02ace4e4e4341f354d8a"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.276/mapbox_maps_flutter.xcframework.zip",
            checksum: "a8fb3c97c6686576d2d86c9fb1aeaf219fa201bfb0bea3b9a1cce76a618f2d1d"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.276/MapboxCommon.xcframework.zip",
            checksum: "a4ac77a46f883d141bc606571abc8ae6047e8fc5ee8d782c99d8d5e642ef4cee"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.276/MapboxCoreMaps.xcframework.zip",
            checksum: "6e85cf2813c4ea3b86f33ebf672f83bbcc532b7f24b29816dcab5b36726dc350"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.276/MapboxMaps.xcframework.zip",
            checksum: "f2485435a7a075ec53ad253ffcfa1b72f8139a746355134d8b05c40b62b8f3e7"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.276/NordicDFU.xcframework.zip",
            checksum: "0b99390a75a3c9e58b471a038685cdceace53c755af0696fc6c142add9bc5b88"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.276/package_info_plus.xcframework.zip",
            checksum: "39f9ec8d03dfc7e50120b5a18af0efc661e325b91896b94d1fc8b8973bdd622e"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.276/path_provider_foundation.xcframework.zip",
            checksum: "00305b77e6c9c03917fbe5f9dd51473e59451f497e85a384170fdf68ee315180"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.276/permission_handler_apple.xcframework.zip",
            checksum: "1b9eb34104af8f4f1308cdd446b936d281ed07fc93438207513a3a969b70ff68"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.276/share_plus.xcframework.zip",
            checksum: "d034d95ae54dc7aa40d24ad088f6fec1257e8dad391c8ca3b080ec29161e2682"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.276/shared_preferences_foundation.xcframework.zip",
            checksum: "75511358a63ccb6da2321c06a26fbc27f48168c1f77aa61722e22de502ccd880"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.276/sqflite_darwin.xcframework.zip",
            checksum: "ad77f355e513d128a4842acc37fda673c87fd992e8053fa0f4b08927827ca254"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.276/TOCropViewController.xcframework.zip",
            checksum: "f53d55a67b06fc25bfce744532837c8d3ea06a0daa9677791915ad2eef2b5cd2"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.276/Turf.xcframework.zip",
            checksum: "87540ca4e3c78c2a43b3f2a74673e262985372f2b5b839563a69be9a2eeb074c"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.276/url_launcher_ios.xcframework.zip",
            checksum: "c65bb9099540f3a45c7f3fe60841793c9e2e594451298d7662fdfe6241e65f4e"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.276/video_player_avfoundation.xcframework.zip",
            checksum: "6d5e0cf2e2d8e8ba22bf4632505ef2fc2833e79e93bab914bf84907b05f95ad1"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.276/wakelock_plus.xcframework.zip",
            checksum: "72ba09ea72285efdd0f22714f06ac335958d38af06a93d356888497190173aa9"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.276/ZIPFoundation.xcframework.zip",
            checksum: "3c5d05a68dc3198540d68d9391377902f97e376883596e74145797036a2f4d04"
        )
    ]
)
