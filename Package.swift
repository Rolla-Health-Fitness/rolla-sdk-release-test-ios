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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.272.1/App.xcframework.zip",
            checksum: "81c306d7e57d9ca50ff55be4ad589093ca96fa1791c4cd6123d3ec443d02d985"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.272.1/Flutter.xcframework.zip",
            checksum: "81d8c4076bf71d582d71bfed9567fe0a1bf47198a57df813feef0470f11d3226"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.272.1/connectivity_plus.xcframework.zip",
            checksum: "f8b23459f127f0967e043c32b1360d96f95237af9691300f807edeefed8a3f50"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.272.1/device_info_plus.xcframework.zip",
            checksum: "7b9260c6cefa5eaabb0b692166c69b1d55df4674379301f48f1cadf7f2e587ca"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.272.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "2558d66f3ddb39cc30d5fc982ef3889b0aa2ecab3d30d053406638bd2a79e41d"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.272.1/flutter_local_notifications.xcframework.zip",
            checksum: "34e72273d66eb4be5fe14a68f88325a9d306d3a0caca42ae2e4396f280faa1fc"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.272.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "35d4efae95b8163b967ed4e56bdbbc9c6135e604ffac984a700d0ec3367cd529"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.272.1/flutter_secure_storage.xcframework.zip",
            checksum: "0ec2494ed9b988248e2b4e84fc1b7315215e6c7e7586ed014b3093cf5be2a997"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.272.1/geolocator_apple.xcframework.zip",
            checksum: "fde18c5e744bad9b2e49e5b795047a9436ff1a81c15a9dcdb4955382f7317090"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.272.1/health.xcframework.zip",
            checksum: "b4ebd6a09a155db96cfa62b029763d50c76d36f196f8e43e8669b68f606bff9f"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.272.1/image_cropper.xcframework.zip",
            checksum: "b6daef7efaa14700a0b4f109497c5ce366802c2beb5a7f80aad9fb4a72da6a99"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.272.1/image_picker_ios.xcframework.zip",
            checksum: "a7d81252c0080b08ac2aae6ba836fef0d6eddf16a962831ccc10f9cd8dd459ae"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.272.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "fe592c4c24cfa0d2f76d737f95e7a5387c91c51ee6345bceef24047c6c288e1a"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.272.1/MapboxCommon.xcframework.zip",
            checksum: "fae76d8c69541dc7ae6451b049472cf0038bd52510b962605fd1a00fe8327851"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.272.1/MapboxCoreMaps.xcframework.zip",
            checksum: "0a6158ca22a46910442bac8c1e82276ceac8a25ea13ad3faddf52bbb4cb58818"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.272.1/MapboxMaps.xcframework.zip",
            checksum: "fb341771c449e8ed8b43472deda4ea5ab51430c106dbc78454f38474450e1f9d"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.272.1/NordicDFU.xcframework.zip",
            checksum: "71c3f38bbbf665cc1d8f936647a394db89e27377b91d87e8a40f26e6b5ec9fbf"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.272.1/package_info_plus.xcframework.zip",
            checksum: "0dce4538624605e2fe696499d2bc8f1f6e6578a43047fd112a52052d1d3a38ca"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.272.1/path_provider_foundation.xcframework.zip",
            checksum: "4f5541cb217ad51163dfa2c3b90fa1b5a96d5b044b0abee12d761593b09941d4"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.272.1/permission_handler_apple.xcframework.zip",
            checksum: "a1320b674a1303347f69731390e8ad99ec8a90f136d8782042f38e2fe9d29349"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.272.1/share_plus.xcframework.zip",
            checksum: "4c19a4d50c2b74ede20a2939de20cfc6d53e79594cb42f51ec9801237c71b03f"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.272.1/shared_preferences_foundation.xcframework.zip",
            checksum: "56d8f3f850b31a3c510dbdebe445f748946cab82a85fa8a562ead1a8bd04eb4b"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.272.1/sqflite_darwin.xcframework.zip",
            checksum: "d5789dc0626cb7313e3e7bd31498c38ef952e2c4147ecefd747021d51c0a5118"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.272.1/TOCropViewController.xcframework.zip",
            checksum: "649fc6ec98ab38caf309ecc56d5f96916b828a03ee906d6bcf83f87f333496c0"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.272.1/Turf.xcframework.zip",
            checksum: "844b7dc1144e17c00109ca856f885b76f576acd12eeee27eae17bd66926bdfd3"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.272.1/url_launcher_ios.xcframework.zip",
            checksum: "cc8ba32b781ff5ca6ccf4b68ab5cc62ab169cf4fba90d4d8f675fa7b054fa491"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.272.1/video_player_avfoundation.xcframework.zip",
            checksum: "75854eee63d323a05815ea318e2c927d7cc8324244f8f7b29fb55e41110be00e"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.272.1/wakelock_plus.xcframework.zip",
            checksum: "868247ce27766be488d41a5527ddcfc493998627cd5c3313763ea328b0a03776"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.272.1/ZIPFoundation.xcframework.zip",
            checksum: "6f6492da07ec49edef09ad20fd49571c67c3ed4898b515639bf634781de842ba"
        )
    ]
)
