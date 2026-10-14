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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.48-test.359/App.xcframework.zip",
            checksum: "ea000d8c9d661dd44d1b2d61cf8422f1e9cad054da3b277fc8860d8f2dae3f9e"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.48-test.359/Flutter.xcframework.zip",
            checksum: "56ce41a21036fb74b6be18065ce7c83282e41f9c783fa944b7d64dadb259a091"
        )
,
        // Flutter plugin: camera_avfoundation
        .binaryTarget(
            name: "camera_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.48-test.359/camera_avfoundation.xcframework.zip",
            checksum: "f53374a5df918976aecfd0531d95e1a3fbd0b163711c62ab7ecc33d7518fd4f1"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.48-test.359/connectivity_plus.xcframework.zip",
            checksum: "7fecd3e1ee4cdb85f72de01ecc1e98473cf6eb39f08b1c2f173c39484eef95d9"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.48-test.359/device_info_plus.xcframework.zip",
            checksum: "0cbd985d309974e9932fe68d6996e626641c1009d77b88565d695cf8ded98b8d"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.48-test.359/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "7e67e7331c590d7e7d8bc0d04a453e4e02530386651a6322a643755c83e22678"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.48-test.359/flutter_local_notifications.xcframework.zip",
            checksum: "4e9a15cb4f80ac6da551903f42ce464aec6be9c49362c9dd3894b2666cc98270"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.48-test.359/flutter_native_timezone_latest.xcframework.zip",
            checksum: "342fd8dbfd18ff988699c7ec4b8f1b619aab054834ea8666adbb1f9847166393"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.48-test.359/flutter_secure_storage.xcframework.zip",
            checksum: "e1596c352ca98d3e2eebd041fe5a191c67257aac7e3b6969a9143ed369e2bfaa"
        )
,
        // Flutter plugin: flutter_web_auth_2
        .binaryTarget(
            name: "flutter_web_auth_2",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.48-test.359/flutter_web_auth_2.xcframework.zip",
            checksum: "bfb6bc76d28f493239f782738b85d6c5515e69faa5e0c88e1051ea3202afcb54"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.48-test.359/geolocator_apple.xcframework.zip",
            checksum: "63bffbf2649a2b666aa978c1751e47960f7c25fe48be52aea2fbb249da894c65"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.48-test.359/health.xcframework.zip",
            checksum: "c00f9909cbfaaf4d15f7473509c1bb9e852fbdfdbaf9aff439502fba9cbf3cf7"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.48-test.359/image_cropper.xcframework.zip",
            checksum: "c30b38679e560ae708c3e3dade1f606a4a6151f3b3d42c704fb42ee5d72841a3"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.48-test.359/image_picker_ios.xcframework.zip",
            checksum: "c341bbdcc487dda1ece407b791eda9fc47ecf49054d7ae03eed59b75c9abd8be"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.48-test.359/mapbox_maps_flutter.xcframework.zip",
            checksum: "74db76a07eb04ca5fd27b13b3465ec2cc6425e530969637423617a45a13c9497"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.48-test.359/MapboxCommon.xcframework.zip",
            checksum: "cee7974b40f0eb0988a5d6c2d276421e3f15d19203de0c1d1c52e558f034ee1b"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.48-test.359/MapboxCoreMaps.xcframework.zip",
            checksum: "46cc2fc7ea0bf3a976122636eff0e944203461fcded1e0f9dc1fe96096b3a14f"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.48-test.359/MapboxMaps.xcframework.zip",
            checksum: "0b998a65be09871695cb0d1b73a2c6e4a2d99b2fcdab952a502eb346b55dae90"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.48-test.359/NordicDFU.xcframework.zip",
            checksum: "6fb47669a5ccc2564365eed5fb6f78f5ad1d9279191e9e7d69097fe4d0309cc0"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.48-test.359/package_info_plus.xcframework.zip",
            checksum: "15981ead955979b6afebbf9b2209073605d78803b9218d3e8a8213594b58719e"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.48-test.359/path_provider_foundation.xcframework.zip",
            checksum: "ed9a6f7b02bc6a8fc8ae71c0ca40bb8d1f44778270106be4898a0b8da0ac5437"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.48-test.359/permission_handler_apple.xcframework.zip",
            checksum: "058525793d8e9019f9e5aac21c73d6b2d81890676b1fd72344a36f8198a30259"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.48-test.359/share_plus.xcframework.zip",
            checksum: "74033d1d0d8a12181ef6cd25b3f60b1524a8d60cb718b680f36ad6f9d934802b"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.48-test.359/shared_preferences_foundation.xcframework.zip",
            checksum: "7a837744fe04fc38900965345c0031f602bb4b876335d326c2396436ab664ba0"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.48-test.359/sqflite_darwin.xcframework.zip",
            checksum: "6ae8e0b3ab837e74d0d5e9d63848e64379cb34597719e1cc021ffb30ca3ccb15"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.48-test.359/TOCropViewController.xcframework.zip",
            checksum: "6fc89bce0ade93cca9f8b87df7b9ef3b6077f096ec3a3bad005d0a0c933b5638"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.48-test.359/Turf.xcframework.zip",
            checksum: "bf3a49fb8140cd5d7eabc0cad5694f0a13038a5b6e5312793c4279afa3d32a4a"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.48-test.359/url_launcher_ios.xcframework.zip",
            checksum: "eb83ad8e6f95a91726f9ef31f87fd59c9cd2cb942e0755c0c405f89dfa983b7e"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.48-test.359/video_player_avfoundation.xcframework.zip",
            checksum: "b695d383a09b2d7062bca0df9fef9f9423071dec66135686ea3d83053ecf8e7c"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.48-test.359/wakelock_plus.xcframework.zip",
            checksum: "0709c2a9211b43423eb60f93477367f58b21f31e97fd082a8f13b6696b6ab207"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.48-test.359/ZIPFoundation.xcframework.zip",
            checksum: "aa9202f2dea93bd573b4c5afa0a4f94a7596bd0b712385fcc614049ed312f81f"
        )
    ]
)
