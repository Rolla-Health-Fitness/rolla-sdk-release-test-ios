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
            dependencies: ["Flutter", "apple_health", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage_darwin", "geolocator_apple", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "FlutterPluginRegistrant",
            publicHeadersPath: "."
        ),

        // Swift wrapper API
        .target(
            name: "RollaSDK",
            dependencies: ["FlutterPluginRegistrant", "App", "Flutter", "apple_health", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage_darwin", "geolocator_apple", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "Sources"
        ),

        // Flutter module (Dart code compiled to native)
        .binaryTarget(
            name: "App",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/App.xcframework.zip",
            checksum: "d50a7244c63a8efcac267c62b7f959f7080033b3189a64507c03845548c0e04b"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/Flutter.xcframework.zip",
            checksum: "288f3d9959669a1ff7f67208556834c1acb292d9b97a56b212b4ffd7f95340c1"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/apple_health.xcframework.zip",
            checksum: "4b2ce1ae16b8bb29dbc66415d82660f82067dd662975a2b3735dadbe0712c43a"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/connectivity_plus.xcframework.zip",
            checksum: "6028317ed4d5f39058f1376be9bc402fbc1c621b1457cabffed39df3ab3ca1a4"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/device_info_plus.xcframework.zip",
            checksum: "cdf59eb25fae096212f2c243e5c0df8104ddc6ec2aab596fd07c8e497759fed6"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "c136dff60440e6df05aad0b0828e8a628c7d21fe4d5e9410372e5164a9c49ba8"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/flutter_local_notifications.xcframework.zip",
            checksum: "5b31d589d462bd8ad4d1764652af975e2bb34180bd3918cb070fc74494796ab3"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/flutter_native_timezone_latest.xcframework.zip",
            checksum: "49fe730f9dc26851982459fc97d863106cf617d9a36780b862905828ba6e4934"
        )
,
        // Flutter plugin: flutter_secure_storage_darwin
        .binaryTarget(
            name: "flutter_secure_storage_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/flutter_secure_storage_darwin.xcframework.zip",
            checksum: "f33a02f78e558a29b8524897f6554b74b59d698634ec0235887814ece5221ad9"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/geolocator_apple.xcframework.zip",
            checksum: "eb1fcef46b887e5805bab15e8ca8a45afe380a1def7625e5e531e27a0b528463"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/image_cropper.xcframework.zip",
            checksum: "88c065c27df229e6ea6ba899ccfbf0fa0002044bea5b2d00edc4a3a9567ca253"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/image_picker_ios.xcframework.zip",
            checksum: "db323c106384daaaadbde80f5533453eab1dccc295b74bf4aa6cf11a1b84bb67"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/mapbox_maps_flutter.xcframework.zip",
            checksum: "ff2dccbe68ddf2b45f11026bcd1a718d3325087ea45ab8407b6f4fb671ffca31"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/MapboxCommon.xcframework.zip",
            checksum: "1ff1f71a6c54b8d37f23b5fc0ea669fd602a08d248d56b77a2a7568b2b32564f"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/MapboxCoreMaps.xcframework.zip",
            checksum: "9b52dba5875c8f0ecd8bb62941040a9ff6e738a1d3f895c1aae1358cf76519cc"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/MapboxMaps.xcframework.zip",
            checksum: "e65cde7465d99f3ef247f3a66cc436b6cee8938e4fa3cf16dc14f77217f2f64e"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/NordicDFU.xcframework.zip",
            checksum: "755f08423de954fb0fef586cb082fb63acb2de5548954673f93389768fc60612"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/package_info_plus.xcframework.zip",
            checksum: "18abd143c19fe7018fe3fb116c3fae6711691172c166dd90c1fbaeef97a06125"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/permission_handler_apple.xcframework.zip",
            checksum: "25f3cf4947dbe83a5af6870e410a6f866c2d048d2d04e52eb7146c56e385e750"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/share_plus.xcframework.zip",
            checksum: "9e15264612ac1011307801c524e68a01b6734823c501545ed9a1d888c0e184b5"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/shared_preferences_foundation.xcframework.zip",
            checksum: "5b666d0c250510478599896313275509d8fbe6bd67ddf7a633920eae8bdb99b6"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/sqflite_darwin.xcframework.zip",
            checksum: "53e3c3c5f65fc2f37c233e4a954d21c883ab8a24da92c5ce0bcc1c442c0db15d"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/TOCropViewController.xcframework.zip",
            checksum: "7733671d53c784eef2f4c93b4b8acf8f7d1cdfce3b4a8d7ee897da98b34ae188"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/Turf.xcframework.zip",
            checksum: "6e1038b72b7400753daf3db5679276bad7a0e65f6a7121521c5b4a6209dfb95c"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/url_launcher_ios.xcframework.zip",
            checksum: "d4c4de0f473cdebc12a85345ee7f41693d380e0f2d7e721056e1f2aa83ef1c27"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/video_player_avfoundation.xcframework.zip",
            checksum: "7ff81f032207bd7afffe4794d377a2339333000cf3b730996cd8c0a162cae79a"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/wakelock_plus.xcframework.zip",
            checksum: "f627a9064dc043b9b41e6f8c177960511b0e76c26bcf7e3499c171081d30963f"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/ZIPFoundation.xcframework.zip",
            checksum: "24a252b0f00af770c1299880215079e368be0b2c7ed0f54701baa7de938b0e15"
        )
    ]
)
