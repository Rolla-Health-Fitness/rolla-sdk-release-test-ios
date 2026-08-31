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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.34-test.343/App.xcframework.zip",
            checksum: "217cf5b769a05ffec55f828287484f1d0ae4559607628ba0e0a3793e1e07f188"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.34-test.343/Flutter.xcframework.zip",
            checksum: "163e7f84fb7d3ca3805f9a955497bdf2e19a6e572d65a20f8ad1888bee917dce"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.34-test.343/connectivity_plus.xcframework.zip",
            checksum: "c64be5976f71367727adebe1df51b9bd052461c04a57048ad60cb790c0d99acc"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.34-test.343/device_info_plus.xcframework.zip",
            checksum: "9b9f0f396364f99595e14f07ff493e6d314450a3f101d7a3d6b1dea9c22e3907"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.34-test.343/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "6c2e556a32b66adad69f539924d07fead6c2fc468f053dc4ddd1a95c8b44bd12"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.34-test.343/flutter_local_notifications.xcframework.zip",
            checksum: "678bc77a2ef320fc355bf808b250e311992b6bea8a3f2a91b67f0484a325b313"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.34-test.343/flutter_native_timezone_latest.xcframework.zip",
            checksum: "8671a737b68fee157f441c05776913f8a0af076f50f33669036f98fdeb5a3258"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.34-test.343/flutter_secure_storage.xcframework.zip",
            checksum: "d172bd9a86576af5f60b84364f5b638ec24ae30327cdc6f8588c9d127affabac"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.34-test.343/geolocator_apple.xcframework.zip",
            checksum: "6acd9d91bfc5e46c0c919456e2a85b66b7b475a94dfe2950c959412929a1cdbc"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.34-test.343/health.xcframework.zip",
            checksum: "52bdf404b4f1424566f66431acb959f1931c69561ac7130bd14a3ae47108d4ed"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.34-test.343/image_cropper.xcframework.zip",
            checksum: "c529b0a725bc50acd5c3b62f86640bd6507055600d00092c6dc77a8f748ae5c0"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.34-test.343/image_picker_ios.xcframework.zip",
            checksum: "df879b0196a3bc1d6327b4fc69e70880abf1a413d4fe543a8f7e34ed74a8c9e8"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.34-test.343/mapbox_maps_flutter.xcframework.zip",
            checksum: "05e9e84156be6f2e79ed6e277c6021d44e8b1f151134282034c56fdfd3561b9d"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.34-test.343/MapboxCommon.xcframework.zip",
            checksum: "98d8c704556344e5dad40acf3dccaacfc31a583c3fcbda08e3ae9b1c98b4f24e"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.34-test.343/MapboxCoreMaps.xcframework.zip",
            checksum: "bdf26c038f01bd8cca5749170299ff838467c69b44f4b57cc4378590072e38b4"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.34-test.343/MapboxMaps.xcframework.zip",
            checksum: "6fcec18501b746646f1dfed6f81713755f0518da067bf6f140905ed7ea76b940"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.34-test.343/NordicDFU.xcframework.zip",
            checksum: "6805ed1ce005de4a2ac2f3db66cff3490eb8299f29f1ec27c23945f22879cfcc"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.34-test.343/package_info_plus.xcframework.zip",
            checksum: "325fc8e2321614bd0a25c3dcbe7d0c6bb9465ea1f447e4497978c11014ebaa9c"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.34-test.343/path_provider_foundation.xcframework.zip",
            checksum: "9421588bc804b729a4773aed37c63e40189e27fcda1e833febc1a637fc185ea1"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.34-test.343/permission_handler_apple.xcframework.zip",
            checksum: "e4da5e984edee535d52e7649e12ea5c47cb5c1ed056dc544c103b6a501ba605b"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.34-test.343/share_plus.xcframework.zip",
            checksum: "f611a32b6a9915892a5b40e4e05392ba7b8f1934e5a4ff0474debb400c8ef84e"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.34-test.343/shared_preferences_foundation.xcframework.zip",
            checksum: "b1fbfce597cbd0dd439ac1069731ec9689fa7bda84413046be71eba7bfcaa9b0"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.34-test.343/sqflite_darwin.xcframework.zip",
            checksum: "e1ca1b4977b76779ce8dffdca7df30e81f5408724855f1f59b7033d7b2d70766"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.34-test.343/TOCropViewController.xcframework.zip",
            checksum: "b953f9bccc5a4220dc9de8b4ce478dd7b61223ea301632b0ccdefcbdfc7f119a"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.34-test.343/Turf.xcframework.zip",
            checksum: "86b0cf84aa863500117df6a0fb08dab7a994a53d03205acce8995dbc4f02a30f"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.34-test.343/url_launcher_ios.xcframework.zip",
            checksum: "775d776d24ec60ce496301b82fe87c79e3450e47077b7677fab0ea68a6107227"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.34-test.343/video_player_avfoundation.xcframework.zip",
            checksum: "416566e2e003e0590180efda2d7429af41790a6c7ebe5257c0a4fe56eaf279ce"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.34-test.343/wakelock_plus.xcframework.zip",
            checksum: "218ff55e460fc846d2359cd873b99c54c9bcce4ad7bcbf27872fb77777100792"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.34-test.343/ZIPFoundation.xcframework.zip",
            checksum: "5d44cee8d8f0f0274b7085c7508101daae8bc962d85caea93e61a4ee6ca3c564"
        )
    ]
)
