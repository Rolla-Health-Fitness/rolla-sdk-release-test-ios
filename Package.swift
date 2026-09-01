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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.35-test.344/App.xcframework.zip",
            checksum: "1a80d341d0705d46ae357c4884cf2def4688b76b0bde5bc0d310a56c9ee187b2"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.35-test.344/Flutter.xcframework.zip",
            checksum: "0aba0dc2c33db76c13c679badfdf96a9ca207da01541ce713e1cb62b8a6342bd"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.35-test.344/connectivity_plus.xcframework.zip",
            checksum: "a3c3f555ffecef4b89c2b53e3156063776fee8f3cbe7503cb51ced9afc63387b"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.35-test.344/device_info_plus.xcframework.zip",
            checksum: "bb44a8e1079627b3cf02501512d8ffef37bb503a10f6643877fc4fb1bef9709d"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.35-test.344/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "30da36d85a5cc4cd5fed440d2e032e37628dcaa2217a8207976daf780fe606eb"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.35-test.344/flutter_local_notifications.xcframework.zip",
            checksum: "92e46f056922eccc7cfae02f7fa8a50d31f5dbaa81809035f7d5a0f624f64c9b"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.35-test.344/flutter_native_timezone_latest.xcframework.zip",
            checksum: "6fa70e331574d535001b644e08ca29bd0aa6871e22e36a2e8c87a2af3e4ab902"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.35-test.344/flutter_secure_storage.xcframework.zip",
            checksum: "0d5f3566bdd1a37c0b817268fd9ae611fe3c04201f24657fb031789270ebe889"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.35-test.344/geolocator_apple.xcframework.zip",
            checksum: "59261e5cd8c7d6f0fbd87356b52d2d27a31fc391f8b32de1c60668ec061fb7e7"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.35-test.344/health.xcframework.zip",
            checksum: "06b6d25046b6d11ffa30e1c629930e88c2adf58f94fbc46c51dfefe73ed55809"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.35-test.344/image_cropper.xcframework.zip",
            checksum: "d6e3f2ae7f4d8996061a3907e3ade871ad15e4fab2d72f1512ede013686dce44"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.35-test.344/image_picker_ios.xcframework.zip",
            checksum: "98f26bf82ad4dd314e3ef05efea3608b27f3e529b13b8a70ecaae0884acc9b29"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.35-test.344/mapbox_maps_flutter.xcframework.zip",
            checksum: "bd17b16f355aad39a16386a5c42cde0536d4f6b391900906fb356c2cfe054f65"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.35-test.344/MapboxCommon.xcframework.zip",
            checksum: "9a45fec91b6d42d5bca1fde848e826988720826942a714a42b770fd72eaab70f"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.35-test.344/MapboxCoreMaps.xcframework.zip",
            checksum: "381cd1d7fa1d07c5fd99e096c0603134ac53b0c5ad9bf71e59858594db616572"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.35-test.344/MapboxMaps.xcframework.zip",
            checksum: "0c9348d70d91ae2deb0175aca64b757c56738fb48c917b8d28c35910df1432da"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.35-test.344/NordicDFU.xcframework.zip",
            checksum: "53a02234741e04b483c3de823a18ab49c1f33452a476c0bbbfcb948dbbc70193"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.35-test.344/package_info_plus.xcframework.zip",
            checksum: "4599cdad0f100353696115565d9a9f534e76136c3bb83523aacf377d9683237c"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.35-test.344/path_provider_foundation.xcframework.zip",
            checksum: "a14f6c7118c083306047c76c065b9fe1d78abe181d18ef41080d513d43d2471d"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.35-test.344/permission_handler_apple.xcframework.zip",
            checksum: "cb2982b5be53e06c5a345a5cc83d854cc5ea9f5303cf5a9c0c3d549324e0ad73"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.35-test.344/share_plus.xcframework.zip",
            checksum: "325ff8a728cb885c01a134f3cb29f2080bef966178291477c861c6f88e496947"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.35-test.344/shared_preferences_foundation.xcframework.zip",
            checksum: "e47cdf76360705ac7c9ec911e987f8158acc3448cdc4306953e7cc46f068034e"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.35-test.344/sqflite_darwin.xcframework.zip",
            checksum: "c59fd9206377b82313b9b49dae1579958e0b74fe9801ff3d49321601d991bb6d"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.35-test.344/TOCropViewController.xcframework.zip",
            checksum: "ba37b7540c4796a18c3c9eec9bd0cc7df78c246e1e4680ce9930ccebc09d4dca"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.35-test.344/Turf.xcframework.zip",
            checksum: "1ace7a72986e39c50c96a4a077a98b291dc056456f84a5a134f52958e84994cd"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.35-test.344/url_launcher_ios.xcframework.zip",
            checksum: "606c5277d698250bc459b06e91afaaf4b64d5d0d81d70767e9e3e3281cb05457"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.35-test.344/video_player_avfoundation.xcframework.zip",
            checksum: "9f62fd001bc79e437cca6718ce18b64eb4ba71f73e7ace811d9b1b4a64adc506"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.35-test.344/wakelock_plus.xcframework.zip",
            checksum: "616ea74de91e80f13e4eaf9c930a3b0cfaecf154cf37da52803fe728f3d37886"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.35-test.344/ZIPFoundation.xcframework.zip",
            checksum: "a1345df05c88bad97c5805493b02f10198aeb3137dba1e01d13422051391fb27"
        )
    ]
)
