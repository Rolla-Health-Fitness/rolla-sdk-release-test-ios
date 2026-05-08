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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test.232.1/App.xcframework.zip",
            checksum: "62b09df9d43c35c008af598b1bb899e813b62feeb9c02a0d5e8c5f5b8190ee81"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test.232.1/Flutter.xcframework.zip",
            checksum: "921187bdfd43f3d96a6e553c867161add71c1a98b36f4870d23764a0c2864f63"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test.232.1/apple_health.xcframework.zip",
            checksum: "5ba8ab82f2783dedb7bf88627bbd4f1a22bedec7762d20af29442b8d0cc8c49f"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test.232.1/connectivity_plus.xcframework.zip",
            checksum: "a036d2a4534fc5094186c9c2dd62861182beb44b6653bc8645d7faa4d9284d9d"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test.232.1/device_info_plus.xcframework.zip",
            checksum: "29bc9b18f5ec59c4ec20b5658582f208a792c069861fa610cf158fd8b5f1576a"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test.232.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "970bb0ee2bb665eb9a8f327d609b1ba748052a62bbc4068959edab0d15e92c8c"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test.232.1/flutter_local_notifications.xcframework.zip",
            checksum: "01fec32c6e246b2aded200f795ff45462d79190211fcf982fe49061fe62b71b9"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test.232.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "d484165badfdfd4221884e0d32a56d8c56184b74a0dda49ddc2f0c3e76438f8a"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test.232.1/flutter_secure_storage.xcframework.zip",
            checksum: "8995abfb476745e7e7df6a4e15f29b1eb8db1dba9370b1161d122a2a14888883"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test.232.1/geolocator_apple.xcframework.zip",
            checksum: "2736e3a060b38a819ab0709a1921aafa29b9c5b0a2c16c1ba2536593cba0720b"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test.232.1/health.xcframework.zip",
            checksum: "114aa8d5cfb1abbfbd03c8199b373e3649e13c767b0d2d84104e289f2d57c288"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test.232.1/image_cropper.xcframework.zip",
            checksum: "544c64b36d9df28eb163b4e5170bc04da2c839f3b43c28dd5aac955385d62463"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test.232.1/image_picker_ios.xcframework.zip",
            checksum: "d1a4936dbdda9e183c8ac6c629574d971f93f0e112561d1752092fd353f66929"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test.232.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "95afc417c1129b9eabfc81a0ce4a2937422f50275dc2d5c3a2a341e959e3e41a"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test.232.1/MapboxCommon.xcframework.zip",
            checksum: "0d7046937266f71e468269f128f80bfff60a6934d7af25c2214df9cedba4c936"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test.232.1/MapboxCoreMaps.xcframework.zip",
            checksum: "92b5539a7568653f2906a1fe9de5b5d3be566182088b5c42db4dd5fe7ebb07be"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test.232.1/MapboxMaps.xcframework.zip",
            checksum: "7e181b72d2700844a82891c3ea1dcf3bd27d6419b8a982b152c48700ff0feaaa"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test.232.1/NordicDFU.xcframework.zip",
            checksum: "359f5d899c877c9f63aeca073df0acface7c13f9d0723f98d4c3d16cf12121de"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test.232.1/package_info_plus.xcframework.zip",
            checksum: "37feabb08d9d9adf7e29d90c92b46afe8380c1d18beee9d018c9c69181717cba"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test.232.1/path_provider_foundation.xcframework.zip",
            checksum: "023fc7199deab10f70f59133589f14e74c106b102ddfb1ae23996c7e027924fe"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test.232.1/permission_handler_apple.xcframework.zip",
            checksum: "523af1ff04f9367d2deedc9b0b2bab0da0ee77eb6a8a1a76d201dbb8a3515aec"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test.232.1/share_plus.xcframework.zip",
            checksum: "60b6391a3b06fa3cdda4d6b252326c784219137682a4ad85cad5d1d5eb2b4e43"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test.232.1/shared_preferences_foundation.xcframework.zip",
            checksum: "5b9b2096d0ff278c62eee5e7c60a3738b640d74a347f6b43e3df832bc0510269"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test.232.1/sqflite_darwin.xcframework.zip",
            checksum: "20a24310a3251a6883b5e012a4507b62f7be2d3e5cd95ef189805e134dcc3aa2"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test.232.1/TOCropViewController.xcframework.zip",
            checksum: "73484905eb10c617f8ec7fc868339ec1dfb96197b4fdf67e7227752c98a47c53"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test.232.1/Turf.xcframework.zip",
            checksum: "eda47d69e294af4db306a3403f1e573689391988fa87b6b9db2b06511acd078f"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test.232.1/url_launcher_ios.xcframework.zip",
            checksum: "48413dd7fcb623e8aa2554ab33b3ee8ba2b4a47d45ac0db88309d64c0f83a024"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test.232.1/video_player_avfoundation.xcframework.zip",
            checksum: "258e0880e71a81be57366973088d8d20be338a0ed833dde083093a56b216d4a7"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test.232.1/wakelock_plus.xcframework.zip",
            checksum: "97bd74cf749bf33e29d3f569c00d719d6031487bb494a85e04ca39479a7aaa3d"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test.232.1/ZIPFoundation.xcframework.zip",
            checksum: "79028878fbdd5eb7acc02d6b60ec44c8f4e588f410280c78ecff950eb3784b0d"
        )
    ]
)
