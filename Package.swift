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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test.235.1/App.xcframework.zip",
            checksum: "c4770b04cb294da43ff34ccf4f94cc8ead2d788b770768de3b1dfab656296817"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test.235.1/Flutter.xcframework.zip",
            checksum: "82defb7d444d042ba780aad96ed8b7284a8341f9d87ca5f7131173d196ff1371"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test.235.1/apple_health.xcframework.zip",
            checksum: "e857a504c0ba27c28648afde1a8177c973efa58696373613b9ed98a795d93762"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test.235.1/connectivity_plus.xcframework.zip",
            checksum: "f6aa31f4f6bd331378c3c60645bee09ba37b12eeabd8c0ba5ba8b652e72a9912"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test.235.1/device_info_plus.xcframework.zip",
            checksum: "9c9c59be6cdee9fe2e7b76950c3834e5d923b3f08136b46874fd21a35e32e7ab"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test.235.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "2a785bb86620da7d88a175e09bca3ca20b028db35069a3fd77423937f2f884ac"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test.235.1/flutter_local_notifications.xcframework.zip",
            checksum: "ceabe069df59304b61628c4c446eabd22fe87c0868ca47c02c78bcc07b54e818"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test.235.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "4ec98b21540595440e9eab846551daeb24bbf327b8531aafca874aecf456dccc"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test.235.1/flutter_secure_storage.xcframework.zip",
            checksum: "3d3b24ddceeebd54abdf6a7d8a4886ba9e1739cbafc0e522e712dfc645052849"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test.235.1/geolocator_apple.xcframework.zip",
            checksum: "1b67d3bfdad34f3bf9be34db940ee4107da5c466ddcf12c44bbf25fe4d5aea96"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test.235.1/health.xcframework.zip",
            checksum: "1e443a103c8081a95b31b059df63280181e57be40cc590256692eeb5d9ab1597"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test.235.1/image_cropper.xcframework.zip",
            checksum: "03b189f80082f04bb42ae03a416d46850d3ca1235b2aae69682b3b23062e8587"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test.235.1/image_picker_ios.xcframework.zip",
            checksum: "40a4b5b0a2d803553ebce1a80d39a929f8920fddec99bdec2af564737480c0b4"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test.235.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "7fd5e5b8ba81f4f87ebccfb3b19b20964643e7204a11490fb73a0cb2b4678e96"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test.235.1/MapboxCommon.xcframework.zip",
            checksum: "b972051bff171aa3da27dc8e4ec8a0150021589833ea17042e7ae2a40a4d285e"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test.235.1/MapboxCoreMaps.xcframework.zip",
            checksum: "f122714250bab0e95288842fc41d2984b46d19e70575ce972da0dfe8a1a747da"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test.235.1/MapboxMaps.xcframework.zip",
            checksum: "fee6c076d0310ccba3180f9f84dcae420598b91e2763b525cc7e87ea4b2179b6"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test.235.1/NordicDFU.xcframework.zip",
            checksum: "da8343d809c6905f39f11c6b9db5907248a8f679a4b598aa581106512d5320d0"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test.235.1/package_info_plus.xcframework.zip",
            checksum: "a5f083f9c8db5e445163f30e4ce45201ece91296b3fcc33306b090970a892453"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test.235.1/path_provider_foundation.xcframework.zip",
            checksum: "026ee3babf5ea691a568e7bbb66c400ba7d84f3e3efeadafdbb00fe9fa8ab825"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test.235.1/permission_handler_apple.xcframework.zip",
            checksum: "881c14293ef460666bf5f8cda30e1c4ba2aa907474832ec3a481b5ab9691efd8"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test.235.1/share_plus.xcframework.zip",
            checksum: "54362cef67a7a8844b5a9e601fd34c8603f62bea2ca50d43d862c68332f4772d"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test.235.1/shared_preferences_foundation.xcframework.zip",
            checksum: "6fa96191f09fbb4cf389492baf37cb5c94670beb4ba9e0c485f316225fcf8e92"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test.235.1/sqflite_darwin.xcframework.zip",
            checksum: "fa58ac41b8cd742ce8e978338101c9ffefe0d23b43793e1011d15b25b11354c7"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test.235.1/TOCropViewController.xcframework.zip",
            checksum: "8d3f63c1fbe75d694df8352616e173adbc5983f7b4b4e1d8ddc31dec43f5892c"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test.235.1/Turf.xcframework.zip",
            checksum: "31f5c8f2b1914556fe7f608d7a8ae79f1cb22690cf9b1d387f488991fb027353"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test.235.1/url_launcher_ios.xcframework.zip",
            checksum: "8f7cb1fb6c9e33702d008df6e73ae843c4bbef0fd6145c31638431f1e1a91d72"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test.235.1/video_player_avfoundation.xcframework.zip",
            checksum: "c54bbd5e7aa019cfc03368304effbd7be7975f66fe3813b6818f8982d92a9c31"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test.235.1/wakelock_plus.xcframework.zip",
            checksum: "7a2f267e4e342242a1a389adc3668c0b938678f8fd4874ad01fbc57b7d7142c8"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.10-test.235.1/ZIPFoundation.xcframework.zip",
            checksum: "cc9b8c1fcc4796d720e561aa1b93c4034b40f880745dce71d3ca2bbfbf56e362"
        )
    ]
)
