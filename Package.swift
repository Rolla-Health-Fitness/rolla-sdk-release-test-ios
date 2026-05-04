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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/App.xcframework.zip",
            checksum: "551dd6f066e135ad7e057c39f5b4335f4ea0a728a211fba75f595d9d2f757804"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/Flutter.xcframework.zip",
            checksum: "e561add677b760976b76e511725615ad350d4f150b9081cdd37168c53e1197c8"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/apple_health.xcframework.zip",
            checksum: "1f5d13faa49b6c679579e714c8b9641dde55aabc538decf977d0c9be78aaf288"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/connectivity_plus.xcframework.zip",
            checksum: "7fed0e31354e0d2d737f359bf0b0e5fa257340f7ed7c66825bd66d37c168eab8"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/device_info_plus.xcframework.zip",
            checksum: "a377190b2977b3f0ddc1893d32548ddbf44ba73d365a2a48adc1fc54c68a0987"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "abae30d1df6a0d289233ab31930eebfb5a022d4c88e4eca63247fb0d1cf31e18"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/flutter_local_notifications.xcframework.zip",
            checksum: "946f02f0ce3ab32ce64fc00f9fdf53ce52420d2f842bbbcaec67ca663139441d"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/flutter_native_timezone_latest.xcframework.zip",
            checksum: "a7bc5ddcddf5e1acd4d21f07dc605938df62f7722d64627815d1d6f326b467ea"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/flutter_secure_storage.xcframework.zip",
            checksum: "92964d9fba77164bc93acbb5f3523553d00eb8125067a5be04965f6dd3f3434d"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/geolocator_apple.xcframework.zip",
            checksum: "9fc14a208d9b238193c81cbf9707c0062109bdd4027406d704bed01dfa19cd1f"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/health.xcframework.zip",
            checksum: "519ba56256e79892c0dccba73ea18cb25bde4397964984d94ee5ee04295d9acf"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/image_cropper.xcframework.zip",
            checksum: "0187703609ff3a6ef0c8d926c501c5d49a668d60d2bccde74f0faedcdb36abce"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/image_picker_ios.xcframework.zip",
            checksum: "111c5806fa1a6c5717f0b826b4f6d7bcd0a2742d8fa76b0de4c34bc35cd52110"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/mapbox_maps_flutter.xcframework.zip",
            checksum: "766e9a72ecc01c4ec327294f856d292bfc763b8a1795351b74cc082ee6dcf89b"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/MapboxCommon.xcframework.zip",
            checksum: "c5b8ef0ae715be233bf2c74f3cd5eab532f63e0e47db5ae08ac96079f44e3f77"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/MapboxCoreMaps.xcframework.zip",
            checksum: "69b5d7beed4bc4b87e4c48ae34091d230deb37ee87c1ff594c698a60c6ec048b"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/MapboxMaps.xcframework.zip",
            checksum: "0cc423d9efae295baabd67d9841ccb57d091b2060ee9d70d5a3f46fc01a569a1"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/NordicDFU.xcframework.zip",
            checksum: "c87c338fa0466a4586a44163d4e28d2e366705ad798b8413c0a9ca72be1f4fab"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/package_info_plus.xcframework.zip",
            checksum: "2bb707dfedced54a74618c91d1d2f79d12a95f5939aefe3faab769b361855bf5"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/path_provider_foundation.xcframework.zip",
            checksum: "b9c0e210b5f4c0d36f70a99cfaca49dddeecbc48aa19bc03ae05b0976a7e702c"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/permission_handler_apple.xcframework.zip",
            checksum: "396d6dca751d37dda71fc77ec2ee8b8a0c60a23f8c803851a9aa600f443ed747"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/share_plus.xcframework.zip",
            checksum: "032cb3ef1954e62545fc9ac57715751cee920f9eebd2c296fb2a6cb63a81b4a6"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/shared_preferences_foundation.xcframework.zip",
            checksum: "0beabd089a04fbcbeef7c8a56d7c08154cd1c7c72674fc39f21c9ac02bf52d8b"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/sqflite_darwin.xcframework.zip",
            checksum: "734e0c7a3d3ca4741a51eac215a0aa35583a0f64f4eb377d48885ad606071466"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/TOCropViewController.xcframework.zip",
            checksum: "395b53a8f03dc199c9aca98c6327d16d47bb9185efee029a2641fa29c16ed7bf"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/Turf.xcframework.zip",
            checksum: "a10838b079159113c13478abb130fd7a4f509230c7c95b7ff379d960c9460025"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/url_launcher_ios.xcframework.zip",
            checksum: "2b52c1287aeb90938d373ce85ff7cf3614dc77c1cef556aa9001fc6dde289da2"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/video_player_avfoundation.xcframework.zip",
            checksum: "0c9301700c8db1fddba051052602873d023340aa7421238249c32ddd308c8b57"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/wakelock_plus.xcframework.zip",
            checksum: "c4954a9f45288679d0c5dd26e987512ab73f57bf1808b3c0b0ce853b43f56bf1"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/ZIPFoundation.xcframework.zip",
            checksum: "78ad3f53c3a93c357ae77ce5ced9f190900f4b548c08f875488e5a1d6b99ab5a"
        )
    ]
)
