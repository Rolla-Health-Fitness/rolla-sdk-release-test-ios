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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/App.xcframework.zip",
            checksum: "321f1848e2b0d6fc77564ceef40665312cc22bf8d06dd82257ef748be3e84d2f"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/Flutter.xcframework.zip",
            checksum: "c78b4eaea82978a0a57d7f80516883b68d381a2e86998d716c8c94335852f1e2"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/apple_health.xcframework.zip",
            checksum: "ce935894c7b31e759b1e205a601a7de0d69ae09590d0507f8eb99e4eb99f38ec"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/connectivity_plus.xcframework.zip",
            checksum: "268a1e1572ba2da37edcd394f44c641fdffcdf32b068578380ba514141e8aa6f"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/device_info_plus.xcframework.zip",
            checksum: "dbe37da3732c1f36f9ab078a850cd9d4ace2bbe5ca7cf79149e6e59149070b31"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "1db6e1860651f4988b4edf343bf65f1dcdcbb84cd8f9f8030f3ce0f3d2d2c387"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/flutter_local_notifications.xcframework.zip",
            checksum: "68fce08a1e95243ea631e924a26b104cbcf81abc607df7345d907df7578ad472"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/flutter_native_timezone_latest.xcframework.zip",
            checksum: "7bfbff8a66a8f311b94e8b9741eaea6bd53bd7b7afd1dc0dceb4b8db126de70a"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/flutter_secure_storage.xcframework.zip",
            checksum: "55da5a4c36d435c6c8c03d484a84d6ac0bf6d85feda0a3fc6c077ef17c6c2029"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/geolocator_apple.xcframework.zip",
            checksum: "58c2697c0ba96aaf406860fc751777dd70f9333ded184e6fd4e81a35418fb55f"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/image_cropper.xcframework.zip",
            checksum: "da43386683301eeb80ef1b5e6caedd65f16eed480c9e1d3628c61f3d583687bd"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/image_picker_ios.xcframework.zip",
            checksum: "45c5f55c55eb3c2c51104d500b31cd7a4fd2901eb41e23de68f480899f701a96"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/mapbox_maps_flutter.xcframework.zip",
            checksum: "958c312e1a16a33c37b1ed6e53ffa9ee6e41a54aa7700f855e3b97f0061b0ba5"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/MapboxCommon.xcframework.zip",
            checksum: "cc6a634ad5e86827f3b4c9aa01414ac7b7b0c98c8bc17abec68d00595aa223a7"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/MapboxCoreMaps.xcframework.zip",
            checksum: "2d0e6b94286db35b98b84bf1e7d782c33f677a719635aeb59eb3847ff706a766"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/MapboxMaps.xcframework.zip",
            checksum: "f7f70bc99032ef9af6792f9d45611e819db354202318de754d37ba4ee5727ef3"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/NordicDFU.xcframework.zip",
            checksum: "508146c963b97c9d04ce926f2ebb53e686fa0fdbdb23baac72101fbd9af0a721"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/package_info_plus.xcframework.zip",
            checksum: "0def622308549f13e58fcdcf7c72836904293d9c897efe6da1d578bb219562d8"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/path_provider_foundation.xcframework.zip",
            checksum: "be2155eb43bfb52e592fd41bfc62c5c363fc85d3fb4fc5ac24cc27dd17255063"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/permission_handler_apple.xcframework.zip",
            checksum: "2c91676b6761ee6fa51d54eeaa1f2cfbad7da5f20a8e6512b79d75f269b72798"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/share_plus.xcframework.zip",
            checksum: "6cdf6605d420c8b8c8ecd2e24de1a862cc8bc4d7f55bbc9b2dd1b486ba4b35bc"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/shared_preferences_foundation.xcframework.zip",
            checksum: "eb2dfb52571c501749502fcdce73fc2fc90855224fdf4ffe11a6fdfb623ad77b"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/sqflite_darwin.xcframework.zip",
            checksum: "c4c49844b5029010d298db94a37398cce60eaef68be48eb44c9cd5aea90a2075"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/TOCropViewController.xcframework.zip",
            checksum: "1ee01295c48fefe2e7664ce9543242de688ae5a3b00f0afbde9778a04ab3684e"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/Turf.xcframework.zip",
            checksum: "802e5811e92d1cabd4c82f5dc63597e4f8f13c20908075f741092046fc95f241"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/url_launcher_ios.xcframework.zip",
            checksum: "aa2d9599795c782f6d0dfb58c35703149453e84f21c2eca588c64f84a3ab85e5"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/video_player_avfoundation.xcframework.zip",
            checksum: "cf6b9ff374df9b8d9457d249b519322d05e27263009ab390ce5db4ffa125df72"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/wakelock_plus.xcframework.zip",
            checksum: "7df8be4555bb792478638ac00c81588fc0688d3ec211e4ba9639800b676aa4fe"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/ZIPFoundation.xcframework.zip",
            checksum: "d491218a4724e21a9563814482f4be6af1a43872adecedaede5bbc54c15a7827"
        )
    ]
)
