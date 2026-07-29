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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.319/App.xcframework.zip",
            checksum: "386563011ebc889e28ef67ca00363a406fb1665db7ac167dc511b16816c82b16"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.319/Flutter.xcframework.zip",
            checksum: "c496060c04759683cd2565fedf7b113c9177f115fcbed0a24e86d80866f2b782"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.319/connectivity_plus.xcframework.zip",
            checksum: "445b5cbe177cd7a7cfd2cc5892198c5a582d45d76c3eba48ab2eff883e72b4f0"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.319/device_info_plus.xcframework.zip",
            checksum: "b058ed0e870e696c7e3259e06c02adc76d3c51202e5a797a787874821a464bf3"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.319/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "db66f532dcef8b8ca2a9186b67bcc71a6278534a7ab47a42dc0ab6821a86a0a0"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.319/flutter_local_notifications.xcframework.zip",
            checksum: "6acea6a1457f786899267275d19b09416d7d18000537da7810f3beaf26d81ef3"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.319/flutter_native_timezone_latest.xcframework.zip",
            checksum: "1bef5e1e536370f0cd64ef8e57f792f5afb1e3c0fc21a15e1ac46b2155318465"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.319/flutter_secure_storage.xcframework.zip",
            checksum: "ea3992072333f159b295b9a23e5164ee5aaf29cc07363fbe5322cd70a590a3da"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.319/geolocator_apple.xcframework.zip",
            checksum: "d8376cf9db19cdfd502c93d2b011995383afd9ce5e772fd3b3b0a8f5885c12cf"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.319/health.xcframework.zip",
            checksum: "a87a258296f0ac4eabdfe6704d8fb8b4ce6dd6f747e06bd5194515c8c77684e9"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.319/image_cropper.xcframework.zip",
            checksum: "f098bef54877c36ed255b3ad4c3b1e2a405806b5b6f9bc034d45167a13035b82"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.319/image_picker_ios.xcframework.zip",
            checksum: "0bfd612ef2e4096b7f78b09b9a3d0529fa3e76b9df2e649e2a9cc752ba371e55"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.319/mapbox_maps_flutter.xcframework.zip",
            checksum: "52e6796a4a4a328a35ee6c7374f67b037a025e7b0c3979aa2194dfbcc220de34"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.319/MapboxCommon.xcframework.zip",
            checksum: "ae932ebbee8c7575bb0050b1b2c53f8a330ce70841c29cf2a1ddbe143572fe58"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.319/MapboxCoreMaps.xcframework.zip",
            checksum: "6bf1ab81e5481e6c7834ddf0e9be4909f5053e09d24f6735172ee8b372561319"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.319/MapboxMaps.xcframework.zip",
            checksum: "fd7b5a489f00f93cd601d584de84e44ba110a7ab7525e577faeb1bc206044686"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.319/NordicDFU.xcframework.zip",
            checksum: "802cc521a7337ede129a10da1278e44a229c8f2f7ff3e22fb1efe8a1a9990430"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.319/package_info_plus.xcframework.zip",
            checksum: "bacfad38602e00d19cf137337d568d2c7671f3106c2e2a98b375321d3effaf65"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.319/path_provider_foundation.xcframework.zip",
            checksum: "056d4ff834db8e9a66faaca2dbd978286f222e43298cd31b1a119529108d9aec"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.319/permission_handler_apple.xcframework.zip",
            checksum: "66a52b6e1b6749137c2985996d26bc240faff71a10656cc89f49eaddce06455c"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.319/share_plus.xcframework.zip",
            checksum: "2dc943494909983a48d2701600f78f1b1fe00eee67609b72b387d62ae8e69cc0"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.319/shared_preferences_foundation.xcframework.zip",
            checksum: "f29e7c79b036e1c29975aa0cb20e8ec557b579f3a922bd833a6297e5d3b1ccdd"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.319/sqflite_darwin.xcframework.zip",
            checksum: "91142342a8823508be306c7636c8412142269a1858730a9c5b04f3c0b23c00b2"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.319/TOCropViewController.xcframework.zip",
            checksum: "9bb9faeb1057ae7765f84b829b02d0408d1d04503dbd95308cb9610bf61d96b6"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.319/Turf.xcframework.zip",
            checksum: "3bd474cd3dd1fb8ee463cb5564dce2411922ff87077952e75bf567702ab1cc32"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.319/url_launcher_ios.xcframework.zip",
            checksum: "22fc302acffccfc6c4cef6c7b7134c808bbe8c6d1110fd3524e3422ce6d475b0"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.319/video_player_avfoundation.xcframework.zip",
            checksum: "6e6d86d23eeb2b9433167f13deb834aae650e8add805f754094e48bd9663bf79"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.319/wakelock_plus.xcframework.zip",
            checksum: "f2b60457a105726197eac07e6aea9c3397f7d151cc0a58f7e482308276c24e60"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.319/ZIPFoundation.xcframework.zip",
            checksum: "17444812075acf6e29d9fad7454315912719bae1f34fdd66f8cf0865574b1c24"
        )
    ]
)
