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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.328/App.xcframework.zip",
            checksum: "c9f14a273afb526c9f960b1af747661a3aa905cf7eb4cad1a3f66571edb2b82f"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.328/Flutter.xcframework.zip",
            checksum: "adbaec1deefca0eb3b91229117aaa108285db1c194edae4c7e22ab5e888613d8"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.328/connectivity_plus.xcframework.zip",
            checksum: "fac010c1adf49838e9e1f277b54f7f0401ec9e899e4faef224e49a67880af822"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.328/device_info_plus.xcframework.zip",
            checksum: "d633da43edc622d6d55db4a349242b6fa1e17258f9930d87b3715a1df7e17b8c"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.328/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "37cddc8cac0ee2f7b7bf5c869951f9d2b0284fc27cc313743bbe053b41dfe80a"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.328/flutter_local_notifications.xcframework.zip",
            checksum: "fbecfe2d188da9ade3cf3756de6f17a4992a44539d0819ae3f8a3df9ec810631"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.328/flutter_native_timezone_latest.xcframework.zip",
            checksum: "e58bda995fd4412f4a02cdabd581ca1f4f21fc993f1ef6207ccd7ada25f95c2b"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.328/flutter_secure_storage.xcframework.zip",
            checksum: "bfc1d7a24b296276a08950a1177453094c06d3bf226530e6eafac32270a25794"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.328/geolocator_apple.xcframework.zip",
            checksum: "e8d91b4359b4420b07ad5ad72b33d0d6a9a667a51fff8c546954de2159993991"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.328/health.xcframework.zip",
            checksum: "5d615015634eb721706b73731cc5dff8bf4a16cdcc1ef6eff9b3088e2967bbe2"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.328/image_cropper.xcframework.zip",
            checksum: "47349f8ef8ead6017cb691123e93d294502ccc9121b019ac579663360762cdc7"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.328/image_picker_ios.xcframework.zip",
            checksum: "d14ff159b735c0869cf083529b3e609b3fb3abc8a9fddb5e6a5e84813de250c4"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.328/mapbox_maps_flutter.xcframework.zip",
            checksum: "f0f6e89e8fb25b246a92f200bd76b1bd5b79329fe6318de03565d1018c0b1649"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.328/MapboxCommon.xcframework.zip",
            checksum: "36b540ef41698b712882c83b6eea324dfe4e0853fc37030b1cd45a7b7ac04bb4"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.328/MapboxCoreMaps.xcframework.zip",
            checksum: "d54e8c8b8d67d9c96d2cdff16403ffd3ae2280247cb6a94c942bf7f26d70c06b"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.328/MapboxMaps.xcframework.zip",
            checksum: "e2cba08d4fcb3ac13c671079444433d13f3ee8f50e42a7fb964d8b09e1d4c036"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.328/NordicDFU.xcframework.zip",
            checksum: "be15ab3f63d8026c43c12a9c4026ac289c71dfac0c3fe77788032da1063cad17"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.328/package_info_plus.xcframework.zip",
            checksum: "e51b96167899242e14de539a5b54652101ca4fef8e51709e296eab6b516e44cd"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.328/path_provider_foundation.xcframework.zip",
            checksum: "0a23ddbb90c883a42a6304a08e23e5ac21a15e8d08cc1298719fa5c80d716ee0"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.328/permission_handler_apple.xcframework.zip",
            checksum: "e007ba406e344c55c9b4d5b282f4a6d302c73c4c0ae7febd1470fc9f5cdd1246"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.328/share_plus.xcframework.zip",
            checksum: "644894c1de03de56c7d8a6ef246a9dc4cf72ae47c395413ac22da73626be8b71"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.328/shared_preferences_foundation.xcframework.zip",
            checksum: "238ce316fffec58409a8844b7f38214ea174b0119f84f7c95afa7bcb085a62ca"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.328/sqflite_darwin.xcframework.zip",
            checksum: "d2d94474aa3f7567e7e14d4016b700082cd732c6df69756b137d2f1e85676e18"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.328/TOCropViewController.xcframework.zip",
            checksum: "73475fee9fbaae700d1fc247f0ccca7afcfb381ad8c9f77a4e1c7602ce9a76da"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.328/Turf.xcframework.zip",
            checksum: "481e3b3c90304d59229745ade8a4f33fd12007d2f7aa1b444437bfa4988cfe70"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.328/url_launcher_ios.xcframework.zip",
            checksum: "5f95ec323378026f6c1e769a203c3b49689089842dedb535b7ada810252f8406"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.328/video_player_avfoundation.xcframework.zip",
            checksum: "234d600824cd00facb2510eb692d332dc7d7cb404818fe5de7e8a6a133087210"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.328/wakelock_plus.xcframework.zip",
            checksum: "8bdb1019f239f793e235dc7d0b80a2da057fff355a92c4ace6af06f8da4bf48a"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.328/ZIPFoundation.xcframework.zip",
            checksum: "86f62c44ee27f3fe307ef8e70a9b90f71d8dc1ca5ff0aa8c40819c6a41e7228e"
        )
    ]
)
