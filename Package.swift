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
            dependencies: ["Flutter", "camera_avfoundation", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "flutter_web_auth_2", "geolocator_apple", "health", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "FlutterPluginRegistrant",
            publicHeadersPath: "."
        ),

        // Swift wrapper API
        .target(
            name: "RollaSDK",
            dependencies: ["FlutterPluginRegistrant", "App", "Flutter", "camera_avfoundation", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "flutter_web_auth_2", "geolocator_apple", "health", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "Sources"
        ),

        // Flutter module (Dart code compiled to native)
        .binaryTarget(
            name: "App",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.55-test.366/App.xcframework.zip",
            checksum: "84b42776e792e6e18590a6feecf85c1061370d7d67b02e5c8bf6f7827b0bab6f"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.55-test.366/Flutter.xcframework.zip",
            checksum: "982e1c94b2832d7c339ee19edbc3e84ec2bfc71470040821335c3e9e2b9817de"
        )
,
        // Flutter plugin: camera_avfoundation
        .binaryTarget(
            name: "camera_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.55-test.366/camera_avfoundation.xcframework.zip",
            checksum: "0dd2031a2c09595b4341a4475797026cbbc3e581208d568aed87a72459ffa72b"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.55-test.366/connectivity_plus.xcframework.zip",
            checksum: "89baed521bd7292e7677c6ff3c53348b1cf5e5e44afac2564e7818f4fc8588d9"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.55-test.366/device_info_plus.xcframework.zip",
            checksum: "959a52dee7784c36b2fc3fae7996df5ab7b70f917a13dd140357c5194430657a"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.55-test.366/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "07cbce9f67d2a71bdba812a4521618a063c1d811b8d22951159bfa355eaf4a30"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.55-test.366/flutter_local_notifications.xcframework.zip",
            checksum: "03a307a80fdd52c132961783016929c1d4e958d86fc6d3f384fd887d5d8ff56c"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.55-test.366/flutter_native_timezone_latest.xcframework.zip",
            checksum: "40c81693f26247fff6e24613e7d1a7f262d8194ffc10ba4499737400ac76d468"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.55-test.366/flutter_secure_storage.xcframework.zip",
            checksum: "0e498212e25593714da9e76b54888d94f1f73588b9e59886335b4db7e076128e"
        )
,
        // Flutter plugin: flutter_web_auth_2
        .binaryTarget(
            name: "flutter_web_auth_2",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.55-test.366/flutter_web_auth_2.xcframework.zip",
            checksum: "a8d49179c07ed9a8ae926004ffc78054255a189813a8e92a0101bba84f8b5d19"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.55-test.366/geolocator_apple.xcframework.zip",
            checksum: "30d43d420de8c99406597de69db148e7645d1e3b85865667048606b5d438895d"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.55-test.366/health.xcframework.zip",
            checksum: "4a8819e98481c190e9af9daed5dd1d374dbd8e8d0a6d9511d3f9db799e3b5cf0"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.55-test.366/image_cropper.xcframework.zip",
            checksum: "28768f570db8b618e17abd52feea115faa6ce8dea127000321c42bab1114269c"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.55-test.366/image_picker_ios.xcframework.zip",
            checksum: "3dafba91644735acd2a6b7334583250bb4c2b6ce12ffe27233ed1c983356ea40"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.55-test.366/mapbox_maps_flutter.xcframework.zip",
            checksum: "f4e30553fff0e8e1f8c35a570c8a4d0e4d49521f9b4a976c56d56cc331aa8f37"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.55-test.366/MapboxCommon.xcframework.zip",
            checksum: "511df30b4fc6aedc9c5e811953483bc4018b2626cfad515125d093a60576d801"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.55-test.366/MapboxCoreMaps.xcframework.zip",
            checksum: "3af74b338d033b4cf3a303fb9e0951b79d0c591e6fe762f33faec0db577f3d49"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.55-test.366/MapboxMaps.xcframework.zip",
            checksum: "e5b80030b92b2876620a5ad66a1a43e8ba0af8c5de8f2aa1c7239a8b382bf20b"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.55-test.366/NordicDFU.xcframework.zip",
            checksum: "6c23304ff21221d257d24851130aff17672316a8fdf32c097d0226bf9db0fb23"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.55-test.366/package_info_plus.xcframework.zip",
            checksum: "f4583b04bc17e5e23754ab3d9f821d51b5152a31dd6dfba15e04ae52040864ce"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.55-test.366/path_provider_foundation.xcframework.zip",
            checksum: "351058336634a561c977667af8c64efa257e8262249480a10d9d2e9930c5ba5e"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.55-test.366/permission_handler_apple.xcframework.zip",
            checksum: "88679b53f9fd0bc4544aadfd8a0747cb86fa4f39dcb016cd8faffc3bf3729f6c"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.55-test.366/share_plus.xcframework.zip",
            checksum: "9ba309162874872347171bc904bc80f389b3b023eec25acedbd5d93478c38bd4"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.55-test.366/shared_preferences_foundation.xcframework.zip",
            checksum: "a3eeecf2ee2595b39c754c5eb961f5a8c7c2065aea9a8f13741fec0a6b8324f4"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.55-test.366/sqflite_darwin.xcframework.zip",
            checksum: "2fe051780c7a545f7ff99ccc703a4b2d300e161ab79d7fc0270e2d06d28f2067"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.55-test.366/TOCropViewController.xcframework.zip",
            checksum: "acfbfabc32f0d78ac17dc2c866c1b9c39d030acd985689a9091c53ee89ee87cb"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.55-test.366/Turf.xcframework.zip",
            checksum: "150204ba36c66dadd1029145b282fbf24e732aa1c0e9bd2a91f46b937bc22cc4"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.55-test.366/url_launcher_ios.xcframework.zip",
            checksum: "6f3dd2e1915b17979efc8d5f0f520a0156c5ecf3b8670fa74c2e6537b1441647"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.55-test.366/video_player_avfoundation.xcframework.zip",
            checksum: "2d6f64587d36f39dedbb42f9acad1cef1253617ac7b2f4d1d8decc88f6693bfb"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.55-test.366/wakelock_plus.xcframework.zip",
            checksum: "314a136861562433727f12abe8a44bd771f6730fa4c70c05abfb5c9199a70b0f"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.55-test.366/ZIPFoundation.xcframework.zip",
            checksum: "bf71c58a6601b68c6c2bae56be84348334f59ed4dd20fd3d8503c597ef8412a1"
        )
    ]
)
