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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.244.1/App.xcframework.zip",
            checksum: "4003ba50b861d85fa6b5d39d6c772cc8d2a3c02ef6070a1315b6d061573dd5e3"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.244.1/Flutter.xcframework.zip",
            checksum: "543667c6776d57246d1cd80a342000d26d9785fed83676cf04b9d9e08cf59c36"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.244.1/apple_health.xcframework.zip",
            checksum: "379bf5f07aa2be507946c3416211020f95a9971bd9d1734192d4b6d027024d0a"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.244.1/connectivity_plus.xcframework.zip",
            checksum: "7cecfe7faa4a82e162fab6f7f4c6f9ce2c97a04a74a46a1b8b2da699936271c5"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.244.1/device_info_plus.xcframework.zip",
            checksum: "c041f1a70e22a40fa5d8da0526aa5c32374a6154478c964f0efe80fc0edebc87"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.244.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "79cfc7021fdc6b2ad8e9831e48b3b99a7503c4af726b9d8eb670c30068646510"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.244.1/flutter_local_notifications.xcframework.zip",
            checksum: "26e1665d1b712ff1a9911b42d44bea010409834e129ebef5fa81d8aaaba8ac7c"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.244.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "656e8ee1fc4f8baac8af08424c27149f9ba3fb1929d48a8c4e5d975505953380"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.244.1/flutter_secure_storage.xcframework.zip",
            checksum: "62db81135ce75060ac2d1dc40838f53565a0ee00131d0b494931b872e1f4d5df"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.244.1/geolocator_apple.xcframework.zip",
            checksum: "b46b974ca2573d671e1fef0457ec198dce6a4e79347912533e446b94eee2b380"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.244.1/health.xcframework.zip",
            checksum: "af8a0982769d419ca7356a4e08c1548e9d2ce2a00bf0cb89a7d104f343a900ab"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.244.1/image_cropper.xcframework.zip",
            checksum: "454d6377f6c9de36e682c166905d2f1c06190fb9a30d69cba3debb6ec124b764"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.244.1/image_picker_ios.xcframework.zip",
            checksum: "ab81ee076a48e1c916e30df9cf93b507c8335ac14faed81da8d65e8a614a43c9"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.244.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "22c6b543b80cf9af857f75388ca6ddc7d9a4b036385e330c03244f495400d14d"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.244.1/MapboxCommon.xcframework.zip",
            checksum: "03bc2193a5b2b2c64795a50d73a1d48e3720c625db48fb871a73e29c1e242b96"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.244.1/MapboxCoreMaps.xcframework.zip",
            checksum: "40fc223063526ab1b67273c0ae5adebf89d44082c20c1698838a4ffc70cb0d5e"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.244.1/MapboxMaps.xcframework.zip",
            checksum: "d0227218266563386281da93cb597c0d02c1fc735e2d5a7c981cd6eeb4a8cad4"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.244.1/NordicDFU.xcframework.zip",
            checksum: "3d607e2fe6dc3eb256f1deb1bff41edd0a7ea81d9070b09ebe1177852f76fbc6"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.244.1/package_info_plus.xcframework.zip",
            checksum: "d730a8ec9f234f8f6126135ae2e5931656dac3f31768c6d5c0b8035168a2bb93"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.244.1/path_provider_foundation.xcframework.zip",
            checksum: "95e8ce0fc86a3b8e740a5151984b1d01d088d19db3104ef918e6726757696b74"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.244.1/permission_handler_apple.xcframework.zip",
            checksum: "20d30f2c4752ff39454284b65bb48146f303a1561303325a964a6e6c321f13ca"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.244.1/share_plus.xcframework.zip",
            checksum: "37c4982b67f85ba3f3de4d38f4727875ad391edde2722a960a8f5110c1341075"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.244.1/shared_preferences_foundation.xcframework.zip",
            checksum: "d4b3937feff981394a45337a2cfc7f323420c8de143e5e54fdf079ee8b464980"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.244.1/sqflite_darwin.xcframework.zip",
            checksum: "2d9a7f4534bf88cda8093d75e554dd26942731fee5ecd4948357a561b2a371a6"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.244.1/TOCropViewController.xcframework.zip",
            checksum: "975990a690497133dc935f4b2cb61ce4eb64a5d659d73a1a772f8cfcd4ca9041"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.244.1/Turf.xcframework.zip",
            checksum: "590020ec5393835b940b882a7cfb7312b1f83b3d82a7f4afb29a6e11f2ee068b"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.244.1/url_launcher_ios.xcframework.zip",
            checksum: "9154c33ad9d28f13f75122762b28b5a72d5db7f8cc42d63cc733bb2b9f7bce33"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.244.1/video_player_avfoundation.xcframework.zip",
            checksum: "05280026345091f7184be31b15eee5c899492fac3fd41f27e151b0ce3404282f"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.244.1/wakelock_plus.xcframework.zip",
            checksum: "692afea358cd34d46a7d31dc0b3135b7c38fc9028bb4e29e60eead1321a208d1"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.244.1/ZIPFoundation.xcframework.zip",
            checksum: "adb946f25314190f75596c0201cd51afaf1234caea1db510ba40d8d99e0c5f34"
        )
    ]
)
