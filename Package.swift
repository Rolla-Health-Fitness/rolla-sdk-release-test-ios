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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.326/App.xcframework.zip",
            checksum: "4dcf4af276bbe3839b1f3498ac987d6f7f8d83f6d78747e2ae75a55562cc9110"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.326/Flutter.xcframework.zip",
            checksum: "2f50bf88903664105987cbbc491bf67f86fe6e4815e149f320d3a7504bbcad6d"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.326/connectivity_plus.xcframework.zip",
            checksum: "2ebc8ad4583ee4f7b080addbde695a0db05fff261dbeb46fee97bf687b5be587"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.326/device_info_plus.xcframework.zip",
            checksum: "6def4cb87b325766d5f68bcd0ecd88ca2bba5eba056bfb38588099e7091fc080"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.326/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "61ab585c600353fe35e9d5baaaef0883e3492228f64c716dbd45ccee340488a9"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.326/flutter_local_notifications.xcframework.zip",
            checksum: "ccf4c10843a3f2435974adfae7e9eda6b4397a617dbdec2908f57221d9567caf"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.326/flutter_native_timezone_latest.xcframework.zip",
            checksum: "64d17c99ec2590e1407e304288fa391cbe40fdee23ba6741a9df4f7c994031fa"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.326/flutter_secure_storage.xcframework.zip",
            checksum: "d17fcf58ceebb0d9b130748206ede74fd6aeda344d27056dcdfa3885071cc94c"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.326/geolocator_apple.xcframework.zip",
            checksum: "12eefeb79170a1b09b139fc624c01230eb3eae2eda49a584f28cc315497f48dd"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.326/health.xcframework.zip",
            checksum: "977e3b6dffb1322a6c48bbb0be6fbf3f7cdf83d9a1a323d8aecedf13d17b9eab"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.326/image_cropper.xcframework.zip",
            checksum: "ab38b74aaef678e9576d9220f469d1a1f8a7275bcb6abc3972bab6930fb03986"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.326/image_picker_ios.xcframework.zip",
            checksum: "d6c203ede549b559c6deb3ebf03e66b441bb2a4edda822ef2b114c5906eacffa"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.326/mapbox_maps_flutter.xcframework.zip",
            checksum: "4acd5fb43920bd2e855ab6bfb721cc4628c7383943439a61010206bbb4b8f842"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.326/MapboxCommon.xcframework.zip",
            checksum: "4379d82b48c626d01ad996ac61382edddf7a60c686f95a1976ae68c1316db8e7"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.326/MapboxCoreMaps.xcframework.zip",
            checksum: "8121e1d10d66a08501c066f632ba3ec09e034fc2fcbea91c5a1247751da0636e"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.326/MapboxMaps.xcframework.zip",
            checksum: "7e53684e163c377141c1f3b70a780c47d8b3caa3c601249f17485708fe390149"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.326/NordicDFU.xcframework.zip",
            checksum: "8afb0cbd5c96d39c76da9c15dc37311d7f95678e0ee5d765df6fc1c322ff28f5"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.326/package_info_plus.xcframework.zip",
            checksum: "4e6bb9ffde4c750a47b459ccbd43fc0785204e34220042008e228157529c8484"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.326/path_provider_foundation.xcframework.zip",
            checksum: "ae0514575c692a9535e64c410fbae2bde9e89f80d81396825990c94b071954f8"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.326/permission_handler_apple.xcframework.zip",
            checksum: "d5b1e07d751f977c19934ec1ad73aec3cb91d69bb1108c2d75430dc0e4f25904"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.326/share_plus.xcframework.zip",
            checksum: "52b66cd47fd6f45250966203ac84a9b37580b790a7a490e349d1b4a874f11db9"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.326/shared_preferences_foundation.xcframework.zip",
            checksum: "6f4252cd9175d51e4c07971faf0675297ff16935925628e8950bb726e21ee9e1"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.326/sqflite_darwin.xcframework.zip",
            checksum: "0f2eedfb07151350811a5f6062dd9322bc3d8a11200e6bb8d4b27ddeff0d0ede"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.326/TOCropViewController.xcframework.zip",
            checksum: "ac888f540d339b7460fecc52c127f213e5a4a49449543cbd39e8861b0e9494da"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.326/Turf.xcframework.zip",
            checksum: "f92150b5063bcc0de23331e78ab77014f7cbd728de37ae571ef2f5170177804e"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.326/url_launcher_ios.xcframework.zip",
            checksum: "e023fa7db315efce6d02084d049da641b7266d6d341b4ae6317545fd07f07e57"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.326/video_player_avfoundation.xcframework.zip",
            checksum: "91ae2b6fdabf91f0846ff6ca71530968b2aef3ed907c8974d6530acb3c387fd8"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.326/wakelock_plus.xcframework.zip",
            checksum: "455070db510bfe9d9d03b080a0ddb3d80ee05d98424fb6a0886342d18a1b6369"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.326/ZIPFoundation.xcframework.zip",
            checksum: "69fc7496e9f84fbe7cb1c1db9cebf6eaaf23187adb3f809790cc7224c91a6963"
        )
    ]
)
