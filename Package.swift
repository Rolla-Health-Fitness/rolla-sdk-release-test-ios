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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.331/App.xcframework.zip",
            checksum: "9b89e95edf450ad1ebfacef7ef45dafc53e69648cb1f3655c018f254d4775a73"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.331/Flutter.xcframework.zip",
            checksum: "713f9266ed9642919f289ebe8e8b5556b42a21074673c3f6d312838fc393f7d7"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.331/connectivity_plus.xcframework.zip",
            checksum: "f5ee73ccdd94b1811ed2f13f7bb6d7f433f5555ed8cb2d24ebdc8f660d7a93ad"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.331/device_info_plus.xcframework.zip",
            checksum: "8d903e365388e96571f56f67b06d8e749391fa2a8ae24c4f240ab851265b6fe8"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.331/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "ee60ce34c771abbaf24e4e9cecd49139cded287256801130d3f973227e497bdb"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.331/flutter_local_notifications.xcframework.zip",
            checksum: "6cd80534fe76429f650800494c1b5ff77d06f0f0e6d168d7ff2ac7aa2fea3617"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.331/flutter_native_timezone_latest.xcframework.zip",
            checksum: "33444120a709909baf3dad4e2eb5cd04827ceb3756d73d4ec54c83a4b8daa80c"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.331/flutter_secure_storage.xcframework.zip",
            checksum: "0650f402b9b3f3a41f13ddb744cbdd39d768e03f1c88814d5aedb8aa7f3404b7"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.331/geolocator_apple.xcframework.zip",
            checksum: "8e583bafa75f92d601a0da2129caeadaa30ccc1dd813a3e325a810eb554caa01"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.331/health.xcframework.zip",
            checksum: "1d9f79d3d6256515979b3c5d5ecec5df8abd2399f0158ce21e27b80ccbc4f739"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.331/image_cropper.xcframework.zip",
            checksum: "9d457779b5767ae942eef1f95835635cf01d791bf62d96b52b47fad2c718197f"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.331/image_picker_ios.xcframework.zip",
            checksum: "c2141d262b236bd83d313e9873145215ba7272e0473f74ddc6bfebf21eaa1f97"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.331/mapbox_maps_flutter.xcframework.zip",
            checksum: "de1fb960f4de363555c095d6f4c171662e978f034187e2efaec88ee5770ef3c3"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.331/MapboxCommon.xcframework.zip",
            checksum: "6490ecc150b612125e05e5ddd57a40088430010871301fe007252dc9e81c98ad"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.331/MapboxCoreMaps.xcframework.zip",
            checksum: "8c8ed2e532ae5fa056b652d1eeb4d5d2fd47110da117deeffee9587b585509df"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.331/MapboxMaps.xcframework.zip",
            checksum: "0b7ed869a62f3451bca7c2db9ab05af51f135d5965555981a52cf08fafb9eae3"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.331/NordicDFU.xcframework.zip",
            checksum: "c1d97f53a39bafec57d4e9a1ff97706e04834663bdbc20012930d19090f299dc"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.331/package_info_plus.xcframework.zip",
            checksum: "9d5f022d1eaf9227efe9a25b6296b85aebdeb8178fcc1fef6fc0191565939a96"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.331/path_provider_foundation.xcframework.zip",
            checksum: "84336265176a51413c52220fb493bd8975ae68aaba49b7a29aca9b2792554fa0"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.331/permission_handler_apple.xcframework.zip",
            checksum: "22322ec3330fb22a681f6b0dce56464ba6efcf92d8fbef643f584a3b6ddcd9df"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.331/share_plus.xcframework.zip",
            checksum: "80afb21f274adb5a6c6074675081d0c60f08743c0b2e791df585a58e0b51c2a5"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.331/shared_preferences_foundation.xcframework.zip",
            checksum: "be54db6aa957daf5f5e1f97da3bc2fe99a67b8fa66fe0b0ab3dd34408ed99230"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.331/sqflite_darwin.xcframework.zip",
            checksum: "3c58baac7a8decba2b52e46c3c4070a3df315418d98648b58dd4404daffbbc3b"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.331/TOCropViewController.xcframework.zip",
            checksum: "2053e824d2af6f3ac387791c8d97afa421f62c5053eff3bca0f72a983bde4d4e"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.331/Turf.xcframework.zip",
            checksum: "d55152a5535778a54b2d9f0af57b81dddb522a2e81a082708347a4d10fa5a041"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.331/url_launcher_ios.xcframework.zip",
            checksum: "6024f231aaf65ac65ba530a40cce83c24abc2c044a4b64ea82954a332cee0a98"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.331/video_player_avfoundation.xcframework.zip",
            checksum: "7810b9a6e5eb2279248a41ed248444ba0a36b2958bb2acc8b7435b6c74a3ac07"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.331/wakelock_plus.xcframework.zip",
            checksum: "95a6b05e21134832f710ff8827dbddc4fa5ab034cd41ed9f4b5ccb1040a1c710"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.331/ZIPFoundation.xcframework.zip",
            checksum: "515c4aaeb5e8f87c49e126af4b06463ac484eef7376056380276dba3eb773989"
        )
    ]
)
