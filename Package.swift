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
            dependencies: ["Flutter", "apple_health", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "FlutterPluginRegistrant",
            publicHeadersPath: "."
        ),

        // Swift wrapper API
        .target(
            name: "RollaSDK",
            dependencies: ["FlutterPluginRegistrant", "App", "Flutter", "apple_health", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "Sources"
        ),

        // Flutter module (Dart code compiled to native)
        .binaryTarget(
            name: "App",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test/App.xcframework.zip",
            checksum: "5247f1e374e0bc0660423d3be19355f0ee2bc41c7860d69495413bdb8b1bafac"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test/Flutter.xcframework.zip",
            checksum: "b779eb9279d0cc4d09fb6bf81cb1419f322558c937cae40b2e714c1388cebe26"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test/apple_health.xcframework.zip",
            checksum: "40339311760b73ba4d73beb067d5e126a967a8fc03c3a54b5481fc2b641370c4"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test/connectivity_plus.xcframework.zip",
            checksum: "210992d160a70e846aa9ef1d541564a846281154ded69dbf018cd6b1d7f62d5b"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test/device_info_plus.xcframework.zip",
            checksum: "6bcd77dceee0fb8d8958c9dc0f185971cdd4ccc592514c9279336a812dd1831c"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "477c8976bb813adec0c395005cabc2a55488d8b1f2749a249883f84722f41d91"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test/flutter_local_notifications.xcframework.zip",
            checksum: "b6257d3c98e9b7e04896dc6761c61d4e79f4f2e70618fed8b3fc90b513da0436"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test/flutter_native_timezone_latest.xcframework.zip",
            checksum: "e57edac7144ac09ad8c47022c65ed559e9a865fc5601e81a1b36c292fb3b4888"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test/flutter_secure_storage.xcframework.zip",
            checksum: "0daeaad23c488bbf6ba26e7b7c3d979aecafe9c3cb7f559ab46b0981a3f81ebd"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test/geolocator_apple.xcframework.zip",
            checksum: "92144c1f03b5188e3a8b7c2a89e4d0ddd56f2bfa9ca9da3a32b4ee520994e36d"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test/image_cropper.xcframework.zip",
            checksum: "f7efcc6ac330cd90b07a25ad035bc8a16975f05b362c3ea257c42c20623a0544"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test/image_picker_ios.xcframework.zip",
            checksum: "4c3f59764751cb4e3112671e44c6f7aea043c412951fd9d5393718964598c1c3"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test/mapbox_maps_flutter.xcframework.zip",
            checksum: "535f43b51c01a319fbf9a37261146ba4073c19434f46345d0c227fa0e4c0ddcb"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test/MapboxCommon.xcframework.zip",
            checksum: "424c8c538d4eb0909ea4c4b0f6ece47d80b1585de9a538e73a90179787d424dd"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test/MapboxCoreMaps.xcframework.zip",
            checksum: "8ab7838f3387c9d6b53ca2492582b40e6e7b29dafca07b82b6587d306a5792a2"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test/MapboxMaps.xcframework.zip",
            checksum: "34406753365dfad2a2b128da22b3b656f056d288812955f4e5dae347e986b8a1"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test/NordicDFU.xcframework.zip",
            checksum: "0e069cd686897a791a563586313198c0b495cf737f02be83890224019382a4ab"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test/package_info_plus.xcframework.zip",
            checksum: "0bafdc45d41ed6f67254103db2080e1b813f365a7fca9c58b801a029b04f4c11"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test/path_provider_foundation.xcframework.zip",
            checksum: "8269ef5ff7fb86deebea6d04fc4fed84b5585a554bc4b71a544c926579e89e41"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test/permission_handler_apple.xcframework.zip",
            checksum: "12eca8bc9e304ecfceaaa8bd26c720be9233c229680438d4cefc895ee25628b6"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test/share_plus.xcframework.zip",
            checksum: "3f129e9f0073852f9b122e110617ff542eb73dd4c3bc04665048f56c1f188b15"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test/shared_preferences_foundation.xcframework.zip",
            checksum: "38c97332e894fec99e4251a53e62d00bae19f0dc4e842e59b455b3c020ac984f"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test/sqflite_darwin.xcframework.zip",
            checksum: "6ce9910c91a430415966ed39ad39c82fe5ddf55cabae35f89392dfb9cad06fe2"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test/TOCropViewController.xcframework.zip",
            checksum: "6c22e5542ce62b0d1132e1d9f2742b19f35d1843e863169c206181ede7e4f70e"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test/Turf.xcframework.zip",
            checksum: "31ff759a6b7d2996c1b52fe77bd0d3b44cd439d1c0a352d286848f2884513e2e"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test/url_launcher_ios.xcframework.zip",
            checksum: "7f57f1f25051e1e6b0f3bcc1a6794ea920568ded17b290bbd65f17f1c4579e8d"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test/video_player_avfoundation.xcframework.zip",
            checksum: "388c9e87bf594bf254d54a09c4a9a8886ac4390f32741f73d6f6081081a678fb"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test/wakelock_plus.xcframework.zip",
            checksum: "dea1e3dada978d160349b4293e4fa43045226f23ab93d5167ecee8e097237a2b"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test/ZIPFoundation.xcframework.zip",
            checksum: "29d171b8bd0b4001081a7e7ff625f4361a0e1b514e63961c368fbf3582f9bf5e"
        )
    ]
)
