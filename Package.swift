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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.53-test.364/App.xcframework.zip",
            checksum: "091768dffebead9ff9377da8c4cf7a90d5cab123945938c8e7c98c89c5a2dbb4"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.53-test.364/Flutter.xcframework.zip",
            checksum: "8ba0bd27e03a990eff701b630169a7d1747f088de07a32754175674f2aa487b3"
        )
,
        // Flutter plugin: camera_avfoundation
        .binaryTarget(
            name: "camera_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.53-test.364/camera_avfoundation.xcframework.zip",
            checksum: "8823f4bd64b75e975a0a9ab77d47d6adbf10729528f17800596dab6883bad77f"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.53-test.364/connectivity_plus.xcframework.zip",
            checksum: "3f4ce369362f6f618ba05d470dd7256dc9753d90f775cc384c3baf1b2511fda2"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.53-test.364/device_info_plus.xcframework.zip",
            checksum: "997df8160c0ea5bc143eed8e95c578068dbd82f0483e6b703a6be7bcd389676f"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.53-test.364/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "8610c5a8df6cb2b4afd7a54fbf8d842a9ad16a4901b3caf5434b8d7377859bcf"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.53-test.364/flutter_local_notifications.xcframework.zip",
            checksum: "4715519b67fda601c560142e0e1e291a399a1b00590b063bcec8360207cb14a9"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.53-test.364/flutter_native_timezone_latest.xcframework.zip",
            checksum: "1df52951c4f4a759091e4fa1e160d363cb1bc3c07e4d46b499a27e335bba1bdb"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.53-test.364/flutter_secure_storage.xcframework.zip",
            checksum: "03ced61926b8fcc33b25473da39e03d020c5dcaeab0080b1d4e1f1419f452c06"
        )
,
        // Flutter plugin: flutter_web_auth_2
        .binaryTarget(
            name: "flutter_web_auth_2",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.53-test.364/flutter_web_auth_2.xcframework.zip",
            checksum: "5bff69752a1482c4363dae70c10870d72053c9f90f861a13cbe7e6e94cd2e74f"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.53-test.364/geolocator_apple.xcframework.zip",
            checksum: "cf0eec24815805efa4e7d64fefb344ac65239ed2f4249c9209ca9e54d58fadde"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.53-test.364/health.xcframework.zip",
            checksum: "1620b7a3cd2c00283279b54df6ffd22d0b91c2dd632d2361a903b7fe0bf48ae1"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.53-test.364/image_cropper.xcframework.zip",
            checksum: "e411e3c419c865305f7f63a51b3d46a82833c06197c29a410b072f9a4de7a6f0"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.53-test.364/image_picker_ios.xcframework.zip",
            checksum: "ac0eed1d5c9ad716f5c84e1826755461d8983f06d0ac08d3dea1572550ac7164"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.53-test.364/mapbox_maps_flutter.xcframework.zip",
            checksum: "350b51130aed9f08a641d7e8b724db0e666c5c2f3ece52ac83a4b7131f8e7304"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.53-test.364/MapboxCommon.xcframework.zip",
            checksum: "1c0e439b64622af4f67afdc1f36428830eccf53d5f9eb954a94613b1d6957717"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.53-test.364/MapboxCoreMaps.xcframework.zip",
            checksum: "ec81940e29bd0ce86116085d316498a26ec1ed36889178a6bade63d1e546bb6f"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.53-test.364/MapboxMaps.xcframework.zip",
            checksum: "1c9967ad760a8eed063eb922205902615e331fc3074bb2dc6196af0be6c758ba"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.53-test.364/NordicDFU.xcframework.zip",
            checksum: "6045d0cd266186133b2b012c27c1124067212372d515e14b96638754d0f2f889"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.53-test.364/package_info_plus.xcframework.zip",
            checksum: "08f34a58243b25a2b57c9968b849a242b9de4fe34bc4fb0d6f4bd385afcffa38"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.53-test.364/path_provider_foundation.xcframework.zip",
            checksum: "5ddeea3c26d5dd81502421e6ac763ad4b4e6d50dd9c3e4d421b605eaf3e773f3"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.53-test.364/permission_handler_apple.xcframework.zip",
            checksum: "49960dbe5a8f6cbecf31cfc9037eebd860c3ee63a83b21dbe98c7d105c02acf4"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.53-test.364/share_plus.xcframework.zip",
            checksum: "12d231bf7a1a84b7991c54954a4f3f047d7740dd11bea964a6cc34ee5316763b"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.53-test.364/shared_preferences_foundation.xcframework.zip",
            checksum: "0dbdb87f80acd80654883becbab30499f60594f3f97ccc23c0e23fa3bc5ab454"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.53-test.364/sqflite_darwin.xcframework.zip",
            checksum: "039ea9312bd6d3e5961f4c4fe81b7630b54f981b2ee737c8175a50a8f2e59bdb"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.53-test.364/TOCropViewController.xcframework.zip",
            checksum: "23c36e8390d40b85e663a44403991ecbcd07409e4d2b4c720a1bc8caa33cc4b3"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.53-test.364/Turf.xcframework.zip",
            checksum: "e4e959fd594fb2e77d242e6f0e6561ee81e186920d07f9085a713e94dfed3002"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.53-test.364/url_launcher_ios.xcframework.zip",
            checksum: "0dad6f46a431be458092afeed73f1080e5bc02ee3285a5687e989ad482a2b557"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.53-test.364/video_player_avfoundation.xcframework.zip",
            checksum: "f3450f9d5d47e529cfd6d965955ff854cc4063fa37b9d88f61d54c797bf145e2"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.53-test.364/wakelock_plus.xcframework.zip",
            checksum: "6eace528a88f6f06968615d9cca7610f0b003f50918635b404aaf2c9ad2feb59"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.53-test.364/ZIPFoundation.xcframework.zip",
            checksum: "f06dbe72956d655882847f9cc214d8a3184e6e098d73bc8e953f12735addb2fe"
        )
    ]
)
