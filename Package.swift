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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.281/App.xcframework.zip",
            checksum: "78b43f97feaae35d78cd607536c5474fa058db5285db859602a807eb5dd1e51c"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.281/Flutter.xcframework.zip",
            checksum: "46554b81d615e49bd0cdfca10ca098ceee04b79d6c8fb39f606e0f9134e4ea61"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.281/connectivity_plus.xcframework.zip",
            checksum: "1c49e7c3ea34abc9eac42c21d5b53d0d93e6abf88019c6644d1ea5ceaf4431ec"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.281/device_info_plus.xcframework.zip",
            checksum: "4f639c53efabeddda55841b6cd27be0c80c4f5e97277e7ff05ecf23d047ebd9b"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.281/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "ea14cbe01058aea94f374182c16f23c1918463d49b4f02dfcad1e5e576639bd3"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.281/flutter_local_notifications.xcframework.zip",
            checksum: "94dde73255dd6b5e4ea1df7b32ec05a5db19c8f4a69bf5b9d8308f3bfad6a279"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.281/flutter_native_timezone_latest.xcframework.zip",
            checksum: "244d2fe6a405ad10e4c5f3f416cb1c49555ed841c4a77b79fc0f7aae2938e98a"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.281/flutter_secure_storage.xcframework.zip",
            checksum: "3b3b96d35254c996efd88ab9a55bc5f8193f159cfd50f14272d18c23255c8bfd"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.281/geolocator_apple.xcframework.zip",
            checksum: "dd8e582baf187a53a3e45d80c38524871e887759d93edee7fda725edb227c21d"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.281/health.xcframework.zip",
            checksum: "9b8385e040dd1f8b2ffc6ccd5cfce671ce470db756e1dbbded27ae3aac36ade5"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.281/image_cropper.xcframework.zip",
            checksum: "4601cfd74bf796018fe4dd76a31a117a9ee8ad0aa224c12d75a61f405a7fd48f"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.281/image_picker_ios.xcframework.zip",
            checksum: "51a95bbfab91c6a8cb05fac0d994a4cd065556cf78df68070175322aadad3a47"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.281/mapbox_maps_flutter.xcframework.zip",
            checksum: "bd5bbf1719fbfabc78b3580e088553eee6fca4ada512992f2efd84774232757c"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.281/MapboxCommon.xcframework.zip",
            checksum: "8653b4524b439e15307646f4739172e37450e4bb099ac8d4b2b7ea74643bdffd"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.281/MapboxCoreMaps.xcframework.zip",
            checksum: "af450dd522abd643e882246d3f2d33331527cd8c23f214e51127eb686d4783ee"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.281/MapboxMaps.xcframework.zip",
            checksum: "b66668b990df914d6b007e6704ed8ecafb294dc5ea6589823fced71fb6f8184e"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.281/NordicDFU.xcframework.zip",
            checksum: "d0672f7b5a0bb087dedfee32a03645af2384b4ba5b22b143f3ed18535829bdfc"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.281/package_info_plus.xcframework.zip",
            checksum: "192aee7d56b894ed96c300dbe8f7229c1e09baf92f68de6c4e1369bf6812638b"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.281/path_provider_foundation.xcframework.zip",
            checksum: "e2cfbd3972225a49fc6f60a99f662c316c807fd418c0af788963da8d07f4217d"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.281/permission_handler_apple.xcframework.zip",
            checksum: "8e0846d0233c83e360a4bad4d2058a6b0eceb2e4add60c1d45cb2a31b5000f4b"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.281/share_plus.xcframework.zip",
            checksum: "46797eec2e86c2e56f4c32dcd933a98aa46bbe8b2329f643ed8bfe244330652c"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.281/shared_preferences_foundation.xcframework.zip",
            checksum: "95108b576c8335324c31f91ba4ece0a7447f3a6be1e768c8238b525975043d54"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.281/sqflite_darwin.xcframework.zip",
            checksum: "76b518ac0f1e39a64099b898e4923ab74e5d2539e1e300f548c105137e8e0028"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.281/TOCropViewController.xcframework.zip",
            checksum: "74359251e72a2485b0d12cfe6859c856842e1e6a343bbd2079202cc36294802a"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.281/Turf.xcframework.zip",
            checksum: "f2ee3534b626eb74d0f182a96d745c83d83c2a31357938de6b8042969934f4e2"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.281/url_launcher_ios.xcframework.zip",
            checksum: "65529d9adcb237cef3c188a5ced5b059bd7010b03e694874f037a14246047b30"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.281/video_player_avfoundation.xcframework.zip",
            checksum: "78f4b094ecfaf449f0ad2b7b0ebb81a15e1475ed0a1a90170a510e895069829a"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.281/wakelock_plus.xcframework.zip",
            checksum: "865135e07fbebb5e9a85f14d0ec6d00c92d0ce15a0b3db734f2577da3765513d"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.281/ZIPFoundation.xcframework.zip",
            checksum: "b0043f22ebdbb9fdd259cb9ed22e77af84484c97f1a9943f6244b3a93575b2cd"
        )
    ]
)
