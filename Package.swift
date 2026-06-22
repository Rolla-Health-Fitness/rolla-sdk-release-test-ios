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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.267.1/App.xcframework.zip",
            checksum: "f714d7aed438d8c6d38cb2a54828c2f092bede764be51d4490edddef5aa84305"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.267.1/Flutter.xcframework.zip",
            checksum: "411c640d7b5d79f5a5510f49d773a33488af414e9ba0f96b64c690c256194bcd"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.267.1/connectivity_plus.xcframework.zip",
            checksum: "5ca83fa1cd6ea0b99a427401c13be85e077ea7dcc09cde61b323ff240f396e04"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.267.1/device_info_plus.xcframework.zip",
            checksum: "0a2818dc472e935f86c94d7c85f14fd3337135d41a419e63f92ead1fdafcea16"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.267.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "a8e245174dd15a42ad1d5956b6d4b67cca97190dd542fbce1b634f2269a130b0"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.267.1/flutter_local_notifications.xcframework.zip",
            checksum: "089867d186a3a3a71827f0dc1f2d55011b8e00e383490de5167b2c6e8890880e"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.267.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "e4ed8ccb345be3f9456fb47888426eb10bc21169c85192b0929ae29ced5bd13c"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.267.1/flutter_secure_storage.xcframework.zip",
            checksum: "d8c7b78d438964de7374c40b9c5a036ee66766230b3fc96d210fb8fa65fa1fb1"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.267.1/geolocator_apple.xcframework.zip",
            checksum: "7a4337d9e7f0248a417ebd89c9f73ccb6ae4cec69b1e07b2140b77b5889fc486"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.267.1/health.xcframework.zip",
            checksum: "ff8c726bfd9462da0bb3ecef79056c5745ba7a46309cde6cd5559fddacc00d04"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.267.1/image_cropper.xcframework.zip",
            checksum: "cd40e7302814488c5cd2b65596b5e52e89b08328372cf8c73b8886d0a9fdf291"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.267.1/image_picker_ios.xcframework.zip",
            checksum: "4b669cf87cc3bfc2daf38e2c20dfb2188afe67a42fb748ba8f9e92e67d09b14e"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.267.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "7cec9d295bb8e473e2a285d72f45183dec12a324bda609fd6b79a6f88dc251a0"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.267.1/MapboxCommon.xcframework.zip",
            checksum: "66ff9ee5a1592328c12bd2bd1bf14239c2020ecd5ab8140f03067f1ad3a9c689"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.267.1/MapboxCoreMaps.xcframework.zip",
            checksum: "90c8942f784c76af7ef3e9d34c1afe95717ddf2e043f4fb0c8db8b812730b446"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.267.1/MapboxMaps.xcframework.zip",
            checksum: "ddb5d37b4f333bd163729d0c460ae4e4af2aaf3fba68b76225bc84d03cfaad6b"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.267.1/NordicDFU.xcframework.zip",
            checksum: "b83b0484dc817a21351eaa17dc31f6da0f21530b7a74935cfdfa7ef61a9969d5"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.267.1/package_info_plus.xcframework.zip",
            checksum: "616872b4b0c6dee51aea9a0595fe16092d9e8054effa1c941a3562f58a6e27d3"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.267.1/path_provider_foundation.xcframework.zip",
            checksum: "74c886c210460506b9fbebcb05e9329ffac2d573ad2c5223cd3ca03832f08aee"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.267.1/permission_handler_apple.xcframework.zip",
            checksum: "aa9cfda1d4d427ead6def59ddb90a1244381ac20f45b85fc9b5f25c54abb2463"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.267.1/share_plus.xcframework.zip",
            checksum: "e7e9e2d26b34ddf8d77805fafdd127bbd815fe120e2b60accad2036225cee923"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.267.1/shared_preferences_foundation.xcframework.zip",
            checksum: "366216e633331b88b6f48909221f9381b8404c8f650e078fd296b8b7774bc41e"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.267.1/sqflite_darwin.xcframework.zip",
            checksum: "f82bb9174f2cd3f16a0105c90c492079088c8b6d79b718fb2a889bfb9b36c80f"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.267.1/TOCropViewController.xcframework.zip",
            checksum: "00bb6544c19bf9420246f635c35aa2f3a92e70d875c7c888f072e5b514508e00"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.267.1/Turf.xcframework.zip",
            checksum: "94a4019fada1f5f1a3275409b242e8c2ad06e29bdf4bffc5e76057d10bf75b89"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.267.1/url_launcher_ios.xcframework.zip",
            checksum: "5acdb1a6658ab256da4095672515d904e5aba33771148e754024335a88a81e27"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.267.1/video_player_avfoundation.xcframework.zip",
            checksum: "efe0370c707beec58bff7eb7cda02ad532edc7867bf828ccc99122e8916bb410"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.267.1/wakelock_plus.xcframework.zip",
            checksum: "b9a9d489a4c19b90c3385c146a5d9ff57e315d94da50faabdfe93f3c0d3a0afc"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.267.1/ZIPFoundation.xcframework.zip",
            checksum: "35bf33af83ad900159347989508252e1d9af6193657a9e0ff88fd8dffd3d2403"
        )
    ]
)
