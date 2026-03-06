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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test/App.xcframework.zip",
            checksum: "a973eae424c5616baf00b590d8fc91d00eeb19c4e8b359e680ae3f77254ef511"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test/Flutter.xcframework.zip",
            checksum: "3400a6ba9a7ebb527cfcac0219c5f2a8bd42bc49c2597db9d4cf4fc034f10ddc"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test/apple_health.xcframework.zip",
            checksum: "a05375391fdfcd4b5bbeafdf2c295ee9aedbf89f1983ab71f15c543373d89803"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test/connectivity_plus.xcframework.zip",
            checksum: "ba69e122a229abbc38cfe3d44fd8073bba8e366154824229abbd712752e1d65d"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test/device_info_plus.xcframework.zip",
            checksum: "48443efe428b680e213511facfeb08fc9b345a106f93b9b84584f26f47564164"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "483a2b67f78eba25027a5e3880b2c39b8e8d865a365159809305d1d468adc34f"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test/flutter_local_notifications.xcframework.zip",
            checksum: "a6623eff1b48ba45f3c09e385ba27f2c37cd5ff67ff1317a9b72a7f582c9ca73"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test/flutter_native_timezone_latest.xcframework.zip",
            checksum: "ed57f8178b786243b66c11c11073ba390085c910af9037acc09c766c644cbce9"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test/flutter_secure_storage.xcframework.zip",
            checksum: "87f20b43627e963813e2acb558d01e888420ff92534307067744e84eb8a085b5"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test/geolocator_apple.xcframework.zip",
            checksum: "ba9c1cd8f5154d8552cd099070273e5a77f158064a3977b6d8d4b7eb8a149a04"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test/image_cropper.xcframework.zip",
            checksum: "c4e95445f5b03b9f4f1309c18e7c67d897a23a9e6c977883cb856ec7ae658a51"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test/image_picker_ios.xcframework.zip",
            checksum: "30dab0f41dc95aabc2028f295c3b66e1de93a0debce4b4a2ba5439777ff2510b"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test/mapbox_maps_flutter.xcframework.zip",
            checksum: "dba7cb24ee5fb6c6b161ff8da2c9e0985b7665854bd44837747a538075372321"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test/MapboxCommon.xcframework.zip",
            checksum: "4abbadbca99853c1ecb84ccfb1b819b786dfa5a24c820bd019ebee775d42ea21"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test/MapboxCoreMaps.xcframework.zip",
            checksum: "1f0c80c3fe7fc1bb015fc2868d80f89236a47b21326b91bcd0a16784100bdf34"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test/MapboxMaps.xcframework.zip",
            checksum: "748f9bb0c0926c0ea8212cbfdb8a148533d132db2e4e67da9425b257877d9824"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test/NordicDFU.xcframework.zip",
            checksum: "ebde93210788eda9cad306b29377c10731205324fcd84315e45368f2d0037ac1"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test/package_info_plus.xcframework.zip",
            checksum: "53418456f44d7682cb9335c16774ee28d916901735fb20c6994fe544cf32360e"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test/path_provider_foundation.xcframework.zip",
            checksum: "762f3f89989bcf49d51a57e4172630a847c7b7860ad8da83a9a69dc4b0a83371"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test/permission_handler_apple.xcframework.zip",
            checksum: "2f8bb35c30b13292f03323304c4fe0a00a7eb1c7f1b7e7162b0d6453ae9201a6"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test/share_plus.xcframework.zip",
            checksum: "69dd223d175212e87d7fda3b857abb2a5519f97d7225f0929cf5425ca38b72a1"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test/shared_preferences_foundation.xcframework.zip",
            checksum: "961c3838e7228fd74b52af720169a9dbb91a98f3858922bf952c010e0a6ff2d8"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test/sqflite_darwin.xcframework.zip",
            checksum: "41eec9907acf63738f44ba9f8838069eff89d88442edf723794a175928359ce1"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test/TOCropViewController.xcframework.zip",
            checksum: "a20543f0ea9d56791b5c37c4f7d16266fc19e1bffe9cf15a42d15222eb972221"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test/Turf.xcframework.zip",
            checksum: "feb9085a6fc4f76de5eb399803bff28e77f794ec10dbc2c5e6d03a7d04eafc99"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test/url_launcher_ios.xcframework.zip",
            checksum: "09df9ca758e2e8bbd0f1d649bdc6c091308f43c53878287e20f03c315d44ca25"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test/video_player_avfoundation.xcframework.zip",
            checksum: "f96b38530dc683d99c860f3bd4b5c757848b444a36205bacc74e19f8acce3397"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test/wakelock_plus.xcframework.zip",
            checksum: "bf560c227996905fe541e2d4835eae0c32236676f1dbc777207edeb784c15e61"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test/ZIPFoundation.xcframework.zip",
            checksum: "4b79977ab895a29e03088ce64405b9065e7296d743a2b4e1643031a40b94a38d"
        )
    ]
)
