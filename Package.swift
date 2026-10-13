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
            dependencies: ["Flutter", "camera_avfoundation", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "flutter_web_auth_2", "geolocator_apple", "health", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "FlutterPluginRegistrant",
            publicHeadersPath: "."
        ),

        // Swift wrapper API
        .target(
            name: "RollaSDK",
            dependencies: ["FlutterPluginRegistrant", "App", "Flutter", "camera_avfoundation", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "flutter_web_auth_2", "geolocator_apple", "health", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "Sources"
        ),

        // Flutter module (Dart code compiled to native)
        .binaryTarget(
            name: "App",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.46-test.357/App.xcframework.zip",
            checksum: "1bd40dea9d135ebc1ef4351c49d065a8f465d81cd9970863742b39585825918e"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.46-test.357/Flutter.xcframework.zip",
            checksum: "bd662bfe27f7a691a7eb340d22f0fc4ed29f06cdb8660860ac9d36c67a2d9775"
        )
,
        // Flutter plugin: camera_avfoundation
        .binaryTarget(
            name: "camera_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.46-test.357/camera_avfoundation.xcframework.zip",
            checksum: "817dfc55a73345cf665eb07203c6839428ec5329c04821ee893ba7ef32cb3d6a"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.46-test.357/connectivity_plus.xcframework.zip",
            checksum: "915ca53f4da6c4d4b2b08bee918662da714e2327fbbe5bd3d8591f5dc557151a"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.46-test.357/device_info_plus.xcframework.zip",
            checksum: "bf40c85d4a410f3d10030ee251e783969199e3ea54d801f03a34937ef0a0c0d3"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.46-test.357/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "b95bb9d24ca76b5dd28ae6352daae128b6fa11bcd2339fdd811c37434d275967"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.46-test.357/flutter_local_notifications.xcframework.zip",
            checksum: "56bcc1849bfce2af141f2e3fd6d51534f7ab7987d27be3856368532e0afd19cf"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.46-test.357/flutter_native_timezone_latest.xcframework.zip",
            checksum: "df218a338f329ed3fb0d49d25825c44d5a64867c0f8d4792b9a9b5ec8fe17bd0"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.46-test.357/flutter_secure_storage.xcframework.zip",
            checksum: "21ecae64751b939c9aac7c51397a0a4cdd7ec480daeedb7f816e7ba8552c6506"
        )
,
        // Flutter plugin: flutter_web_auth_2
        .binaryTarget(
            name: "flutter_web_auth_2",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.46-test.357/flutter_web_auth_2.xcframework.zip",
            checksum: "c9fe1e5acb86439e25f261857f7e5b192f7a96b05d660d3a1379040eb553581d"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.46-test.357/geolocator_apple.xcframework.zip",
            checksum: "68c4f03f89644961a85d027580d251e2312e7ebf33956f78ba2c6f50e5cf9c61"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.46-test.357/health.xcframework.zip",
            checksum: "39644a6128dba2a5f43d8109f0717753d25e30ce8e1700dad52b01efef01175e"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.46-test.357/image_cropper.xcframework.zip",
            checksum: "86ae65a06c83ee89a1a7bfff4aebb7d9a5e5215111bee36c1e899e152d567d99"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.46-test.357/image_picker_ios.xcframework.zip",
            checksum: "62a6b3f3c4c9e3369ee43fa24b72ce1437effaf8d3e2c60a6ed3087bab4307a8"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.46-test.357/mapbox_maps_flutter.xcframework.zip",
            checksum: "ad9b2635946feabb47b4ba7affe69a2bc803d6483e0456c1903dfcab122fa21f"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.46-test.357/MapboxCommon.xcframework.zip",
            checksum: "98e437c96b99bee280ea8d65943e58ee4a74bff2242621eaf107ee3b5bf5f075"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.46-test.357/MapboxCoreMaps.xcframework.zip",
            checksum: "fb414c8ac9b016be3cb34eddfcd1d12a24834202f7d0f7659e40c04a06e81f1c"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.46-test.357/MapboxMaps.xcframework.zip",
            checksum: "02d5c847d3cd5eb1793fef5c8086e96dfb8540ad8b3f69a7cb6f46d9e3ac09ff"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.46-test.357/NordicDFU.xcframework.zip",
            checksum: "e4164a6f3c469820f98d77db309377d9321b54826497ef526c503b9b8eb6689b"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.46-test.357/package_info_plus.xcframework.zip",
            checksum: "eb5ab38491682be4ab4e09d2ab6d91efa53d0d359e3b85fcdf5d5776079d6294"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.46-test.357/path_provider_foundation.xcframework.zip",
            checksum: "285f43ea429b8b27a0044e1e7a92b73068c2468cf8ff0291e8f9622ae4b6bc8f"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.46-test.357/permission_handler_apple.xcframework.zip",
            checksum: "6618e5e694bf8a3d116f09d304c1139e279a11e7f9f07a65af44a7acb5f38060"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.46-test.357/share_plus.xcframework.zip",
            checksum: "42a5581fede2bddf8f229ea49fc4afaeffb4f5dfb0b57bf19f695decc5308f36"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.46-test.357/shared_preferences_foundation.xcframework.zip",
            checksum: "bfcdc926eda40f8eab39edf460502c71864ca2ae2bb8ad047d0def43341bebd6"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.46-test.357/sqflite_darwin.xcframework.zip",
            checksum: "b9b594ff73ab48478d3075b6b4728ed9c3917fa534d0c6fd08597bc4b440dab1"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.46-test.357/TOCropViewController.xcframework.zip",
            checksum: "b536d122bee8f59f31d7210af6741aff6a2fceb8c32b9918cdb9b1e48be553b9"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.46-test.357/Turf.xcframework.zip",
            checksum: "10399d04b08ae555ee2635968e01266b96e45c41f9e0824d16be1e5e9e3fe60e"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.46-test.357/url_launcher_ios.xcframework.zip",
            checksum: "9bf881d4b2976bc614e9bce6408796fac02ba189460dc34e25c8beaaa305dac5"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.46-test.357/video_player_avfoundation.xcframework.zip",
            checksum: "8092c4c0c0f1f4ef5e4d201c5c3c058a71ead79fc4bf340339437cf4fe3b871f"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.46-test.357/wakelock_plus.xcframework.zip",
            checksum: "4cc93b19fa3956e0fd37319e94dbca9704266830010beb73ce2a8ac109e2861d"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.46-test.357/ZIPFoundation.xcframework.zip",
            checksum: "6c7aa739be16370dc74a1e4bf1fe0229cd464dd30fbf2be60053ffba88faa93a"
        )
    ]
)
