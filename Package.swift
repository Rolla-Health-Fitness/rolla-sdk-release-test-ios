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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/App.xcframework.zip",
            checksum: "1ad2ce240e9b5dc533cf1f1761eaafa433b8d83cfef8a771e8440fc19f96092d"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/Flutter.xcframework.zip",
            checksum: "db7aac77b5c34620bdbe4eeb2a459cd8578e26adde329c8762e55e26b89d3571"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/apple_health.xcframework.zip",
            checksum: "c229b424aca0c69801e60682fa50ca7300861751a30b821556e7df65faf4fdfb"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/connectivity_plus.xcframework.zip",
            checksum: "33b2cda0a18594f456d98081416be705f03e354c59cd7e0a975595061756607f"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/device_info_plus.xcframework.zip",
            checksum: "a0bef71c6bf2e7ba904ad02e7f69ef6268629dd6a75f7c38c81d1d87faffdef8"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "1c168f950af531c76fe841919410e008439c10e0ce698bfc3b5239f64202a37e"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/flutter_local_notifications.xcframework.zip",
            checksum: "658fe08198909013e381259c9bebf08efa92a530ab4e48690efba3ad52063248"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/flutter_native_timezone_latest.xcframework.zip",
            checksum: "85a385f8e867d2b69c44fbed0cab0ab97ce23d14a6fbef044de84338cbf7f8a7"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/flutter_secure_storage.xcframework.zip",
            checksum: "cbedddfab822ccebe43c2d88f97756e9e690759520f9ad736ab9b1747bb04fb9"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/geolocator_apple.xcframework.zip",
            checksum: "8c0991c9547031afeb0b31ad5a09884661daba781a487f9ee2f139c20e71ed0e"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/image_cropper.xcframework.zip",
            checksum: "43a89bbf68c3888dee0398abfa1c8f2a81c3fe45d21c1089a197bc22aad9a529"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/image_picker_ios.xcframework.zip",
            checksum: "e3ed2bc8fb076afcd5a47c45694ad69e4deebbac09420f948a3fe59e7d4e1e18"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/mapbox_maps_flutter.xcframework.zip",
            checksum: "ededa79ebc0eb34db8e8939a645ec9ede9c36915b51be29ba6df2fd382571fa7"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/MapboxCommon.xcframework.zip",
            checksum: "2a1fdcf9092b28e2a7361d6b9c9e4684a3e118a03945a47ef93ddf0ed988d1c6"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/MapboxCoreMaps.xcframework.zip",
            checksum: "6e03c1f8b76678efc40bf5cb88606161ae0787b5b7fdea59d10e92fd72b43b1d"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/MapboxMaps.xcframework.zip",
            checksum: "68d87cf13e861bba97a21a044df5073bfbbb78b779df8cfe72185c9553b0ce90"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/NordicDFU.xcframework.zip",
            checksum: "b8c91f5cc766f6d53765fb9f0418b09bfa1ccf411b16dffad199340cb47388e8"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/package_info_plus.xcframework.zip",
            checksum: "a1739657dfb397c67379072cd8b88aff2991e1ca87f9c7cc9982cb99d2a8b6aa"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/path_provider_foundation.xcframework.zip",
            checksum: "18a323917b6ecdea3a155bbaddcbc730aaa3e6dd9de544444a9376f0f414cbb0"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/permission_handler_apple.xcframework.zip",
            checksum: "44e23542c9662e4c48eb1d3055933bdea756c5104eebeb14e7868bf4e3db0625"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/share_plus.xcframework.zip",
            checksum: "a6cdbcd34161ff69eebbce223a911d543060d8713d86490ab4be576332b2cc33"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/shared_preferences_foundation.xcframework.zip",
            checksum: "c3760632020b18b061207ec15152ccda5616e92613ac77eb7904787dc055dc6c"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/sqflite_darwin.xcframework.zip",
            checksum: "e38ec89ab91a93c4854198175ee0cdae79013832ae30e4f03e208deffdc96d2d"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/TOCropViewController.xcframework.zip",
            checksum: "ae209b93a9fd21302c95526cb6026d729c3aa09db969c95fe93551fdbd244e96"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/Turf.xcframework.zip",
            checksum: "4fbbf23d564e626fd6711c7f56d57c4d14d88724e2360317e408991e28f61c5a"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/url_launcher_ios.xcframework.zip",
            checksum: "e1d1e931444fc2881437481fb03397231ae8cf56af6f3121ecc9e9495a20e88d"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/video_player_avfoundation.xcframework.zip",
            checksum: "4361fd0a16b39629504661ee80daca911a7e54545c4a5243930eec174daf7860"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/wakelock_plus.xcframework.zip",
            checksum: "78a33e25dbf18d2b243798063c3a25d7fe26fbe1f0393ef9bb8ee1e0a9ea4977"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/ZIPFoundation.xcframework.zip",
            checksum: "6426554d22055ea9681570decb22876f7bd10323c6a9a6b208866a28c4f56a4b"
        )
    ]
)
