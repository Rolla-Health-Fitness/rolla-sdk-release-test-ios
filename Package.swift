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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.251.1/App.xcframework.zip",
            checksum: "50eba686b62a5bb936193755717c048875b1358485f5c4915ad1bc09dd1f0e5d"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.251.1/Flutter.xcframework.zip",
            checksum: "9939e4dec1a844c094abdb2c89bfa1c416ecf81c02b4071e316b219c119bcade"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.251.1/apple_health.xcframework.zip",
            checksum: "596aa9b508d182c80ceeb28adb4ff770ef8d3382bae7b3c157e6453d3807af6a"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.251.1/connectivity_plus.xcframework.zip",
            checksum: "33ad6d20d74df8d330c6882be714289b686e3d5e90c203dae9b31e2f6bf02495"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.251.1/device_info_plus.xcframework.zip",
            checksum: "5a8b15e57ec978163a71f953cf135c3726232dc418cfbea1645efd61d57325c3"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.251.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "74d8f4803c9e9275d824b920770e79635adbf434e8a952df3fb6ed785536562b"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.251.1/flutter_local_notifications.xcframework.zip",
            checksum: "11c9789a8c1257bdcb4c1a49f31d6ec394d4fb23c2f0761952722cd38a7093a0"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.251.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "3f71805c4cb23ca7433cac91fd1f65bf4556cee189452db4a0aa26b40a672df3"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.251.1/flutter_secure_storage.xcframework.zip",
            checksum: "c96c5573dc0505b0757dd936239796c6cdaa61df4bcbe33ea5f75a32461ac63a"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.251.1/geolocator_apple.xcframework.zip",
            checksum: "89b9a45c46b28b7fcbfa1fd0fca2d723d0640fe24a83ff776bcfaf48d1ad1a1c"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.251.1/health.xcframework.zip",
            checksum: "8e1f1950fab94353180a0044cf03e317264cbcb5b105282d3170b2146974ea17"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.251.1/image_cropper.xcframework.zip",
            checksum: "c4fe4444c2d3dc7703cabaf37da26a6c3576a2aedfe1a365d4ebbbb083f1462c"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.251.1/image_picker_ios.xcframework.zip",
            checksum: "61cf62c8c932bebfb06e1b7a81c060057c2f0f6a65a9785415269544043f8737"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.251.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "3f558b0f25b60ecf7e888bb18a95cbf3c7fc2dcaf5562ee81f2ba4a1ec3ace0a"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.251.1/MapboxCommon.xcframework.zip",
            checksum: "478659144b2794c2b7cb1e24804d603a23ef4d57b0455e2adc405628f20ce60f"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.251.1/MapboxCoreMaps.xcframework.zip",
            checksum: "7a1a978cc7c465ae83a5ec456ae0388b03767560d36448c8fb326b899bba71b3"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.251.1/MapboxMaps.xcframework.zip",
            checksum: "fd38aeeacff4e329d91a01637d070ea1b221bc40afdc3e8c46c8bd65e0fa33f7"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.251.1/NordicDFU.xcframework.zip",
            checksum: "4e47540f35fb8e902b0c9115ffa1089712ac8ab4a0cb3190fbbce37c44fbeafe"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.251.1/package_info_plus.xcframework.zip",
            checksum: "ebb6e3756d6bb411413f9243e10b355c7c40f80417e02829279666b5f8c87d4d"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.251.1/path_provider_foundation.xcframework.zip",
            checksum: "c05f2f0c5d3aed4230425b4304efcfacf68d815ac009f47c1b2731e0885d5a57"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.251.1/permission_handler_apple.xcframework.zip",
            checksum: "fe6b0f765eab08b88cc9fd3b3b218707a2e5588f4b02298e72436c4a2af73609"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.251.1/share_plus.xcframework.zip",
            checksum: "bd7a21ad5e6724d6488d98c8b7a7c8c2b9e7c731268347b727c54f4bf9ffab64"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.251.1/shared_preferences_foundation.xcframework.zip",
            checksum: "109e7c1b21df68468db3e4f15c3c48a146a446ea46fbcffe51ea6da79ec73b88"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.251.1/sqflite_darwin.xcframework.zip",
            checksum: "8455c110104c57ef7d3fbb305b28e9147b3bd42af03a9c2edb098ba941275ab3"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.251.1/TOCropViewController.xcframework.zip",
            checksum: "f6d757f625a1aad39eb6b6f9adb34d594317767d577670fc7e15ca207d2ab81d"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.251.1/Turf.xcframework.zip",
            checksum: "20f2c6d734e72f362cfdbe3d1772ceaa39c44a5f49e7cf6d95367fe36fe75f5f"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.251.1/url_launcher_ios.xcframework.zip",
            checksum: "1a559b473c49f483facf87cbe5e675cc5db0cc4aa88f7d39dfe0bf9169985ba7"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.251.1/video_player_avfoundation.xcframework.zip",
            checksum: "419c66509deb37083cfebcc006ec28a16cbd13c556ab3ae79779269f75f4981e"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.251.1/wakelock_plus.xcframework.zip",
            checksum: "0a569dc8ab3cd84724f3ddbdd781373776292921996252495b5b7c540f475fd8"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test.251.1/ZIPFoundation.xcframework.zip",
            checksum: "fd6d1a91b7e985bda60fc5cc7dba8e99ff28fa86695125f97bd0189f91eed4e0"
        )
    ]
)
