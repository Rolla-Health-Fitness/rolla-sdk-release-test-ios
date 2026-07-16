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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.303/App.xcframework.zip",
            checksum: "127d313b0529a33caf0768cdb00e2ddbb8744761e426fedda1759f5189d021a8"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.303/Flutter.xcframework.zip",
            checksum: "d4712f8153d8662fb92baa10da681512fcd741ffacef45375da1724e992b9d68"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.303/connectivity_plus.xcframework.zip",
            checksum: "c5b6f54eb5d0549d07df2f924638ac5cb3fe967586fcdacd8984d3e6c64d8b8c"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.303/device_info_plus.xcframework.zip",
            checksum: "9181c7fc22fd39c2eb57b0cff3ce7c0cb84df5ce706bac2868077a77499978e5"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.303/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "bd00ec3eb047b96ea6654ec07cbc392dbcc5cdc7c5482f901621fa8bcfe08eb4"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.303/flutter_local_notifications.xcframework.zip",
            checksum: "f94c46b5771ea24a66b45ca2123177d4eb06ead45f70e2a14004a0522b801703"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.303/flutter_native_timezone_latest.xcframework.zip",
            checksum: "710e6834ba412a154f116c55ae6095fd50b4b2c53630968cc3510f22ff967c70"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.303/flutter_secure_storage.xcframework.zip",
            checksum: "0a3f94e8161b02ba6caddfffbc23eb4e23bfb35f590a82377937bb3fc4a8e6a7"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.303/geolocator_apple.xcframework.zip",
            checksum: "792f2d068e1e9331c00ce8d1f94949d74ab2f4019214eb6e6a5227d9b5c6d53a"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.303/health.xcframework.zip",
            checksum: "d56fe00aaa41d1e26196e9cf096c3e7e0b5a0afce9807e4aedac91f3a74af91e"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.303/image_cropper.xcframework.zip",
            checksum: "92334650830042ce2046ad231b35939d6e4efa94a7a73896c4cf58d39d6757cb"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.303/image_picker_ios.xcframework.zip",
            checksum: "39b3df0db20d9c8d852ecef45f00a4136bb8e5b345c3c23817474f2b684d51bf"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.303/mapbox_maps_flutter.xcframework.zip",
            checksum: "bef6d255c1419df23eafcc47286103e2f1863af62ec1b507d8f2ae2f893010ce"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.303/MapboxCommon.xcframework.zip",
            checksum: "4411620c5008ca0c87cdf5baafa13c56368df2bf9dadc06c60e5752787fffa43"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.303/MapboxCoreMaps.xcframework.zip",
            checksum: "b6228c14636b636bc952f8e0d900af7c97b66f05d9c495a9b74841333d5db2c8"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.303/MapboxMaps.xcframework.zip",
            checksum: "9f559ad41e41e66341fe23bf0d1b38c2337b7211468414a2f2251012f3162144"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.303/NordicDFU.xcframework.zip",
            checksum: "11f832a0db1e8724f0eed0e030ab6e275b63f8ce88e9a320786bcb8e165dc064"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.303/package_info_plus.xcframework.zip",
            checksum: "6accac89d5724489f893add8e79273e3ec7205821f226200bbab954ed576aae2"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.303/path_provider_foundation.xcframework.zip",
            checksum: "33a58b8511ccc34649d99591c0907337934d673c6f795735d2492cca87d36933"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.303/permission_handler_apple.xcframework.zip",
            checksum: "03fe47e471709de593d3158ceff88eeb4be7f12d6d120136971ab170f00628a6"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.303/share_plus.xcframework.zip",
            checksum: "a45c4fa6587acb9a3f1c73275974cc73b4284223119c45011f38fd02e16c9db2"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.303/shared_preferences_foundation.xcframework.zip",
            checksum: "46923b6064828fdde3203e624135f434150940340aee80f83c9618438f1e759f"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.303/sqflite_darwin.xcframework.zip",
            checksum: "70153eae132d4d464dbd7289601b82968f56f6f3765e7aea5e51e59631bfbd87"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.303/TOCropViewController.xcframework.zip",
            checksum: "8b8ef6c16abe9ffe246449f778a042b1483451a4c4a9f76a829da571f38ccf1b"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.303/Turf.xcframework.zip",
            checksum: "9f6b57ea14838cbc25a6482f005deab72c849f4b994ff6d39459e4646abf7b60"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.303/url_launcher_ios.xcframework.zip",
            checksum: "31e43adbb377cc92e3441b9d6076f358e0ae78a2144e74201a92d6d3419e957b"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.303/video_player_avfoundation.xcframework.zip",
            checksum: "68793bff69524fe2a360e3ac8a54b28a71781bacb2e3400a1b4f964695956071"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.303/wakelock_plus.xcframework.zip",
            checksum: "a484082c4967eea8b16bafba784e717a87ea8f109f6f63478ec9379b91766b7e"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.303/ZIPFoundation.xcframework.zip",
            checksum: "5e618653005df6ec8ba2517b71805ef00d25b7e8c7f02d61e445cdb8afacc4ab"
        )
    ]
)
