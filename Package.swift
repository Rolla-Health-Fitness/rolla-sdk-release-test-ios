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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.309/App.xcframework.zip",
            checksum: "757a4e3a5d1fe80fbb0677881ef2124c4f74afda8525111c1ba9a8f2d6ed4467"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.309/Flutter.xcframework.zip",
            checksum: "8003a76bb9557fab525968ca98564c6a376c2d9e3b50051d6bb6eb2a0d6390f9"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.309/connectivity_plus.xcframework.zip",
            checksum: "fcc448d2a5b24d0f859b54a14df5aa012bd50e2bd55d315145c7aea314901142"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.309/device_info_plus.xcframework.zip",
            checksum: "33df503e4e3906b98e22648e73b4b95b5fe46d8678c7cf294a8339c0a7b8c12e"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.309/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "c59069a0138539ba24a2d340e204032dbfd4db57de65035f4d720534ea670cba"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.309/flutter_local_notifications.xcframework.zip",
            checksum: "a79043eb1c61ac4899c8e009a8b35142ff364b9e782117a41d69f3a5b3cc968e"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.309/flutter_native_timezone_latest.xcframework.zip",
            checksum: "65a65f462625bca9547f5e488e1dbd3c26e1c3e3857e6a857e4ad5ad20576253"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.309/flutter_secure_storage.xcframework.zip",
            checksum: "c9fd95c3751f342d2a88a74778885d2ae3b825afcbafa953ec2012fe83b6773e"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.309/geolocator_apple.xcframework.zip",
            checksum: "ed55ddb1dd9f60de5fa68cb39a98ee62c2cf2c9d0498389c653c68ceaa4c57e7"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.309/health.xcframework.zip",
            checksum: "a2283de93c28f7470eb6e5f7d40a43969396b3c4247bafc20c19cb8dfd69f67d"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.309/image_cropper.xcframework.zip",
            checksum: "c7d406c4b103e2e9b4de411acb7b2c07b31f463bf3b05ce3d88a2114ff909288"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.309/image_picker_ios.xcframework.zip",
            checksum: "b43224b606bdda2b9841fd9fbfd0b6b6c92f47d9d57269938b949ae643427d8a"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.309/mapbox_maps_flutter.xcframework.zip",
            checksum: "40754135670f8955e0a745bc4785261644b41c238d3ae110f54d4d47f0782f1f"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.309/MapboxCommon.xcframework.zip",
            checksum: "a716ec75e99625db3aa8e6fce718ea887c15341a4b69e31429fab1b6eb0635fe"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.309/MapboxCoreMaps.xcframework.zip",
            checksum: "bc6e10a6f5b6590f8517516b3428e4441ebb2c2917bfe1e15b65fcfc3f6490ef"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.309/MapboxMaps.xcframework.zip",
            checksum: "7e7e3444a88e6b68019f23a0afb826f7017397d7806cf9055f72bbd6d27ca067"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.309/NordicDFU.xcframework.zip",
            checksum: "b8c6320a76ff765035d1e0cc09582578177a11806723c3e77ee0848338a193c4"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.309/package_info_plus.xcframework.zip",
            checksum: "3581c363005e04fa7047bc37eb7296b36d8513c041c755cfd577ce697877e746"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.309/path_provider_foundation.xcframework.zip",
            checksum: "906252e1029b537848c066f284e781e4e728bc6d7293b5e7e0454845c6e49d71"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.309/permission_handler_apple.xcframework.zip",
            checksum: "8476380361d0c46b398eba946501e1f8104093097e2f3ed36bf565a43c40a0e8"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.309/share_plus.xcframework.zip",
            checksum: "f0e312b34eaec1f8f762d31b3fd5e75aaa32123b9316a05c86784f59a4313b1e"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.309/shared_preferences_foundation.xcframework.zip",
            checksum: "352bc2f673ea19c4da911885499bcb5b4ee773850a9c6122e749887c195e2826"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.309/sqflite_darwin.xcframework.zip",
            checksum: "89cf3e9edace73e4b5bd7e94ba31717796a345a0224e6255ec480b5e452b44be"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.309/TOCropViewController.xcframework.zip",
            checksum: "27340706209823a138a9c6819489346150aa034a6574aeaae2c5365582daaaae"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.309/Turf.xcframework.zip",
            checksum: "96585848b532beabb88e4abacf141e88afc80506efae5072d6474d9c12fc0ec2"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.309/url_launcher_ios.xcframework.zip",
            checksum: "1bc27eec4d5b0cecd3ee54ceb2f105f507ba8a747595c0ef467a33c5c8938950"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.309/video_player_avfoundation.xcframework.zip",
            checksum: "cf805c2545c8d97401be4b5282f4daffe47a68494114eeb78ee1c1c6b5735dcc"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.309/wakelock_plus.xcframework.zip",
            checksum: "a48a8ee60570aeefab57130779bb2496982f7e340b766f094708d9110f67fdd9"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.309/ZIPFoundation.xcframework.zip",
            checksum: "910752e7e1bb6ae6803a3d260a9fae3fcd992c07f682a383b30db720c0b798dd"
        )
    ]
)
