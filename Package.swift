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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.261.1/App.xcframework.zip",
            checksum: "da258409babbf74584ef4ccf1638c0b8e1183f599561403cf5288b18f7c6dcb1"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.261.1/Flutter.xcframework.zip",
            checksum: "c60e3c67dfda226ccfee708fef0f197079f8b892df936b04017a0b48aff2aef0"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.261.1/connectivity_plus.xcframework.zip",
            checksum: "6672519d94f55d47fe56d682b6725db211403990e4acf4632af1d313e909e3e5"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.261.1/device_info_plus.xcframework.zip",
            checksum: "6a10fbc96a6a2ccd3332da8a7106b9426e8a0f667b9a3c193f6e1a6b850a4329"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.261.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "fe0e35bf9ae5c810529b8c6d5f7703866ebf8c24628e13ea755a967c4083c05e"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.261.1/flutter_local_notifications.xcframework.zip",
            checksum: "40ffc6f558331af545a6b45e0a977974141b580e0163ac0daf70a45dece7f1a9"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.261.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "c8d69df48c37b9ea90ed0e793e2a6b68fa4c7bca2e86c9256e7471bdeb8ee588"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.261.1/flutter_secure_storage.xcframework.zip",
            checksum: "2a6cf48759e9a4c3fa6856c2b5f7b72a99ae945cbcc37caf3c1760b07e89adba"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.261.1/geolocator_apple.xcframework.zip",
            checksum: "f06893b6d22ea9ac4cb1300819c1b4bb10d9f31b99a35eefa4452d9db635d6d4"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.261.1/health.xcframework.zip",
            checksum: "a1dc3cd0916c559b16c3140ee76cb49b5e752b4cfc149bd90bc25c8c9b1053a1"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.261.1/image_cropper.xcframework.zip",
            checksum: "7e173622f48c44ec81c7cb024f4034a62692b6b97852ada02faaa532c15331c7"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.261.1/image_picker_ios.xcframework.zip",
            checksum: "788000dbb714f00d89621ea3439d3a16f9fef7c7ed011ba8334fbb6c751c82dd"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.261.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "2a96d2d8278ccb6396db1fc9b57289c16052375ce76b86df0c153c8900a1e785"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.261.1/MapboxCommon.xcframework.zip",
            checksum: "647adf4b913b3020e0bac5b71a43c0919acb93d9b93fa57fad3d97eb36f98c30"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.261.1/MapboxCoreMaps.xcframework.zip",
            checksum: "0b6992f66d78e90b351f8353c38c3062bca0f396908a23539bc71800e9be12b2"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.261.1/MapboxMaps.xcframework.zip",
            checksum: "7c8293e2ea3294cdb0af425b5f2b5a70814f2122a84047adce42d9418e1785fc"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.261.1/NordicDFU.xcframework.zip",
            checksum: "e556943d6e50043f0ee63be7791bdaf4882b9bbf0fdb3e76c12eb00f62a65af3"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.261.1/package_info_plus.xcframework.zip",
            checksum: "eb9ddb4046bd63e103d2f948ae53d1dc0f124cc39055c70a8ecf87584e3c0786"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.261.1/path_provider_foundation.xcframework.zip",
            checksum: "194564128f25565161d392a372b169b3ff52aac4fdeba13a295ab9efa7ec67bc"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.261.1/permission_handler_apple.xcframework.zip",
            checksum: "d72473a0df0572b8ef5005ba2d387a5e955082a5408fe737b6d03903bb274f8f"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.261.1/share_plus.xcframework.zip",
            checksum: "5f2f14d6c744b027c52a33b419a559f058b29248965e621683f458db22fd010e"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.261.1/shared_preferences_foundation.xcframework.zip",
            checksum: "c8f6cf499d02f80ffa153168a3f770e7baf998eb83eb782e0de6ba9af64266fa"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.261.1/sqflite_darwin.xcframework.zip",
            checksum: "fc81c340dfa1a10c4baa9c11a7d36e512fd0cd7ff143d77a444b3d7311aedcfc"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.261.1/TOCropViewController.xcframework.zip",
            checksum: "bdb9b859811f86ec524d501d27ad8fcd1888bb5c1b53543c5c646a343777a3fa"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.261.1/Turf.xcframework.zip",
            checksum: "e3dcc1eb865d38e0d18ecda9312d65f8ef3d0fbb7b925aedc357bbadab26c6ef"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.261.1/url_launcher_ios.xcframework.zip",
            checksum: "20da039e4a071fc6408c9afe33e9315a436c695bd04114b58b16585f32fd0a26"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.261.1/video_player_avfoundation.xcframework.zip",
            checksum: "fc8c69f8fbeb8728cba378878ae0b976dc50862af50a74415292dfed0ef8d95a"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.261.1/wakelock_plus.xcframework.zip",
            checksum: "bbb67fc3306b7bc826b6b65433adef8f7b25d595e9689d514f897cef7a8ff7bf"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.261.1/ZIPFoundation.xcframework.zip",
            checksum: "9d11fb902bc312a7cc1093e033e3c5e378d573c5365f9bc5428602ad03388f7e"
        )
    ]
)
