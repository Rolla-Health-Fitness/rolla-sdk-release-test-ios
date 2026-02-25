// swift-tools-version:5.5
// Rolla SDK for iOS
//
// Usage in Xcode:
// PROJECT → Package Dependencies → Add Package Dependency
// URL: https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios.git

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
            dependencies: ["Flutter", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "FlutterPluginRegistrant",
            publicHeadersPath: "."
        ),

        // Swift wrapper API
        .target(
            name: "RollaSDK",
            dependencies: ["FlutterPluginRegistrant", "App", "Flutter", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "Sources"
        ),

        // Flutter module (Dart code compiled to native)
        .binaryTarget(
            name: "App",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.1/App.xcframework.zip",
            checksum: "094bb4b1e0d8ebdefc57d2c2e9e201746bb68f97620f559e82b04643a382468d"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.1/Flutter.xcframework.zip",
            checksum: "fd0428bdfce10db8000b6fb74e18a108ce890bb34296bf2dd36400f5921f19a5"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.1/connectivity_plus.xcframework.zip",
            checksum: "3357f31a797ae269e00346769a7a969e086da4e17c8997f25e6ff759e7af86ae"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.1/device_info_plus.xcframework.zip",
            checksum: "6269b9039f988d6b642ff2ce56dbc2736f33d32808c6860cd06c74d5c14733d0"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "e865f4b72f1bc62f8b197e73dd3ec8cde1a79a1cd774278bda048d4d261893f1"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.1/flutter_local_notifications.xcframework.zip",
            checksum: "32c6e1cf1f075d59944c6ddb00e554690be7d6238ba129c666508f6274333e94"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "8a730f2608b6924d65f87745e83812052b84c5ec0d7cadb7eba20979e9c4618e"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.1/flutter_secure_storage.xcframework.zip",
            checksum: "5322eba232c4885d85b00bb3ac4cd94de4147a6b5f3729d2cc7ab88b0d372a02"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.1/geolocator_apple.xcframework.zip",
            checksum: "fe91fe3ca61129d85b9e543dc38416fb7d3bb8891b8945e21ba901f3795a676d"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.1/image_cropper.xcframework.zip",
            checksum: "de87bdd087ed0896e47ad5c79be2abf72b8db9b6ad9e163d17885cfbb6311817"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.1/image_picker_ios.xcframework.zip",
            checksum: "2607a9ebef7d5dff802ff8cff53412d2e64f0a2130dde0e325a8950c84691902"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "008f4c3c3d59c815e37137329200ff4506e3caa35d6a1a6af9f558422ce949ab"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.1/MapboxCommon.xcframework.zip",
            checksum: "8cecc12d972664e9c06824545241e0a56ea80ff18addec11dc9e5d9b04ba25e2"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.1/MapboxCoreMaps.xcframework.zip",
            checksum: "878543eaabaa7037826303e13598e29b4a41049c7b754f3c01f84e5cb990952d"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.1/MapboxMaps.xcframework.zip",
            checksum: "701810bc6d74ce483e7b6428b58c8f7602a510091b8b8c68918615bf1c49e270"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.1/NordicDFU.xcframework.zip",
            checksum: "4565f9cb1985615ef992c2277938565baab9e1310620517d2cd2354f6fc3abee"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.1/package_info_plus.xcframework.zip",
            checksum: "8e93fe8869272ec7fc5abc1f8983e414a2e92830d17c0f3192eb86613805e558"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.1/path_provider_foundation.xcframework.zip",
            checksum: "378361cf38a7541e781e6cbbf7ef2fe31905d2e7fddbf3509cd9a7379a93bf0c"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.1/permission_handler_apple.xcframework.zip",
            checksum: "ed6e7719a3e14e213dfca36dd1943091a7a2ecbe8567bc9b2cbe3de0f8cd6df0"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.1/share_plus.xcframework.zip",
            checksum: "224e6fec57322d0ff84bbc37d9bb3b0857b06a544d222964f2674d16f446423c"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.1/shared_preferences_foundation.xcframework.zip",
            checksum: "de97ad9a53a4a3d864dae81875389ffe2385994b63762eec0aeeba4d559215bb"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.1/sqflite_darwin.xcframework.zip",
            checksum: "2976116f03f1c166a44a6c33dc9b63ed5782d3c7a98f58919baf58abf3c48407"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.1/TOCropViewController.xcframework.zip",
            checksum: "a685ec562c1b39c48049040384c3f252c9f2c326b547437d73953f4cea63cb8e"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.1/Turf.xcframework.zip",
            checksum: "91005ae699f9b308dcba742af16cc8f39aab6defe9bf2bb8398c60100f88b217"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.1/url_launcher_ios.xcframework.zip",
            checksum: "cca01eed19f87036624560ce4aa75f127a8128cee2a903d5fb671705b677d94a"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.1/video_player_avfoundation.xcframework.zip",
            checksum: "b24c52f582fbea2a1e9cb4add1c50a33699fdc6e49e9422a2c0a3df8f56e2320"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.1/wakelock_plus.xcframework.zip",
            checksum: "bf48c0aae9bd4debe1b3890a22931dc0c8ecb8222c0147e7f3f899c8ab5c0ecb"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.1/ZIPFoundation.xcframework.zip",
            checksum: "5264c6bb79804ba540f00e5c18b89deb70a70d39457c780136b26ef485e5c4a1"
        )
    ]
)
