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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.320/App.xcframework.zip",
            checksum: "1ba395d8726ffbb1fd968c109228a40cef9ccad818440dc22365b00631812b31"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.320/Flutter.xcframework.zip",
            checksum: "418f73100094e62e3f79651db33e8b847b77c62bbc9639d9fcd1d8d6dced1f43"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.320/connectivity_plus.xcframework.zip",
            checksum: "e856851b539940bcfd63dfc9502a894987fef87948d7bc788606fd54177f362f"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.320/device_info_plus.xcframework.zip",
            checksum: "e47223a5f8f338fee77d2cd5559eeb450982ef39d697b2706821bae2d8fec964"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.320/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "5d3abd1ca0fb7eae84cfb5605d8643a8c93a235985b79eff2f7606fe6e1db6a2"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.320/flutter_local_notifications.xcframework.zip",
            checksum: "91d5f9a254dd1c346278ff5a7e3876bc3d17872ebc525d744a73dd273433692c"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.320/flutter_native_timezone_latest.xcframework.zip",
            checksum: "3675584e87e317956e1609a634542e1d4ded1cb053c8c4e0fd8027c81276d309"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.320/flutter_secure_storage.xcframework.zip",
            checksum: "d05cc162089644b118dc761380ba512a8f6821521aa4c7c727cde082aa9dbc2f"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.320/geolocator_apple.xcframework.zip",
            checksum: "d7eccd2b69e77292e8064b8ca76c45aea79269eb1653252371b3bcdcbab05e1a"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.320/health.xcframework.zip",
            checksum: "ee34f95509f4f9c7983eb06eecc07443f21a7968a092824e9d3f11074a1ab92b"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.320/image_cropper.xcframework.zip",
            checksum: "6f96175871f4208b909ea5aea3cf76c030f4f5449dedad6ccd54ad4e61cd0406"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.320/image_picker_ios.xcframework.zip",
            checksum: "d5b2878d4d71dce90f416b80dfa1df3f6b3686520e0c1d117eb12afd27eb6c8e"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.320/mapbox_maps_flutter.xcframework.zip",
            checksum: "d41ad183b1a4fb3d33a2ddbfee53f0ee10d06adb150d25539aec3de074c1d3ae"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.320/MapboxCommon.xcframework.zip",
            checksum: "382653ef61a11415c02fc7aa638fd2aac6497b5a675a83713c6fa453206c852a"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.320/MapboxCoreMaps.xcframework.zip",
            checksum: "effdf829c62b8e3a54a088be3623ae34f036ae1db9b26e38fa424b0aec55599b"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.320/MapboxMaps.xcframework.zip",
            checksum: "b0f1fa484a6dfab4fb0fe7e069181aa72ab20ec8a394fa3b688e2db326b96b71"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.320/NordicDFU.xcframework.zip",
            checksum: "1dd26ccad749a91e350473c7862c2cea34fcfe786010a39a25eec19ec8953b16"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.320/package_info_plus.xcframework.zip",
            checksum: "440e2cf7867d130e44a464cfee7f28ff8968c5b23e13bdc8c25c933482ca2cd1"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.320/path_provider_foundation.xcframework.zip",
            checksum: "317cc0f3709d51c834b1e6573c70920e64a71db6fed7e4f81030db63ada58ccc"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.320/permission_handler_apple.xcframework.zip",
            checksum: "7d202c9a40206d5c359f2243230ef75b243a19622caac0f46bd65912581f8098"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.320/share_plus.xcframework.zip",
            checksum: "7ac8422793edd5c19cdd7c4e6d1f470c203fb9b066d13478139a0c80c6f23667"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.320/shared_preferences_foundation.xcframework.zip",
            checksum: "a4295043ea0788c865d299b72902e5445b1a22331918bec2f64acf782300cf34"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.320/sqflite_darwin.xcframework.zip",
            checksum: "433b76dc616e4b2681ba18069f0f0b02f7475316a15decec787988106aa822ab"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.320/TOCropViewController.xcframework.zip",
            checksum: "876a861a10995d61e883ea8084f6171ae9cb3662ddab7567e641ce9db0f2d295"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.320/Turf.xcframework.zip",
            checksum: "f39034f071c8d559486bb0372c4380b1a869a65d5cf8a2522ec3923a5310f43c"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.320/url_launcher_ios.xcframework.zip",
            checksum: "6552c1c1151f88318ae787136d2e6b08a31ef5d524ff49aa447b293911cc2b9b"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.320/video_player_avfoundation.xcframework.zip",
            checksum: "917830be76ccd1f699809d209c40da5da60a3432055c13ceb1de5aa77a49801f"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.320/wakelock_plus.xcframework.zip",
            checksum: "f90033c5a977e3009333c9d2c77117d18d8805338b033a5f5d9baddac0908af5"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.320/ZIPFoundation.xcframework.zip",
            checksum: "dd7367edc845b928b74327d07e5bb0baf5261dca9ca39d209373a0c1fbfa4ded"
        )
    ]
)
