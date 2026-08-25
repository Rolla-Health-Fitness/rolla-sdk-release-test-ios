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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.31-test.340/App.xcframework.zip",
            checksum: "f3a00254ff2d898b025a7801de444917422cf1b0e4350437f9e1c891025d5fce"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.31-test.340/Flutter.xcframework.zip",
            checksum: "9d8bf525081fda3b979f35a792a8dc1a4e2fa858b0f157f215d7522245c62f42"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.31-test.340/connectivity_plus.xcframework.zip",
            checksum: "b5d3988707fc1d85651fbaa08fc3a20f6726e94ab3dd606746e6a95b9bb1e52c"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.31-test.340/device_info_plus.xcframework.zip",
            checksum: "fb96430488deb008f1112c8bbd555065b0eff6b4f4265f38c31252133df879a9"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.31-test.340/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "48020fe78932de00a848b97198ba263359c45ca49d475d65ea9bb960a7eb287f"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.31-test.340/flutter_local_notifications.xcframework.zip",
            checksum: "0b1605f91fa399f866eb46c6df3920bd2350758b91290a115afed8267a5aa338"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.31-test.340/flutter_native_timezone_latest.xcframework.zip",
            checksum: "ae8767bdd058eccebec5f9177873bd71d8b20178dfd4d23c16594d33c67c3ea9"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.31-test.340/flutter_secure_storage.xcframework.zip",
            checksum: "08a761a99e78951f5a63838fee26d82fbf94ca01c895e468ca8519efeec6234e"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.31-test.340/geolocator_apple.xcframework.zip",
            checksum: "a1df5b4495ecc28561982c2ccfd611dea15854af321560ab4bd2b0e0a444a42e"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.31-test.340/health.xcframework.zip",
            checksum: "f9daaf02d12b521c6016d9f61e9b7f1b5e5af1426f19d7507f55412f5816c309"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.31-test.340/image_cropper.xcframework.zip",
            checksum: "8e7e6d3c287aa85d5b415400847f5cfbf826de135b2b88c39bcf7ff1c62f9346"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.31-test.340/image_picker_ios.xcframework.zip",
            checksum: "1f50697b7afcbeceb38c876ea0bda618ab94a86afa97cadcdecd0aa04faac4db"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.31-test.340/mapbox_maps_flutter.xcframework.zip",
            checksum: "092f7b3ba4475030d2ec12f7fa200c39ac625e20e38381b3c459b4f93276febd"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.31-test.340/MapboxCommon.xcframework.zip",
            checksum: "6c4ea54105bb88d28bd418aa9e5d8da781e91d36f85eaaa2a40aa78aee1c5617"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.31-test.340/MapboxCoreMaps.xcframework.zip",
            checksum: "e3bbec566f88448e277b53b2d842af165d4ef8b20c65ccec88e88acb53e942ef"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.31-test.340/MapboxMaps.xcframework.zip",
            checksum: "cf1397cdc779926c5f16f28673818430bac0913cd4e14d26d6eda1b3dcdc699b"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.31-test.340/NordicDFU.xcframework.zip",
            checksum: "c1079fdbf25497a8ade3167a0fce1d92bb8b6085ccca38099afe06d145bbbe32"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.31-test.340/package_info_plus.xcframework.zip",
            checksum: "25fcbd2b1ed3f63da52b0d3570a0dfc448b1140c61ecfcd5065f732ba97e317b"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.31-test.340/path_provider_foundation.xcframework.zip",
            checksum: "1725c7462c6ce18e5614116d37d3b334dc001116b8db88fb298dfb97f6df0445"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.31-test.340/permission_handler_apple.xcframework.zip",
            checksum: "522af4243559e49afabea23c2e324d492e7065376c9f84ecb43e85ffe0ebf0d5"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.31-test.340/share_plus.xcframework.zip",
            checksum: "c0438e2f054ee21fa6c6c014e662b4a1a74a30593c0ef6ab3e5e16bac89b2aa4"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.31-test.340/shared_preferences_foundation.xcframework.zip",
            checksum: "00ba898ce6489714bc2f69e1a3e644e5c0c765e7f4354b710a84c40fcc33e761"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.31-test.340/sqflite_darwin.xcframework.zip",
            checksum: "e2ab3b268f3780973a69997b736ae7da75944c1043a46ddf8ab737d2a4cb2492"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.31-test.340/TOCropViewController.xcframework.zip",
            checksum: "711a5151383b6fda3ed3f318b2137be031c4deda71ed769b7d353aec2b633bfa"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.31-test.340/Turf.xcframework.zip",
            checksum: "2c135a34eb627c8d01748357491ae4bd453dbfe9f1d34e1f05c4cf238b0733fe"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.31-test.340/url_launcher_ios.xcframework.zip",
            checksum: "9d9c5047c572a4cb2ec44bb93a1d4fbc4bb8f4f95a9824e826dfd0d32a72d92a"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.31-test.340/video_player_avfoundation.xcframework.zip",
            checksum: "56fa67590e491b69697d594ce5890ac0a7ca0b6e98e9df1e8a9a573ff4d432e3"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.31-test.340/wakelock_plus.xcframework.zip",
            checksum: "14a44e22d188b885647258c6a6143069df5068150a88b3adb4cea1d335046d9d"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.31-test.340/ZIPFoundation.xcframework.zip",
            checksum: "2b3a208c4abce7fc6c3d7e6764108a1879fdeb8e339c3178d7a7a2dd282a2838"
        )
    ]
)
