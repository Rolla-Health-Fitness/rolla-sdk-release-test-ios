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
            dependencies: ["Flutter", "apple_health", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage_darwin", "geolocator_apple", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "FlutterPluginRegistrant",
            publicHeadersPath: "."
        ),

        // Swift wrapper API
        .target(
            name: "RollaSDK",
            dependencies: ["FlutterPluginRegistrant", "App", "Flutter", "apple_health", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage_darwin", "geolocator_apple", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "Sources"
        ),

        // Flutter module (Dart code compiled to native)
        .binaryTarget(
            name: "App",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/App.xcframework.zip",
            checksum: "60430db9356f2db967c6848709b128675885ebb8b80f5c86877df0ad3bef50f9"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/Flutter.xcframework.zip",
            checksum: "18e908988f5bbdf466b8d58fd4073fd77ec3ff3bf96aaa664301758671e7f94c"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/apple_health.xcframework.zip",
            checksum: "35da27c2bce975fca1cdbbd3077b7b769053ea4cd2df5a557c11254c8663cae9"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/connectivity_plus.xcframework.zip",
            checksum: "2629ee899443f8d5f6bf05b68c63d26018b1508add9241a795a3e57b2651ea55"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/device_info_plus.xcframework.zip",
            checksum: "44461079867e2eeada769fdafb4d0d58a0449e558492f4334383525bd8571d52"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "2995cd44c3587b3e63841343119db94953f38e0c1a8319a15392fcd999659649"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/flutter_local_notifications.xcframework.zip",
            checksum: "c4a55fb08fca81b750138d604f01f8919bf0cd6b19aaec5502ab9cef2921a329"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/flutter_native_timezone_latest.xcframework.zip",
            checksum: "65245e612a44b66426806e4f5e552e3c84db2c129b1d2b7f4a8cebb2115624b2"
        )
,
        // Flutter plugin: flutter_secure_storage_darwin
        .binaryTarget(
            name: "flutter_secure_storage_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/flutter_secure_storage_darwin.xcframework.zip",
            checksum: "3ece5b11d566b6b3206031f6f6282357a97ce0167345e06a69d62acea1361f3f"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/geolocator_apple.xcframework.zip",
            checksum: "a1a89ee7bad7ea35ea4a34ffe2bfea4201efdcdba91869443bac22464133d4c4"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/image_cropper.xcframework.zip",
            checksum: "38586f23e149ec971b714d9820751dec806ccdea071abc2259e37ea0ee6c6549"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/image_picker_ios.xcframework.zip",
            checksum: "446a2a30d9e860155a2f10dd6a9d8c5b34327b38481e3fa2645cc88d0f0f7164"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/mapbox_maps_flutter.xcframework.zip",
            checksum: "49ca8573707874d6157e7cddf88d67e45a86012c748f580104819705b6299a00"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/MapboxCommon.xcframework.zip",
            checksum: "b19eddcbe5e40f9d683726d20ac4c9b370df52d8b402a892cb9425db3015e093"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/MapboxCoreMaps.xcframework.zip",
            checksum: "2c1e85a6da332137f7707442697d428b81ca51424b98db83d00ffc5fd432d777"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/MapboxMaps.xcframework.zip",
            checksum: "127e82377a69a68fb04fb87bc6b494f95b87a865b71fd385d9c5fce6016c9e77"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/NordicDFU.xcframework.zip",
            checksum: "8bd60842a21c2c7f7b5faa3dceaaf9354b61132aaebbfaba5b4b8d5155f84f33"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/package_info_plus.xcframework.zip",
            checksum: "2d2f10e6a9ec232e9d71feb3891025e8d68fa4b114564d62bd6b1a61b8f1ed29"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/permission_handler_apple.xcframework.zip",
            checksum: "2cabefc5f5932afc858e87ef482824f5a325b9c31abf6ec9f85cd39830c747d3"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/share_plus.xcframework.zip",
            checksum: "5835ecd1b4c5f4983baf8a0d806f522760495715d10830ffc67f783be1f0fff8"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/shared_preferences_foundation.xcframework.zip",
            checksum: "3f512accc9b58d67a6a5a46baf965e3de673dfa0aa9c60cea03896d01b50ada3"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/sqflite_darwin.xcframework.zip",
            checksum: "b4c2dab51d55733f0e70b6feb44414c073d0623942036c1b7074023f10b0e93f"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/TOCropViewController.xcframework.zip",
            checksum: "525aad3224fab3c9446ce9141b4e3cc65afc5e920d5e8343d68c72965da3c608"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/Turf.xcframework.zip",
            checksum: "de1518182b72c8f34bcbb64dd0ff7e046c38693ebac812cada5fd488abf7ade4"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/url_launcher_ios.xcframework.zip",
            checksum: "13774a5f8471a470675b2bf3cd29e7c225cfc41f6c02691174487ad2c73ef7dc"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/video_player_avfoundation.xcframework.zip",
            checksum: "b5250d5b5e5835da0d0877c48c78a11539c95f41947c460746623b1266765c36"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/wakelock_plus.xcframework.zip",
            checksum: "9ebc3b789af8c760e175edaa6c534d596b91cc7a9928a2f1f8b9fff9a12b9a58"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/ZIPFoundation.xcframework.zip",
            checksum: "bbe8df956ec312372c9a8cdd07ad3b7445b2ca2bc2ed2688e16c0f248d886665"
        )
    ]
)
