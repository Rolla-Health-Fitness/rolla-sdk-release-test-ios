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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.291/App.xcframework.zip",
            checksum: "77bf342b6e7c2d6910cdd9109e62baa4934f90220b041ee8977d2728419d470d"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.291/Flutter.xcframework.zip",
            checksum: "a26ea731619608a38175d39969f0687376e4e7db73c72500db4da78640f7d666"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.291/connectivity_plus.xcframework.zip",
            checksum: "cba04e1f1ec5240f04c89aaa5a6ecf005b30c8fcf0230edca708546d2c95ee81"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.291/device_info_plus.xcframework.zip",
            checksum: "9c4f2fc3c54dbcb76680e99d5ab5602cf7f4d620b98aca000162f9ac70d7597f"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.291/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "a9606c67e65d64acba5c9e565446dffd28b1d43ae25a1ab6e99a35d69b347a2d"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.291/flutter_local_notifications.xcframework.zip",
            checksum: "664da8cf98d7737e045b87bfc475736a5071f3b520a17ff3edebf5383638d52f"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.291/flutter_native_timezone_latest.xcframework.zip",
            checksum: "5f1c87c2820e1622e4354a932d57b99ac7028b1e90788f3df7f7747a98faf452"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.291/flutter_secure_storage.xcframework.zip",
            checksum: "69ddab28fd4f5276265c5e4a9e05057444c4bc48cb68a8e61772344c4a9f0a56"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.291/geolocator_apple.xcframework.zip",
            checksum: "27c67a04ca3d95b07b0a48841ae6e3ef2dcccb526f9ddf8a2d9effd0d40dc68b"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.291/health.xcframework.zip",
            checksum: "e58d0eea81ed66f0bf5df28f5f84259309b70462aa152518a72fb16cb6f1cd11"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.291/image_cropper.xcframework.zip",
            checksum: "b2faefc0d3482553a4f9ddf3c5c4229d4f0051c9c5e1dc9163dcab361692ad01"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.291/image_picker_ios.xcframework.zip",
            checksum: "f1354dd538d75ff05eceb7384ee01a9d2c4c423415400747b427069750fd5b16"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.291/mapbox_maps_flutter.xcframework.zip",
            checksum: "d08a959930b4ecc3788dc92c05ba7561f11ddfa4836161c17adaba9336bb2603"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.291/MapboxCommon.xcframework.zip",
            checksum: "8218daf34690c3d79ee809285fa248aa83a4eb74db811c18cbbac73b79792440"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.291/MapboxCoreMaps.xcframework.zip",
            checksum: "d4db68e60ef22e3b5a55fefac091cf4165c5626fa63b678f5708c459cad66512"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.291/MapboxMaps.xcframework.zip",
            checksum: "0c2e70d2ed9226917e89b87097a4e21ba56de939e685afa033818280f9e7d4e0"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.291/NordicDFU.xcframework.zip",
            checksum: "64bb036c9a018fa97d74aaa6e85a694eec740a84018a3be3e78fbd520c147ba4"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.291/package_info_plus.xcframework.zip",
            checksum: "cadcc0b084a18732edcafebd1dacf41f9c3daccf83c71a56837f4e37aaa49749"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.291/path_provider_foundation.xcframework.zip",
            checksum: "005937434e4143a41c2fdf4bdc523972e37db1dc738881d357f6974136aa717f"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.291/permission_handler_apple.xcframework.zip",
            checksum: "ad351079b555f8a20da29d06c9aa5ff0818a5867ca19b83ac4697e6acbf848f3"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.291/share_plus.xcframework.zip",
            checksum: "e127a7e93f4619997fc8a0f461eed4b88ef1ab0915b743610b9c424cfd84517c"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.291/shared_preferences_foundation.xcframework.zip",
            checksum: "09684b95618708ab9316c9b5d4a5b50e111d215c4b636d3244837fc8a5b360fc"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.291/sqflite_darwin.xcframework.zip",
            checksum: "514e1e868f4e6e06b1e411f76cde93597e05f62e955f20c00a9debdad0b58d1a"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.291/TOCropViewController.xcframework.zip",
            checksum: "98e322f87b5abc7c506dd0f0764b8a3b17df420e398546f156749214da95de27"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.291/Turf.xcframework.zip",
            checksum: "7f37d798bb64c8bde1d12e5729e6df4918592ed504fd8f089d3fc26e39ab21cc"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.291/url_launcher_ios.xcframework.zip",
            checksum: "fb003a9259fd99c57c0dd8448d6be7700b9dce7b3ca048fc49f6cc0849f95f24"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.291/video_player_avfoundation.xcframework.zip",
            checksum: "f2159755ed63ec1dbc971d2f64d91d1c2bcb07bd5725418ca8cb886900a2e476"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.291/wakelock_plus.xcframework.zip",
            checksum: "879a839cdb3f958178d1b875e1436be9450c12f36ccdc34754e512e1c4ea37a2"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.291/ZIPFoundation.xcframework.zip",
            checksum: "caaa8e1e45e092a181db4350cb5e0fd1fea4a30579027cb993feac636acc1021"
        )
    ]
)
