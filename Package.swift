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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test/App.xcframework.zip",
            checksum: "6dc4d6e93ea0e4257b79b4aae88a94ca66c8fc6809680fa20035657a3053e7f4"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test/Flutter.xcframework.zip",
            checksum: "a224e7f081d4b455a288b24c260833dc59dfd75d2a46ca0611572803767eb43a"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test/apple_health.xcframework.zip",
            checksum: "1d877d454426565028296c8084c76b987b5e4561e1c010c31b0766214fe870ad"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test/connectivity_plus.xcframework.zip",
            checksum: "01868f4748512aa49d067f0ef9e0917c86e552c0d901ce1175e01a8982cc328d"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test/device_info_plus.xcframework.zip",
            checksum: "b5e9e80a35c3a8b030cc1b7ac46a425e6fe61d7ed89a08e1caaaa958695cfb6d"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "c12d04ad6a1c5c8e11e4404a1aaf9d5ace628d7414a93172c7b54d9f43bce7e0"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test/flutter_local_notifications.xcframework.zip",
            checksum: "2b4b6de9e007d39cebca79f49c2f2a5b3fb0cfa6438526459bb483eb45747676"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test/flutter_native_timezone_latest.xcframework.zip",
            checksum: "1b4f99a6c545d8c2beab11f72f69ba9ceeaadca4748895ebf926070617380fdf"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test/flutter_secure_storage.xcframework.zip",
            checksum: "2685dad1718eb865d72d35a9ee56cf3f0b94b3c9b7252157aaea93a9306a881e"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test/geolocator_apple.xcframework.zip",
            checksum: "61d57e58ae274977c2ca8f5379570076bb2e72d46dff91d987fb8e60d08a624e"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test/image_cropper.xcframework.zip",
            checksum: "2c8349ef18c2a53e356437b1867792f66f2f6eda2cabbaa7c810334a0628fc72"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test/image_picker_ios.xcframework.zip",
            checksum: "fef37a8d468d64558b87fbffe8e03c2e6efe080d51b42f02079b4c6ed5c9e6da"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test/mapbox_maps_flutter.xcframework.zip",
            checksum: "2d2b696f8f710e979b3ccb29abedeb2387338bac74b1ccfe0a0c76f6e1dc57d6"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test/MapboxCommon.xcframework.zip",
            checksum: "6269d7ddf5ab7c9a8f01c1d394f29c3927bbd5dabbdc60a9429dc42edce0ecb5"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test/MapboxCoreMaps.xcframework.zip",
            checksum: "2a068f10a8ca1b8643be3a1a65c15fc742ff12c9496bcb9d53e44492cef02fff"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test/MapboxMaps.xcframework.zip",
            checksum: "73a8b7ca9562b3294a43d647ed6e8eec74833256f79b1801b484a9ea02c7e506"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test/NordicDFU.xcframework.zip",
            checksum: "773f58cce638e1e010ce98202471413a52813f4d2a47a1c42701203e0c330b22"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test/package_info_plus.xcframework.zip",
            checksum: "fac4f729892bbff8bd9e6c11f471f6aa533bba759fd208ff2ce197bfc01f55c7"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test/path_provider_foundation.xcframework.zip",
            checksum: "8fc4c70049696a25a232eba9eb99169ffa76e56fb1e4d51beb7c69450ed81b57"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test/permission_handler_apple.xcframework.zip",
            checksum: "b221e8f7f52f3bb22b7c9859d58767fa76f31f783b7db2771f22dcd10fca4766"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test/share_plus.xcframework.zip",
            checksum: "2e9617a6b905d5480d5bd69313cb0201ee29996d791e682c774fd822eb443d74"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test/shared_preferences_foundation.xcframework.zip",
            checksum: "3315b6bafe0b406846edc05e9373616b01b8e5342cb4976188a59d038013361b"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test/sqflite_darwin.xcframework.zip",
            checksum: "3d51f2a11772b0abdf936151060a057aafb79791b047e1e6cc2e98be23fce329"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test/TOCropViewController.xcframework.zip",
            checksum: "a9a11be9db4631f1c95ac19428553711689ed21ed8b6120966b54a019b7dc0c8"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test/Turf.xcframework.zip",
            checksum: "ec7431f26173aeb63c605391b32a216674b6d1c70f0b20aab0b05435c14886a4"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test/url_launcher_ios.xcframework.zip",
            checksum: "5c07af2bfc131ab7a0e5022c859a9a4042662802ef2271ac20b0266610cb85af"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test/video_player_avfoundation.xcframework.zip",
            checksum: "bf35bd274da182c36c979cb7f5f7e5a124d91cdd3fae96da054b27f59264bb07"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test/wakelock_plus.xcframework.zip",
            checksum: "a28cfacfaf993d67f179b0bc43a60c5fa27cd6063c8f60f48e0330f7cacaa842"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test/ZIPFoundation.xcframework.zip",
            checksum: "2300689ea9e6745929f323a2d0b0e00f02d14b5cb790484eedfedbc116f13bb9"
        )
    ]
)
