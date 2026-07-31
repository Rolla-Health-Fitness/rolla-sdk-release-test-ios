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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.327/App.xcframework.zip",
            checksum: "de8254a5b45de12bcbd695bd0bac36257c451cb0734c7b8b45c2c6565986c37e"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.327/Flutter.xcframework.zip",
            checksum: "10691ef6125e494196f4435bd99e3fe20687d8c17ee6b0565e21d3ebf4090da3"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.327/connectivity_plus.xcframework.zip",
            checksum: "5e86b3dbcc5ac819ed50c9416f5443156ce8a7bb9f5c83e694bc5c7874dea298"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.327/device_info_plus.xcframework.zip",
            checksum: "75b43d68cc35348a1ae9fd8dee5107c9afd7514a48fbe1891b8921372858cb5f"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.327/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "43ad7e354399e0da3545158f020f4ba2fef16f4eb49ebe5490ab2f96b973cda6"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.327/flutter_local_notifications.xcframework.zip",
            checksum: "3fa2ad89f4c03b4402d88b7e1a442c432e2cbe304e8f2115526f335f300b3996"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.327/flutter_native_timezone_latest.xcframework.zip",
            checksum: "a3d4ee22850764beccd5334455e9a258a53be623afc16842933fac3a3f3f5b4e"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.327/flutter_secure_storage.xcframework.zip",
            checksum: "ba11a34c8a54a33ee8e2c0b95769445a0d69c98609f4a4fa97128f5657e34240"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.327/geolocator_apple.xcframework.zip",
            checksum: "4186b6fee7a1ea53a500791a8f52edf121271b73470683a9e3d8a78ff5b17428"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.327/health.xcframework.zip",
            checksum: "37cfde46969fdb71f1bfdbddd465d6917b76f373396e840aa489d1d74c7ff2ed"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.327/image_cropper.xcframework.zip",
            checksum: "601653dce75abd93d587eb65b2e1732eaa0d96a71b3584dabe5ca6db905f9c9d"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.327/image_picker_ios.xcframework.zip",
            checksum: "31f3633767a168d82cfd76abe010adbf7ff1c83176c6343f0aa94a58ed0826b3"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.327/mapbox_maps_flutter.xcframework.zip",
            checksum: "2a39593e28b2d57799291fbb0b9ee9cf26f6df09369e2dda4b023a64c293b72d"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.327/MapboxCommon.xcframework.zip",
            checksum: "dd889f9e388ffba5a3f02df6658b672edc0bd1517381e1756e7311329b6a5e24"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.327/MapboxCoreMaps.xcframework.zip",
            checksum: "ef3e8fc7bebd1117b9a2a38edeeed4c1e9e0073a8ccb65674c61004bc92740dc"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.327/MapboxMaps.xcframework.zip",
            checksum: "0c7ea6a571e33df435a47aea75844a12c7447355ff265bc09341d30a1661a79a"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.327/NordicDFU.xcframework.zip",
            checksum: "b26ae9d49a3f30985dff4eb20c005afcf8d0da1c734c576888743eb262f32ff6"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.327/package_info_plus.xcframework.zip",
            checksum: "18d4d22a82ef43367a44c224c96dff4ea4acadc14fd722865d9aff6e610e2252"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.327/path_provider_foundation.xcframework.zip",
            checksum: "c14a9cdb0bd5d3ff43c0175a5470106e8317e2f569718f0bcff490e0d3ba4e07"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.327/permission_handler_apple.xcframework.zip",
            checksum: "18a3c1a5c5471ba709086fb416656448dea778c53a5c7fc0648a43acae1212e9"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.327/share_plus.xcframework.zip",
            checksum: "2a79ae7df3240522a9664b9179e0445ddd85c38511495bc2f3c0ebc239b41930"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.327/shared_preferences_foundation.xcframework.zip",
            checksum: "1867757037376d6259c0cf4ff54944159a36fa3c14feaa312f4913e221936a26"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.327/sqflite_darwin.xcframework.zip",
            checksum: "9dcd7f1a2189bcd4680aacc8ada4c2c9073116cc30c226a645f0d13ebf218ca2"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.327/TOCropViewController.xcframework.zip",
            checksum: "01f7ef9de76505ab1c9fbb5604f828109eaf75596343a4e4d25d55886588320a"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.327/Turf.xcframework.zip",
            checksum: "6d6f7dcb2676cb4121754c4ea6ceb208ce68746ac13571ef7e7ce4fb1b93c20e"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.327/url_launcher_ios.xcframework.zip",
            checksum: "7b2835715b64d450fe5c456a4899adc0233371b3138c2165b5b152a66d695bff"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.327/video_player_avfoundation.xcframework.zip",
            checksum: "ba87bb2df831bd7ea18fff173cdf964ce4be37004b07e086fa43ab593b4d3cc9"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.327/wakelock_plus.xcframework.zip",
            checksum: "7e0fadc8122a0db23b28d57f386c9ecf9e955c29cc8db713dd32e0de064ddfe2"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.327/ZIPFoundation.xcframework.zip",
            checksum: "79d38a2494a863e59d44d1d35dc8bbc6c1653e27ac18f635ecc3b4b2c2282ccf"
        )
    ]
)
