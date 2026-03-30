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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/App.xcframework.zip",
            checksum: "cbdbdf7812e06cdae8007678d49f4d97c7bf28bf750136e579485edf9d44d708"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/Flutter.xcframework.zip",
            checksum: "ef69daf91aed83a598b59fed6053a01e9722993b2030e70932bbc5179bf709df"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/apple_health.xcframework.zip",
            checksum: "74938bb9b70ef1232cb553e53503e16693d284644ee5b80f7b0b0b30afd2d57f"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/connectivity_plus.xcframework.zip",
            checksum: "0e9db130b339f23e1b841b2505111e1c1641330681006e205772ea98cd8603b5"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/device_info_plus.xcframework.zip",
            checksum: "aa11e55506b81da6005aa3a8921d8e432577df00a6cba99ff651f72675f5c457"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "c2151785eb402a6dbed513ba74e869d9a5c666356f632538ed1e919a02ea7cb5"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/flutter_local_notifications.xcframework.zip",
            checksum: "f6994e7733baa41b06c66de1a70cbddb4c3a48cf63f3ecf0767d70504df72170"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/flutter_native_timezone_latest.xcframework.zip",
            checksum: "477228ed0487511a38ef46d132a1f855a40e6b4906c09767992229b921169f2c"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/flutter_secure_storage.xcframework.zip",
            checksum: "85570710a1e0f08a1517eef50b1ede2e2137a03b432690ac0d87b83b75a2a3b9"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/geolocator_apple.xcframework.zip",
            checksum: "0dbc1f0226b8682b98b68e60795e1650f5cd85b09971a046da89ba392af33ea6"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/image_cropper.xcframework.zip",
            checksum: "db52dc42d5036846e2063a77b42d72d2e4e5202e65d14cbb90de3f040e0c9a46"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/image_picker_ios.xcframework.zip",
            checksum: "32b74c732203e3e6eaa213fe08909659fe8cfa1fc7192ed90adaaf156eb0bd44"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/mapbox_maps_flutter.xcframework.zip",
            checksum: "01a9508226f4a38f841e62830a317181ee123c820cf163e8837bc058ec098e6d"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/MapboxCommon.xcframework.zip",
            checksum: "6348fc197053490df77afdae617c10c7fb126837ea70ebe1d11b77df12b43c14"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/MapboxCoreMaps.xcframework.zip",
            checksum: "96ede4aebbf073073b3e5be2baf34634de481313f47ab42031aa04280566acfb"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/MapboxMaps.xcframework.zip",
            checksum: "b1be4a9c4766da1aafc2c5adfb83b5358378a8cc974164ce8ed46ed138c0bb5d"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/NordicDFU.xcframework.zip",
            checksum: "c11cdf69b6030cd3d247e189e90c95499d03da5472bafa09e429bf1a99fe1898"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/package_info_plus.xcframework.zip",
            checksum: "83062ccd15e35e44e37167353ea3ea8f737e6521337eeb4e175f7224f8633499"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/path_provider_foundation.xcframework.zip",
            checksum: "ba05f936a631b21c7286f076322cbd7d82f32f7fe60c3366ba1d0c835314c396"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/permission_handler_apple.xcframework.zip",
            checksum: "8ceee4529058fe74fd13c2fd2d8ec42ae9d65dc10054ff2bf073c88f5ce54d3c"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/share_plus.xcframework.zip",
            checksum: "75473dc3768efcef8a9621ffe306c8b1e0ba1fa3ec4ac23020271aebbe632677"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/shared_preferences_foundation.xcframework.zip",
            checksum: "e90cee425eb38300e2716113aa0a8454d429a79703360807229c609eb0133b27"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/sqflite_darwin.xcframework.zip",
            checksum: "82a2d549f44e7514634ff1422d180c263715a8a267adf640e154d414d728f2a1"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/TOCropViewController.xcframework.zip",
            checksum: "36c2f6c61a3e510cb3e2bc21350cd0322e7cc8bc311cb1e7f17a647fc5588727"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/Turf.xcframework.zip",
            checksum: "390dad6d2a896fca1bae53637417ea74e232818d955bc15da4ef6944fcdae74c"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/url_launcher_ios.xcframework.zip",
            checksum: "cf6ab1dbcb55df9e630b8a1dd45f44a6b562c6e54259645b71750d3941937bc6"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/video_player_avfoundation.xcframework.zip",
            checksum: "22bfe37b462106a3c82a0ef9fd4c716a8f6bafa8eeb7117995f6c6b9fa09869b"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/wakelock_plus.xcframework.zip",
            checksum: "5b8299f1c5944efbc6d7eeb800ce70d6fa2e0150036f85432382cad53f2d57e0"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/ZIPFoundation.xcframework.zip",
            checksum: "d0d4df9b4653b3989099c6e71892d0e0f5b749a70eb4b88e161c1588d0096b1f"
        )
    ]
)
