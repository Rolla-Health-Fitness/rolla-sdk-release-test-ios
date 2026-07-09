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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.285/App.xcframework.zip",
            checksum: "1b7cbccffcec3959183c14b1e3323f075961bc8fe541d16eace97b8e66400bde"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.285/Flutter.xcframework.zip",
            checksum: "b98edf31220e6435a39d4e69fd39a4b7c8c2ee2aeb0b3c009590aabdb997dd29"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.285/connectivity_plus.xcframework.zip",
            checksum: "a4e83d7858ce9cd59e0779f5feada89b057c73c49e75de328e557b98368d4b11"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.285/device_info_plus.xcframework.zip",
            checksum: "b0f44703fa3efb7397a5938ead6a755845aa55f1ea5a8e24981704b8fba0ec4e"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.285/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "9c6a2ce56f4ea134509b761053b3fe328b13b483a7bef90efdf143d964dac89a"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.285/flutter_local_notifications.xcframework.zip",
            checksum: "7b32062b75fe3cd659502c4a5eed02c598cbe7334d96d1510251cd591a267c0c"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.285/flutter_native_timezone_latest.xcframework.zip",
            checksum: "c1f4814d3731d87d43da5a93477539f4c5a8bc9e3a0aef442b2b634e80f97821"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.285/flutter_secure_storage.xcframework.zip",
            checksum: "854c4f5ead876e86c6dc81aac780ca215a51e9497b8da72c785e4741972ce356"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.285/geolocator_apple.xcframework.zip",
            checksum: "ee23af678080b256df1a5373d68cea9938f74b25218547ccc5a6d8d8a7f1d126"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.285/health.xcframework.zip",
            checksum: "dbc1adfd56351203e6ed70041c52da5bed74c48f78715721b8f96f39277bf85c"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.285/image_cropper.xcframework.zip",
            checksum: "6ec4b2ff3b64358092ce67c8c87a557b0b52bf3f2f115ebcfda204dde8849662"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.285/image_picker_ios.xcframework.zip",
            checksum: "19d1d1c95602c501c8182f921ef02f8a735ff33e0298c5532a20440c9a762047"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.285/mapbox_maps_flutter.xcframework.zip",
            checksum: "45c113abad28950966825d5a57d94c48021490cad94b0c6c591af5364dc29f99"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.285/MapboxCommon.xcframework.zip",
            checksum: "ff01230ce86c3f752b430c2987eaa4deb690e57be64ce0586a1e99aff7f7c23f"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.285/MapboxCoreMaps.xcframework.zip",
            checksum: "b2f1a9c16575f9cd31ad94feec49abfce5516c47db270cafb496e056f0e3dd9e"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.285/MapboxMaps.xcframework.zip",
            checksum: "56d000b12b1bfbd02cd6bc3f8c319fa8f1df754a7becf9f5147074a30d989a9c"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.285/NordicDFU.xcframework.zip",
            checksum: "71408bb5be3cb86752292fa2786fa43926c23c3f63c43f58e4d994e03c23ff4c"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.285/package_info_plus.xcframework.zip",
            checksum: "c8d44aa01888f84f83c0562fe96a3a3517be45cfc26a408316536d386ce4c807"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.285/path_provider_foundation.xcframework.zip",
            checksum: "111e1bc9d56492e1fca56c7e4c14d15cea748f956f069e8a85e6b4f27d5d307f"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.285/permission_handler_apple.xcframework.zip",
            checksum: "77ed5aa3da1605584c7fd1d74273c901956acffcb2a7508fe9a7d06a71dbcc25"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.285/share_plus.xcframework.zip",
            checksum: "4f20351f997ae5bd686703a3b9c8a366ed74badf736acb7cac988c3d474b6812"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.285/shared_preferences_foundation.xcframework.zip",
            checksum: "44f13c5bb375ec258c42cb484716839e8db296a1234f43e527b9db9e5fc6a650"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.285/sqflite_darwin.xcframework.zip",
            checksum: "ab8cd584d5dc72fef625f36bcb02a72be687aa998a5d6ac3b58ab3d5e96a5dba"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.285/TOCropViewController.xcframework.zip",
            checksum: "1316553509551cc8557b0ef940135e29bd8c33dd9abd2cf6cc254b998eb0b288"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.285/Turf.xcframework.zip",
            checksum: "fdc107bf3a9bab89170aecdcd96a8512068dd095e0393da2ec0c63e179eb4360"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.285/url_launcher_ios.xcframework.zip",
            checksum: "61f9e78591c9452a66ca47179a131daafc4922d2a52a2d2e554573923ff9599c"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.285/video_player_avfoundation.xcframework.zip",
            checksum: "6b7898b7a5f2cb42e9c4f1319e64aaca56f61157a7c7639cdd821923ffca687e"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.285/wakelock_plus.xcframework.zip",
            checksum: "f753d569072f8cba393385f949f078b4fb63c1d4effae9dff63b79cc4216d8f4"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.285/ZIPFoundation.xcframework.zip",
            checksum: "33920192c77b25ab9fb12df6f21e820d79233eb672ed0a780360889879fdb26c"
        )
    ]
)
