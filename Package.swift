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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test/App.xcframework.zip",
            checksum: "52ad115c425d390182dff44babe7e2f1140a72df80d551f3aed0cb570942f72b"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test/Flutter.xcframework.zip",
            checksum: "cd435d3ece4535c9746f4dc9e1a5173404ffcda38ea305fdaa3ee6001db79e90"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test/apple_health.xcframework.zip",
            checksum: "df608c620c61df7261f750c4f014b46f832fc1096ed1dfba20e2f951fa977bb6"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test/connectivity_plus.xcframework.zip",
            checksum: "85e695757fbcd889642566fc3bfa2756e71ea788134e5ad675df11f401e1ab3c"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test/device_info_plus.xcframework.zip",
            checksum: "f0b0d4ab655fd12fb75cf30f617a1d1bb6523a2344e4cd5fe16e6d69495f4d89"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "7a179e2320f6f43b81b834beba76a13674e9244c4c4205a9af6d86b3fa592f5b"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test/flutter_local_notifications.xcframework.zip",
            checksum: "fde8ce45ed841ad423163f16764d74b35929272f0969e451b3b802cdd11ef1e0"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test/flutter_native_timezone_latest.xcframework.zip",
            checksum: "75938486d1bb12a2d405ff38eea0c5c49d44f0409617bc3388bd20e21a7963f7"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test/flutter_secure_storage.xcframework.zip",
            checksum: "86e8aaab8b8fb90a36d257872b9b64f2e746820944fd1410c2273ae70b893cdf"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test/geolocator_apple.xcframework.zip",
            checksum: "c8200beab754c38431247aa7388deee6946a36450b386e016fa3372c0ddf272d"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test/image_cropper.xcframework.zip",
            checksum: "b0bddbb348de55a6b3457c384ecb6a880cb6680cc2279d7cccb015362b338280"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test/image_picker_ios.xcframework.zip",
            checksum: "80d3bc0f3a3d2162121d7f4e7103574f31a931cf8bc4f081f9c803d1339b934f"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test/mapbox_maps_flutter.xcframework.zip",
            checksum: "dc06eda8a2e8cd78fc41255aced2e94fa1ad5bf772b419b6c26552760a7dddd6"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test/MapboxCommon.xcframework.zip",
            checksum: "e2d45ee4bf81d320aa5c3b1861de19a00e5e3312031a2f68984992e2316873b3"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test/MapboxCoreMaps.xcframework.zip",
            checksum: "bf4498c2392d0c79c7f5561ffd9fd738bfe9592b5afe16cc2034c86765dd2f39"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test/MapboxMaps.xcframework.zip",
            checksum: "288366b68851f48f48e6d2be0e9238701a60ea32af8729fa1fe18637986227b9"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test/NordicDFU.xcframework.zip",
            checksum: "f14bd4a2502712660dcaef3ba19c7f9d53976793d2d5581c3e20fecad3b6a487"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test/package_info_plus.xcframework.zip",
            checksum: "9b3138106cf4b57ecef09680573ac53743a889b5308699b66d72debc9860ec0c"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test/path_provider_foundation.xcframework.zip",
            checksum: "ea2b0f5c4353b656f8df9d24fd57f57f026fd2e59a35f78e4365e2213386cac9"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test/permission_handler_apple.xcframework.zip",
            checksum: "204ebfa0961e9f2f028c44f60e878e885f895add87a257950d798a6faea542ac"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test/share_plus.xcframework.zip",
            checksum: "857f0149af1d3936fdce9e9ffed3833372b3d8592f3af4f9ac2bdd924f9e794c"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test/shared_preferences_foundation.xcframework.zip",
            checksum: "83f541ccca190a2b5594b8e329baea6900f3ea1a3eac902eac165edbda8a6772"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test/sqflite_darwin.xcframework.zip",
            checksum: "ad5311bf3c49260aad36b74a84f5482b3c3ce7bcbd956d65edf40ac77c5a5b7d"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test/TOCropViewController.xcframework.zip",
            checksum: "138bb59b7522820713794f9d0a89a874439e75a51bf3a79bd003d3086b28a699"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test/Turf.xcframework.zip",
            checksum: "ae2568b649dcfa476370ce6718f9a04357f0b0b38d0ab9c9c6478abc1e19fec3"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test/url_launcher_ios.xcframework.zip",
            checksum: "652c78f71dc2a27f1f82c5498a83df56f4a463be07ca22f3ccaa3b7ec520f822"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test/video_player_avfoundation.xcframework.zip",
            checksum: "e6c221bddd6e0e5e70759c91238aa76582e9366fe85aebbe565611918d8532d4"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test/wakelock_plus.xcframework.zip",
            checksum: "b1d8b9b4494317730b4ef4b3e9abc450c86507351bfce8b797ffa3cb8b36ed0e"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test/ZIPFoundation.xcframework.zip",
            checksum: "371e27acf343283e9d34e103ddeec37337c0fc7a93eb1410e670ba8bc8194819"
        )
    ]
)
