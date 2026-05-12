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
            dependencies: ["Flutter", "apple_health", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "health", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "FlutterPluginRegistrant",
            publicHeadersPath: "."
        ),

        // Swift wrapper API
        .target(
            name: "RollaSDK",
            dependencies: ["FlutterPluginRegistrant", "App", "Flutter", "apple_health", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "health", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "Sources"
        ),

        // Flutter module (Dart code compiled to native)
        .binaryTarget(
            name: "App",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.240.1/App.xcframework.zip",
            checksum: "ccfbf49725ce551d205bfc26d3015967bea709d6d638bbb97c1c760244fa6f7e"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.240.1/Flutter.xcframework.zip",
            checksum: "c42a9447fd41694011d986b0ed26c7617988a25337146f634597499187e509df"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.240.1/apple_health.xcframework.zip",
            checksum: "97f916b40272bbd66eaa4bc60916cca8956faad14cc9a7d0d523093a776741d9"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.240.1/connectivity_plus.xcframework.zip",
            checksum: "8481038cba0a617ab3b104d02dc7686a6310d5ae99bb164a3d4d546115e2a5d6"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.240.1/device_info_plus.xcframework.zip",
            checksum: "3aba789ba9f97f58b1e1e3aab9aff08f4c8d6784a232ef1f04543410341cfd5a"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.240.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "cd5e177016d091e247f59859f2f421507f392b8913c7a074c1fb7ad40dc2e3a0"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.240.1/flutter_local_notifications.xcframework.zip",
            checksum: "32394e3f7b121cc403c4e98dbae5063a80277e051d1d24f2568cdda09bf6ec66"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.240.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "b1b7b1ba70432eea15b03d8dfc50e6a5dd58c91340e3794e3958c3359d9fedb5"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.240.1/flutter_secure_storage.xcframework.zip",
            checksum: "9dd3de30bb5eccf050f72f4ac42097263128073b4ee83dd789f74f97951cbe44"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.240.1/geolocator_apple.xcframework.zip",
            checksum: "9493de9cb6cf0e9b30ccf1062eb31d6295dcdd54d3a811c9938fe1e413dd5e30"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.240.1/health.xcframework.zip",
            checksum: "550ef5f88be61289f64a668daa52c1c606f366fb4557eeafd88c9deec4638f26"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.240.1/image_cropper.xcframework.zip",
            checksum: "b2fda22aba50862ed3dd33227ea6a76857d3ada8bd3f32681bbf3d3bd845381f"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.240.1/image_picker_ios.xcframework.zip",
            checksum: "a324f12c2323724504d5e18e9cc9b2d7f6f3986a77b210eeeba0f96ebe931ff0"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.240.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "710919a6bfd02917f30bc3c92974bda6d1f49aba5582220aeff3170c1ce97517"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.240.1/MapboxCommon.xcframework.zip",
            checksum: "d4addd7457c4b1fa3e327fcdc9f22309f1e9152a9ef56d2421de49e02dd3dba7"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.240.1/MapboxCoreMaps.xcframework.zip",
            checksum: "762ff3cdf1bcdb694bf6c19712b54876fe1b84fec54dd8a68eb4d1f72d737f85"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.240.1/MapboxMaps.xcframework.zip",
            checksum: "13f3d64522c4e2fe21673d5708c62caa14adb30e60a532915f5d55f629202d06"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.240.1/NordicDFU.xcframework.zip",
            checksum: "45e8861006d6ed330e31339398dcdf0dcc97f63e3a9865decba642e3923b8db1"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.240.1/package_info_plus.xcframework.zip",
            checksum: "d2399a9601b12ed835c527d79760387f011208c24825acadb234f5a209a50e47"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.240.1/path_provider_foundation.xcframework.zip",
            checksum: "320fa9307f27860b258e774dc1d60397bda43d09576624611eb6fd8d0466c8ae"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.240.1/permission_handler_apple.xcframework.zip",
            checksum: "b136a947c44d08503c9f49146d3da7ed43624732945c7edfe71624b48c90622b"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.240.1/share_plus.xcframework.zip",
            checksum: "0d077c5973d8e6fe36bf3577e369b48465d76bb752df3afd0999db0d2f9d4df3"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.240.1/shared_preferences_foundation.xcframework.zip",
            checksum: "71b539704904bcfcb2aeedadf23e901b41f4d25bf13ccc93785c4bc1cd44eb5a"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.240.1/sqflite_darwin.xcframework.zip",
            checksum: "11e458adbc30721f04079b914b3b8887a30979bcafbad97141705a1042a3b17e"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.240.1/TOCropViewController.xcframework.zip",
            checksum: "67e30788574bee48aa2f08427d36e9107cbda17b8c5d9e76ed3701b0b18008ca"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.240.1/Turf.xcframework.zip",
            checksum: "04792824f87094588207aa94b4fd731ac1c7a1e12d1dc1edc9ea866c54d129d5"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.240.1/url_launcher_ios.xcframework.zip",
            checksum: "e0f05ca47286b39b7ddd26fe695b9217d39eff14ee223d30edb724663df7abdb"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.240.1/video_player_avfoundation.xcframework.zip",
            checksum: "43544f05861dd6c79f1474295197e96046fc3a1883eaac09a523d769020da48b"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.240.1/wakelock_plus.xcframework.zip",
            checksum: "6141077b35bd8481a0125a8e2655fb96118b3adb87ed9b23d7c69f30ef5c7e68"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.240.1/ZIPFoundation.xcframework.zip",
            checksum: "e212af376b7e92ff129b11cd54eb15f7e9cb82095902706de4d1f6f7d7cf1e1a"
        )
    ]
)
