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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.332/App.xcframework.zip",
            checksum: "92466273706ea17b1807e4054becb0b28ed096b9b6a33131eff15e973f5015ae"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.332/Flutter.xcframework.zip",
            checksum: "63cb599dcdba600111f888bc131027d425eca62281657277f104256cdd12ea67"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.332/connectivity_plus.xcframework.zip",
            checksum: "f95be202a0d1f9f5c83d21ec1c020214b62370792560d7332f07cb090a01f59b"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.332/device_info_plus.xcframework.zip",
            checksum: "23577639dad27d9f37d4e9c358ead92e242929a7dda5d6b69e5ac1980b4716aa"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.332/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "5964bcc92f1fd4b8af821897df55d1b63a3d300d731a493eb89f2f37eff6f4fe"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.332/flutter_local_notifications.xcframework.zip",
            checksum: "39ddcc603a666e3224e1bea2ba17ca5f0898eef9a2bd6fd268c405bf56707686"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.332/flutter_native_timezone_latest.xcframework.zip",
            checksum: "9f97d2a14359e718481b7adecd7d3d27fad0c2c8c8ddd2c79fa27ebd89b9da6c"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.332/flutter_secure_storage.xcframework.zip",
            checksum: "6bad43c37ea7afa160d3607d64040592b1668ec44860cd0673a40c64b4c801f6"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.332/geolocator_apple.xcframework.zip",
            checksum: "8992c606631ec5499e8fccafb5d292b6c6c8c0c826d02f2c165b49cffed4195d"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.332/health.xcframework.zip",
            checksum: "86dc967e25013f85884de6f2ede8f29a0a9ba1c4b747bfb2e5fe1b5103caaf49"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.332/image_cropper.xcframework.zip",
            checksum: "7d5c94d96cdda9c7fd64e23a082a324aff6318d156c13974728c08307e728a86"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.332/image_picker_ios.xcframework.zip",
            checksum: "0f2d1de690bd7a5874f19de97191d9307b82d7039649bb8fa817c102531232d6"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.332/mapbox_maps_flutter.xcframework.zip",
            checksum: "5072d1d7d3645f3c4b389560bcf661058e25994aa77de0b123e3e2b38f3341e5"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.332/MapboxCommon.xcframework.zip",
            checksum: "98ab721d6edb869a5f09b20cef370dba832f18ef2e96804c25c06a21ba8c49c7"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.332/MapboxCoreMaps.xcframework.zip",
            checksum: "d9e1f8fd7bf2eed3b2ab29a2b67eca2e509e4aa0949c567ec2303c7331c6a6ee"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.332/MapboxMaps.xcframework.zip",
            checksum: "c8b8555612d9a3815fa9bebad86a6d73e42546fecad65505eab9030a02b41b25"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.332/NordicDFU.xcframework.zip",
            checksum: "224f2c40c68995d02f51cac41e40ba9f8eff8bedf8804d263930cde7317fbfc1"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.332/package_info_plus.xcframework.zip",
            checksum: "7487cd812767d8c837c01591fcaf4cc4b35fa5a5a18995f904421e5bb4374712"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.332/path_provider_foundation.xcframework.zip",
            checksum: "d6da7c58b1894c50fe27882f066fd84244882de454bab3583a3abf1506d2e61f"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.332/permission_handler_apple.xcframework.zip",
            checksum: "3cc7b5fff0c73adcfbb2cde525899ad62e9d0ea3c66e87774cb3bfac2f1de8c6"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.332/share_plus.xcframework.zip",
            checksum: "710540730c47ad14448c050a80a8dae6056272dd731adc27eb2f76e869b7b691"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.332/shared_preferences_foundation.xcframework.zip",
            checksum: "49121441f6af42164f6d0c1e5baa3274fd02064f9a6ab825dcd9d4c46f4d3d41"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.332/sqflite_darwin.xcframework.zip",
            checksum: "c8a81964f336e656fb54fb6199d5a0be7cf8649441954d71315ea922d29b1a34"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.332/TOCropViewController.xcframework.zip",
            checksum: "d7026f5874887ab83959e2f6c7184c5a77e02ea4f37c2aed76bf0047658eb8f6"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.332/Turf.xcframework.zip",
            checksum: "47c806440c6e206c0c24a712a9b8460cf6747c0633ab82f06083146a610d8b55"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.332/url_launcher_ios.xcframework.zip",
            checksum: "f025e2aabb7500f152b39f9a5e95048d49d4038cd29409c09eae9aaf01996e4b"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.332/video_player_avfoundation.xcframework.zip",
            checksum: "765d92835a0447257b47759c44a7654a4e9c64e096e5f66d855b01a0eb299d6a"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.332/wakelock_plus.xcframework.zip",
            checksum: "59b1a371273cd9e4556a8c01792001378d5b748af1a86f07e7907cdf4263eec0"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.332/ZIPFoundation.xcframework.zip",
            checksum: "a2e9359c1dea9f9681e7961a431e4c524e8059d4415ddd5e21a98a68ce2525dc"
        )
    ]
)
