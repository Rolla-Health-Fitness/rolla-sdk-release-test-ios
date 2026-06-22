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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.266.1/App.xcframework.zip",
            checksum: "8a28fdfedf358695e93505e6d3e598135129a9388a5d4082e81f794f28221817"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.266.1/Flutter.xcframework.zip",
            checksum: "056db1192ae570b7f8fe2ea952e318b7dbb1d802e45c879e1271fce665b985ee"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.266.1/connectivity_plus.xcframework.zip",
            checksum: "a8a3edf00cf7948ca841abed031a9fdd3b4e7036caf2485c55fca82887e761a1"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.266.1/device_info_plus.xcframework.zip",
            checksum: "2cf5d495a34792f331357ff97d9ebece8a5d260f938823333cecbc5c002a2094"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.266.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "deb5098a5fae7cb391ac975d8ace146af790bb1c03bbf4e70bd93adf104db823"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.266.1/flutter_local_notifications.xcframework.zip",
            checksum: "2f705be39efec3495869ebf96a58a2f6c4cd4f2ac11fc7d389e419b88b669271"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.266.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "4df4d0c7c378655e6736d550bd4106130a672ec47e206876c26ac62dbfadc1d8"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.266.1/flutter_secure_storage.xcframework.zip",
            checksum: "10e2be97cb7d54de57ae56336a4b57d3e6fb8a8f6d28633fd41419c7cea0aa49"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.266.1/geolocator_apple.xcframework.zip",
            checksum: "e21aec90f6bc1cb8242f8a33db3b1dfc3d4057f24a9e49e38188e6be96fdb5cc"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.266.1/health.xcframework.zip",
            checksum: "c8af87e72d7045d93acdd793a678d2a834acbbd362c9d6c966bf90962c87c732"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.266.1/image_cropper.xcframework.zip",
            checksum: "0bf93c5bfedb9e5d1ee63274684a12f5a42504faba79bbd4162c7c6810c6706c"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.266.1/image_picker_ios.xcframework.zip",
            checksum: "78ecfc5dff07192be59348b0e117a3fad734ced4e1fc69778f84fd1ae613d505"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.266.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "911256bae91e9f9ce6d5ca0c389a066971a8b0f4e5407051f3b6a25157e86df1"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.266.1/MapboxCommon.xcframework.zip",
            checksum: "8f4738dc17d11b7fe454b5fd56edd7e21181bf102dfb6c44aa77842559c32ea4"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.266.1/MapboxCoreMaps.xcframework.zip",
            checksum: "4ac75033e6df7a736305ef2c88bf9f4bd6cf368f0265210c3982286ce19f3541"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.266.1/MapboxMaps.xcframework.zip",
            checksum: "c41949d9304613d25ad026983cee0dc0efdbd68b8e9f12bbb77341d37f898e12"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.266.1/NordicDFU.xcframework.zip",
            checksum: "24e2cbe9f0adb2cede8718247a1cee8439f09c51ffb388d2555da40d4a0968ee"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.266.1/package_info_plus.xcframework.zip",
            checksum: "8d474dde38061feaa3818151868db680a4be96fee7df20caee8c40d838e7ffa0"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.266.1/path_provider_foundation.xcframework.zip",
            checksum: "2ff4ab33239dc73d70db89616900908ade5fde96b1f0474d1791f5a6e5232ebb"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.266.1/permission_handler_apple.xcframework.zip",
            checksum: "32309b4d21fe0b6e73d981e1dfed86f51ec5c930e64c8c8f238ebf6a09da2030"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.266.1/share_plus.xcframework.zip",
            checksum: "29c4c1d8c396e4d0c26d2fc375bd5b9a7bbe2cca70d24a6cd2d78f3856e3c4b4"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.266.1/shared_preferences_foundation.xcframework.zip",
            checksum: "ad27864307cc57f15d74635bafdb9745e3108ce0c6a202af02c90d6eb4889c29"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.266.1/sqflite_darwin.xcframework.zip",
            checksum: "c90f696454c7276258fa1144dd33143824636eacdb3b97d55d9883449b703eb2"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.266.1/TOCropViewController.xcframework.zip",
            checksum: "dd73c58199a23917bfe8fde6b2b16d7dccd013ccdac61a2ef077249527d8f7c4"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.266.1/Turf.xcframework.zip",
            checksum: "e3d6e478a2531714f5a34331ea2cad9f8d9c90a82af6eac41070550544b3e093"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.266.1/url_launcher_ios.xcframework.zip",
            checksum: "d0595754a0595fd05e5258465f3733ed44dc9d0fc201ef1bf771a1677cf62195"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.266.1/video_player_avfoundation.xcframework.zip",
            checksum: "cfb6e58769731b262bf3227dfe1e2e3c8036ae68ee47716efb463b48223d4e46"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.266.1/wakelock_plus.xcframework.zip",
            checksum: "099596fdbdd60eded3a6a3ff70f60fc5cbcdcdd927c43c19019686c575925156"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.266.1/ZIPFoundation.xcframework.zip",
            checksum: "cbc7428af4ab6cc83e8100d42261f17bfbc616084d3612bbec5dbf28d6796e34"
        )
    ]
)
