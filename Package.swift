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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.241.1/App.xcframework.zip",
            checksum: "bf97a10b4706d26dafc8f89f9e32320fe8c0cc70ba4e5866e1239379edf33b21"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.241.1/Flutter.xcframework.zip",
            checksum: "6d0cf3ee07f9d351223c2a758840a43852196f0693f8a8c6ec7485816af1eb54"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.241.1/apple_health.xcframework.zip",
            checksum: "a77dfc691451094e46d4cef95cfd22262c0407e2372a84f9fa985d5834883fed"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.241.1/connectivity_plus.xcframework.zip",
            checksum: "df69d1e00cededa459e6c63f763f7545cdb03464b408f0e3afa4a31b6e59df29"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.241.1/device_info_plus.xcframework.zip",
            checksum: "c2ff1a0b4b08c63d9837b0ba28c4819f8d2367c28184d68c79be6cdf0bb9fba4"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.241.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "70fa99a26ea8292e57ada9a75f697be541ff600761e0f73fdde89f978dbc0f68"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.241.1/flutter_local_notifications.xcframework.zip",
            checksum: "d656fc021001cbdb62e8a75d8ab335ce05213c68872155cdaf1e488a768d0459"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.241.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "7ed0a19eaff64244cf2c1d639f712abbf047085292c36455c30cba3641a458e5"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.241.1/flutter_secure_storage.xcframework.zip",
            checksum: "2ffb5595e4646953c8e69809cc7097cf0d0f389f3f564afc37f3fc5cad25e3c2"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.241.1/geolocator_apple.xcframework.zip",
            checksum: "154edcdec5f94fb9ec4ccec5f69b6284458150e352f7780fe4bb5a1ea3805c87"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.241.1/health.xcframework.zip",
            checksum: "9e6adf271de51fdfcc3a94435aa461ac9c9a9bb514296435afef637c6050819b"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.241.1/image_cropper.xcframework.zip",
            checksum: "d8138a53b41f1f4145239691f587574fe19cf600da86825a15958cb83cfd5143"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.241.1/image_picker_ios.xcframework.zip",
            checksum: "460483a983ddf55cb435b89520765612942cdc4052068f563b1a6d1096427cf8"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.241.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "9a55faa6fbb40c09aa39b7ea657204675d94ccceb62295db9eeaedad90670ebd"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.241.1/MapboxCommon.xcframework.zip",
            checksum: "ac1ffc808e211bad8f8e21e470c5db5d57a0a08b42b378a2b40adac07df6109f"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.241.1/MapboxCoreMaps.xcframework.zip",
            checksum: "e4af06997f99fa83c46e4b8df9aac8fd67d837a5d5a1f7a34c1211cac6b4d147"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.241.1/MapboxMaps.xcframework.zip",
            checksum: "455acd25b9b15c9407910aac7d5da80233c6bda6f5b899939e4272573f21de3f"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.241.1/NordicDFU.xcframework.zip",
            checksum: "90f40a2b9e246cd33b7716f5cd34f19c3d0eb9701bb0f150bc1bb6855b2bd76e"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.241.1/package_info_plus.xcframework.zip",
            checksum: "0403b09855e17849131dd850cd18c3ae1bc2e688e3ffad330654668da483633a"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.241.1/path_provider_foundation.xcframework.zip",
            checksum: "289882db20253a3b7d48d5283c86fb26f0d34429e8c56476a4564726820f8834"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.241.1/permission_handler_apple.xcframework.zip",
            checksum: "23626a749635c21a27927c548e02043dc0dc2011bdc74fdcc1034f285c5bff64"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.241.1/share_plus.xcframework.zip",
            checksum: "f12f87261e9b9047d5d87a1b5a3c129ae1c115f221a099071a166d4a0fbcd5f6"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.241.1/shared_preferences_foundation.xcframework.zip",
            checksum: "62fbdab8282ae14e8e671931b1e818535b9bb9ce963c731a03f317b900e9d45f"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.241.1/sqflite_darwin.xcframework.zip",
            checksum: "8c37c15d0f793da10e91d1f0f18ac82dc0e9561668759c4246d6d28967a1ff17"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.241.1/TOCropViewController.xcframework.zip",
            checksum: "d1c14a5a79b411dc05644a4eac1bbbfcf14b71bda96cd60885bdec391af9526b"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.241.1/Turf.xcframework.zip",
            checksum: "065715cacf6ff145e35b8ed4e822d7e65f4b33680b2206fb01f1c3c9d228460e"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.241.1/url_launcher_ios.xcframework.zip",
            checksum: "c96b3b128603d35d3db0be40d89e8cf5f81954c6e059bac0751dfaf474de7bd4"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.241.1/video_player_avfoundation.xcframework.zip",
            checksum: "134cee371b051c979b248b8ffcd3b5dde70e6c7f44e1e442fae8b7df0d06309d"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.241.1/wakelock_plus.xcframework.zip",
            checksum: "fa2d913923b86ff3770b09dee967c3365f8ff7e09f531e405d67891c9fcdac73"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.241.1/ZIPFoundation.xcframework.zip",
            checksum: "22c3adacb54c4ebe1260a46418d86f94992418d6765569018d5aeda1d97f9270"
        )
    ]
)
