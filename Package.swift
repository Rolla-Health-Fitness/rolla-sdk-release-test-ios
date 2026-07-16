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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.299/App.xcframework.zip",
            checksum: "9df597ac03e5e3ad51c61f8ae14e6c92796c205e4c4e7cc49af5b89e7337a35b"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.299/Flutter.xcframework.zip",
            checksum: "e7ff45667e6cd211b90dc569ed02d8ffc54e2b6e5ae87a694cbfadd2f01fb309"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.299/connectivity_plus.xcframework.zip",
            checksum: "84e996ccbebdbc61e9b9bdc3a949d318b9c4f1509b90bc45c4efee853d2211f9"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.299/device_info_plus.xcframework.zip",
            checksum: "611b909dccd37bd3d28948bb14ad93990e36909904372aa0d568d17736de0413"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.299/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "8ee8ae5648de04c3083eab34e6c89bbea18ec15cc7709ee35478bad06d549370"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.299/flutter_local_notifications.xcframework.zip",
            checksum: "fc92a70d5d938611c57e73e07fd55db780382a1e85b132faed1b40aa4114dbd6"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.299/flutter_native_timezone_latest.xcframework.zip",
            checksum: "f18068368a4bb29b479adacbbb00894436b7fd1477f45bb69cdffbf132142b74"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.299/flutter_secure_storage.xcframework.zip",
            checksum: "7596a856d4f8e00cc0c1bb596da1d10cab7f901157b26ca72137c53e1fdd240f"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.299/geolocator_apple.xcframework.zip",
            checksum: "069d1e16effb66e59fef1411c332eec0c43f5d1edc2fe3773de7d19b72ea6300"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.299/health.xcframework.zip",
            checksum: "f87cdff19045ae0735c22a65012f9b43c1da4d6fce7942b6077d169797760b56"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.299/image_cropper.xcframework.zip",
            checksum: "b1eef9898968ddbf4f679347163f389a58732de474e40083db897de77b0352b4"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.299/image_picker_ios.xcframework.zip",
            checksum: "55a6a6b24a033f2a4f6b980179fcf113d4445a7f62f240ecfbce8d11fec786c5"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.299/mapbox_maps_flutter.xcframework.zip",
            checksum: "334fc6f76bab5f719441ed6618593ff978db16e43bf356d5e547ee77761c15d4"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.299/MapboxCommon.xcframework.zip",
            checksum: "6f5fa8ff8ec6f13697e6a1fe6b793a8d25cfa001b05034bf5785954598bdf917"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.299/MapboxCoreMaps.xcframework.zip",
            checksum: "96703096b22b6f2b1fb9df5c22e08993a7c71ebc9d01318b5d4e57e679454999"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.299/MapboxMaps.xcframework.zip",
            checksum: "f98ff076414526387d2e4cfda23f224f98c3512cb8d63dfcc2a789e355345aab"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.299/NordicDFU.xcframework.zip",
            checksum: "a9c480d07744132e5df769b86a0bb7fc7d6a42f48fefb39ce2b7af111dc58b0c"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.299/package_info_plus.xcframework.zip",
            checksum: "553dd668c220c4dc5759abd46b6915b113966be87369f5aaac512aa695403f68"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.299/path_provider_foundation.xcframework.zip",
            checksum: "0198ab1f289e30b23ff7abf8a1c005150e29a3bdc1604e42bd4bbdb100733907"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.299/permission_handler_apple.xcframework.zip",
            checksum: "e4e42e2351ae0788c1856ee3bba3851984770ad6d10e17469a5fdba50b42e647"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.299/share_plus.xcframework.zip",
            checksum: "aabf92ca2e78880758660740a9c84856a092a4bf1a44dd94e61254553d2d1d1c"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.299/shared_preferences_foundation.xcframework.zip",
            checksum: "934b09f0fc18eef0bf995183ed59f2c46505a856562a7c2efe592e6c8a0a1142"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.299/sqflite_darwin.xcframework.zip",
            checksum: "78d74f1d26d8b0435c440b2419cf0b754c4b5410cda459d32f694df79ce3e531"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.299/TOCropViewController.xcframework.zip",
            checksum: "d194af589cdc9d8360c7cbb8ea7e8ba0dd4b87124af27300a4616009ac9c0047"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.299/Turf.xcframework.zip",
            checksum: "6906643756ccff796727159d13b0f46e2d0300e44e4e4b819d4080fe9103868b"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.299/url_launcher_ios.xcframework.zip",
            checksum: "10614c283cbb13dfc65134775938dc3472a3a6867ac2aa9464898aa662216def"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.299/video_player_avfoundation.xcframework.zip",
            checksum: "7aeb98b2eb5f53ae2ea701ef767fc13780de46f8c7929c76aebcdffa980b7be2"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.299/wakelock_plus.xcframework.zip",
            checksum: "bfa7b16a207457a6b6a3405116c62496d78dbb11b899cd8c80f7ed7855d278e4"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.299/ZIPFoundation.xcframework.zip",
            checksum: "39032a09301481789655ff63fc265a0637f00cb549853eae339263f48d210c32"
        )
    ]
)
