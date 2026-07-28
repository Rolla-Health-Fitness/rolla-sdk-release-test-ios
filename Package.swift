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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.315/App.xcframework.zip",
            checksum: "bf02b7f62a4cacdcb4e631566982ea71bc9098514269095db354435e5a320df8"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.315/Flutter.xcframework.zip",
            checksum: "70b6c6b071d0662d1495e12bb9d3a7c9065814e4a74bbcf847bae958f593bdfe"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.315/connectivity_plus.xcframework.zip",
            checksum: "8946850c6d30c6baf7cc81b6d1bf524d065dbde717a1e036d13c0171fe8e82ab"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.315/device_info_plus.xcframework.zip",
            checksum: "103925eafd2374a7f1f9e9ca5c68ce1912ed1e2c6164e37a9cbaeda236d51436"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.315/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "631396745004e59214b18604354c8e0906c5bb603a3097e66004b775fbb204b5"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.315/flutter_local_notifications.xcframework.zip",
            checksum: "1c3eb49626e9369cef493152c665f9d09d6dbc24851961f3cc1a799e425c8e77"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.315/flutter_native_timezone_latest.xcframework.zip",
            checksum: "38adb468c6fa397c49675c9d20aefda06fcad2a6b8a5530c0219571db2e3475f"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.315/flutter_secure_storage.xcframework.zip",
            checksum: "602a16514bebc91d55ffe21a3738c0f7310cdb9131cbe286f17e231d66cc3212"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.315/geolocator_apple.xcframework.zip",
            checksum: "876a099d45a15d319f4cdfa76f38f1fc7264252c229333ab53fe22f64f93023b"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.315/health.xcframework.zip",
            checksum: "6a4ea7abdd4e96c03b15434e96ffd6fee70e6cb99680ca1ffc19bf76d27225b4"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.315/image_cropper.xcframework.zip",
            checksum: "ce0696e1215a18a0180bb3a6bf18485b3de6389f0965e2b20ccf6f2490caa7be"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.315/image_picker_ios.xcframework.zip",
            checksum: "ee814d1fd8edb71a77ff278e45bd8b33479e077c76d9a561884dddc7b4e4d6c2"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.315/mapbox_maps_flutter.xcframework.zip",
            checksum: "d645644259385dd00f1b8a52f817d18a5525743e760ab597f7b2fb3ad477ccea"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.315/MapboxCommon.xcframework.zip",
            checksum: "1a8a48824718ebc7ff087f0964482e6d394c098bd261bbc245f434569de1fba1"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.315/MapboxCoreMaps.xcframework.zip",
            checksum: "951810e79cedbe60112137a3b338f25b0c38416d5b49a77871ea1ec701c3a4c6"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.315/MapboxMaps.xcframework.zip",
            checksum: "062d99056162a5c76fd89f0721e03e0c0dcd7ae3010f188d68e85be28004477f"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.315/NordicDFU.xcframework.zip",
            checksum: "4c747bc70180d34d5bf9e4c389d7a74f6a7b015a66033995baab559984505eb9"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.315/package_info_plus.xcframework.zip",
            checksum: "fedb55d6f2db131678fa733102ce74b30bdba38dc3e19679e5e4ec1146dca01d"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.315/path_provider_foundation.xcframework.zip",
            checksum: "af24ee162808be632ed761232147f6ab0d784a6a5ad30f9352c05833e3d8a87d"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.315/permission_handler_apple.xcframework.zip",
            checksum: "af7c9cf64b2ceb119088a60bc4ab73ba180023a91c0a6ece47218ff014486ea4"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.315/share_plus.xcframework.zip",
            checksum: "83179171d97f17f5a59a01108285e4e08d5d8fc389a862e56c89a19cda40a966"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.315/shared_preferences_foundation.xcframework.zip",
            checksum: "1bc65574f1919592e023afc61d4807c2ec43a9cc1239531f2bc76033ca8fd1e3"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.315/sqflite_darwin.xcframework.zip",
            checksum: "33a12619377f9c62d455d65fba5d8209314834f28b0f76b467d6ae082cc48bbf"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.315/TOCropViewController.xcframework.zip",
            checksum: "61e36817c606ecc89a5d3dcf9265f33dc20b6403e8a5451942d97bbb438cf03b"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.315/Turf.xcframework.zip",
            checksum: "b56fe05834ba66e51464a46e058e39e14052d80c273c05fe7facf28ed67703ad"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.315/url_launcher_ios.xcframework.zip",
            checksum: "33884e857639b8063b2095c7cb44706128171ef23c4dfdcc744160617699ccae"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.315/video_player_avfoundation.xcframework.zip",
            checksum: "23e106ef6048706e0cca35d801f303b76fb9780cc69a1b826d0e8b00d8adcf89"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.315/wakelock_plus.xcframework.zip",
            checksum: "c25d447b45a227ebfd40d334f8a48b4d57d90e4f5fe397b1f637aa83eb25a2bc"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.315/ZIPFoundation.xcframework.zip",
            checksum: "c6ac605495d74a06fcc72874851d5f71158f7b67f05f3b9700ab09249a54548a"
        )
    ]
)
