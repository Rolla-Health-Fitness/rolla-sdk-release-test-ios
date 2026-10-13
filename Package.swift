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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.45-test.356/App.xcframework.zip",
            checksum: "5f92f52dd0d8a8b3fa90704cedddfd5c7acaed717b94fec1ca240a2acea64af9"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.45-test.356/Flutter.xcframework.zip",
            checksum: "16cd33c34169ca83fc92a4dc442b7ea3597ef554f6da8e407ba6c6d82f06a301"
        )
,
        // Flutter plugin: camera_avfoundation
        .binaryTarget(
            name: "camera_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.45-test.356/camera_avfoundation.xcframework.zip",
            checksum: "9139e5c0c970fd589c75ecdf735d72e8284265a0c0c9272de01742b6762a1111"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.45-test.356/connectivity_plus.xcframework.zip",
            checksum: "2031fc1c2b0d8ecdd0ea456b5e00e55b13e15ed442879df5c11c5ec16d670eb1"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.45-test.356/device_info_plus.xcframework.zip",
            checksum: "85cd75f24471aa726994fe40244b9f759d45655bb8516bcae7ba8d9ddc5405f0"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.45-test.356/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "f0b9ba617bb177080671670be35d642a439a9daedccfd2cd1728e56de6e06dfb"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.45-test.356/flutter_local_notifications.xcframework.zip",
            checksum: "bc18a1d6fd9521cc9c68a2da051a9856c733f69e380eda8d34ca68a563753c1b"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.45-test.356/flutter_native_timezone_latest.xcframework.zip",
            checksum: "328c2608a57ebd10e11ab7b7cb0f95351c611ac976cf47e7cd07c7e7dd54190a"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.45-test.356/flutter_secure_storage.xcframework.zip",
            checksum: "f54e7a6ce62642865d088578dffd4c65bdc0e91cbd6f521abbfb3fd3325370b0"
        )
,
        // Flutter plugin: flutter_web_auth_2
        .binaryTarget(
            name: "flutter_web_auth_2",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.45-test.356/flutter_web_auth_2.xcframework.zip",
            checksum: "f2d3e17ff9dd54b56c4e6037762e9313c6635f3a3976a1143eabb2eed73339b8"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.45-test.356/geolocator_apple.xcframework.zip",
            checksum: "53b4028a05b47697713f56d20dc060130911255afe86d77252304c84e7c1cf04"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.45-test.356/health.xcframework.zip",
            checksum: "ef2711056de378c1bd70564320b4b2b770834df1fa301a41954bd07f2d37f642"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.45-test.356/image_cropper.xcframework.zip",
            checksum: "48a4b0d09511552316e0f56c27ea32c5e0c17f29eef83f34b81d2370e50b4f91"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.45-test.356/image_picker_ios.xcframework.zip",
            checksum: "972fb7d206e287969b760747b7e3ffef51ec67322917d1db2ca1d4159fb0d654"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.45-test.356/mapbox_maps_flutter.xcframework.zip",
            checksum: "ba255f9ffb7646f207e17d64bfd57111a10b6c7a854c5047a575a5741f6d0a02"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.45-test.356/MapboxCommon.xcframework.zip",
            checksum: "e49c9622ccf7199370d4a3dfe111f2212c3f1a5b57d8aecc203fb170f2237d18"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.45-test.356/MapboxCoreMaps.xcframework.zip",
            checksum: "60863f5c083cf132d25bde42ec7ef96de763363e39131d876f0186dcc0a66da8"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.45-test.356/MapboxMaps.xcframework.zip",
            checksum: "c59db6a610f1a4bd4b8d8af211b94881d4ecf4898bb4b8ded75d30e8195a54ad"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.45-test.356/NordicDFU.xcframework.zip",
            checksum: "c1247c6ed38faa2e5daec92f9c5019f4e9c28d46ebc1ca7671a59f2ffc3135f5"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.45-test.356/package_info_plus.xcframework.zip",
            checksum: "fa781195ce2970359c29183e243eca00323d46387f1c5bb5d776991c26f3a644"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.45-test.356/path_provider_foundation.xcframework.zip",
            checksum: "28f5d92633d3ab3ff7e63a2ce8ed770365102de30a73e5e9c9b41df594a7869e"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.45-test.356/permission_handler_apple.xcframework.zip",
            checksum: "5165e74fc707a4b7ca6a239e0f3b694ee85b8560e80e3d8834aecedb54986d13"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.45-test.356/share_plus.xcframework.zip",
            checksum: "3e4af1c5bb56becf4392b93c8c84b6a368162277e34873aeb263323886a8a62c"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.45-test.356/shared_preferences_foundation.xcframework.zip",
            checksum: "ae357353944bdd747a2c84fb3e4512236a8fad5c92c776d4e007d51419032e06"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.45-test.356/sqflite_darwin.xcframework.zip",
            checksum: "4e6d3168d7aa093c86e7fc0a25c6c43cf4cacd748c089f1fc5c6c4c37a55a8ab"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.45-test.356/TOCropViewController.xcframework.zip",
            checksum: "c817be12eba85a3eb78c4366a4500b859794980a837bdcd22082e399c44d443d"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.45-test.356/Turf.xcframework.zip",
            checksum: "756d3508d931195b60f1720ab5b8094fa81993ac36e7cdd7dbd6d1ebc9f6f487"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.45-test.356/url_launcher_ios.xcframework.zip",
            checksum: "8d714c619b374fc98d55c79a4f79640b5546cff09d2c2281313a69d779ba1a3c"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.45-test.356/video_player_avfoundation.xcframework.zip",
            checksum: "7a13cbea8eefb884c27416651320a158d6314104441c1d0e69fa01c08879dd97"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.45-test.356/wakelock_plus.xcframework.zip",
            checksum: "dd505d1165ea8ad55d3fd8cc5e387d5e32d65a35d56da8366c5efa47940d7a9f"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.45-test.356/ZIPFoundation.xcframework.zip",
            checksum: "4b89d8b3cd250a9dd4eb276e5ab70c2072cc3b422104fc4a4287d248e596d2db"
        )
    ]
)
