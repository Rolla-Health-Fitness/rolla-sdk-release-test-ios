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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.255.1/App.xcframework.zip",
            checksum: "af75b262365de95521eb22538d6547e2380897ca445273765735e6f254e2d9f0"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.255.1/Flutter.xcframework.zip",
            checksum: "f5436623a6db25626cf6079310ac1d983201b0082228af36db9733bf1efb8270"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.255.1/apple_health.xcframework.zip",
            checksum: "f539d53023f677941b17547ca51693ee0e1c7b0d59c10fde2d01cf29f5e845db"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.255.1/connectivity_plus.xcframework.zip",
            checksum: "4b70e10cff60533c721dd2dc5b66a48de82f5fbd4f135123c3d93238e2167f64"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.255.1/device_info_plus.xcframework.zip",
            checksum: "e491ef9395c546af092ad7c1df0b6263bd70a05eb92db006f57860760e717017"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.255.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "3ba39b2221a418b31a2f45816a3eb04ee0ade066253709f3cac15dc4d3426152"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.255.1/flutter_local_notifications.xcframework.zip",
            checksum: "6802ac72e4b77d8425517f1feafb11524d3ac3de1a902526e7e3fcb9fa63ff00"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.255.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "e73a282432bf799a904f0442f4a0a765ce2ab2d88d257ef173265adc16e9758e"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.255.1/flutter_secure_storage.xcframework.zip",
            checksum: "94757dd518e10ee4f327c7393633888068e22021628c508e61e32b29b1f4fb8f"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.255.1/geolocator_apple.xcframework.zip",
            checksum: "8df1bbce9c7682a8a7a971d7763666b2de1eba9c914dde5ce8d847cfc3c39c95"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.255.1/health.xcframework.zip",
            checksum: "524936936f6a630273f620f4f8e742d914c38cd80591a5c8fc619254a0be1073"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.255.1/image_cropper.xcframework.zip",
            checksum: "73c9b4b1954404c558a5d53eddef25821dc21f742093b042c01601fc517c122b"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.255.1/image_picker_ios.xcframework.zip",
            checksum: "5c470dd9c184d15c313dd5882c890c0c97c3f5dee349652e9cf99d42c713d6cc"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.255.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "33f083504fda5922c1deca2b660b315e2cd13a11b637a9c9a801722845b88a91"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.255.1/MapboxCommon.xcframework.zip",
            checksum: "747553c2372c9afef5282eee614cff50dd8883309bd36db3115054faf0698771"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.255.1/MapboxCoreMaps.xcframework.zip",
            checksum: "31f9c6d73c2b50b0289cc5be74f6a26603e91ebb79138ec99f87e7732c9aa06b"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.255.1/MapboxMaps.xcframework.zip",
            checksum: "3eb6ab188c829d4acbcfeda78b09e2a2dcc42b32efcba19d8f88dbcdf14eb297"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.255.1/NordicDFU.xcframework.zip",
            checksum: "5c83d575698978b5753fe67bacdfb85d8b8a823f50cf9475e56d45044598266c"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.255.1/package_info_plus.xcframework.zip",
            checksum: "c4aaf597b22b666884da15d4286fa49fc82cad605df0dd3506190d370fba9208"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.255.1/path_provider_foundation.xcframework.zip",
            checksum: "b742792d400b7da3d1c428ca0b54c84bcd58bb3bded465f46d4994c0bd842f49"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.255.1/permission_handler_apple.xcframework.zip",
            checksum: "597f5cb50d279398aba09fa0a79d2fe9e0639981e41aa2afc5ea30bbb6b60d67"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.255.1/share_plus.xcframework.zip",
            checksum: "9ddd62bbdf9489d228f89dd5505af5a692b7f788bd438e926d92f061852eb925"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.255.1/shared_preferences_foundation.xcframework.zip",
            checksum: "f614ae71f8b8473cb9569eb427c5f02b1c5784fbf84979a67292d2fe75c43642"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.255.1/sqflite_darwin.xcframework.zip",
            checksum: "1cd8eb23f0a57950d39d139be66959a0ff11d51e09fdfa69a81ba0722e3a138c"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.255.1/TOCropViewController.xcframework.zip",
            checksum: "d6450c66a76e6ecb09fa11c50e5150d9a8eb7c01449542dcc136c110385b5c16"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.255.1/Turf.xcframework.zip",
            checksum: "64429fb14e0b64a4ebd22b505dbd269a31e74528d14028bd433e6bf8f4881dff"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.255.1/url_launcher_ios.xcframework.zip",
            checksum: "2711a142c99f63b67e4b0dee6c238dfbabb519f96aa18f4deaec21f9ca837472"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.255.1/video_player_avfoundation.xcframework.zip",
            checksum: "20e4fd517346c7ae50cd75178c37fc27a259b9529d069c06281fb16ff0a9825a"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.255.1/wakelock_plus.xcframework.zip",
            checksum: "61d9de3cd3a65bddcecc2ccfa9c9711676ae64b654aa3025c0e4bfc232417424"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.255.1/ZIPFoundation.xcframework.zip",
            checksum: "3e2cd4a47c8a92bedffc4766089f7ef5805c2e941600710d1375d652c9ecc7c6"
        )
    ]
)
