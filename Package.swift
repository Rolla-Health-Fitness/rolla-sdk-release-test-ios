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
            dependencies: ["Flutter", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "FlutterPluginRegistrant",
            publicHeadersPath: "."
        ),

        // Swift wrapper API
        .target(
            name: "RollaSDK",
            dependencies: ["FlutterPluginRegistrant", "App", "Flutter", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "Sources"
        ),

        // Flutter module (Dart code compiled to native)
        .binaryTarget(
            name: "App",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/App.xcframework.zip",
            checksum: "1846173d2652f780ab39dbb447ce4d0ff786aad26445c6782242c13582f0c9d5"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/Flutter.xcframework.zip",
            checksum: "1a97ffde58583355e7f6fb05f5fc0acc25b7ece18497e07593620dc10bd6bbee"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/connectivity_plus.xcframework.zip",
            checksum: "5aeeb76832a346932a55c6c15ea02515f484a0986bb4ffad210abb8f9cbce214"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/device_info_plus.xcframework.zip",
            checksum: "51c348272606d75a835c1aa985597e1ba4b767fddef087905274afeb56023a72"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "6bb52509a8adfca6a0a8647599afe349f9a8b8f1cf169ad6265bc3ef01fa8b76"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/flutter_local_notifications.xcframework.zip",
            checksum: "12e89d47eccd19aa003668e23146e3cda09b7098ec9a5d4103ed72f3ca490396"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/flutter_native_timezone_latest.xcframework.zip",
            checksum: "b4a45d76a05d088d674833dd9645ca533dd634fb8d97348669cb8abd4d23531f"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/flutter_secure_storage.xcframework.zip",
            checksum: "36e2df85d8e23a7308c50605387d288fd9e6487ab305dc0869afed5a4897f62b"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/geolocator_apple.xcframework.zip",
            checksum: "8e1f93d56843918201ca1e4b73aa600908aa1ae837fc977dad8d6a2351e21b80"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/image_cropper.xcframework.zip",
            checksum: "c44469f137debcc48029d04ac7ba8980d718b7dfe8d8fbadc302db9ceae89579"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/image_picker_ios.xcframework.zip",
            checksum: "b62de63082aca8ee31c980313a75870610d903afbef3c4123a61e725887c118f"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/mapbox_maps_flutter.xcframework.zip",
            checksum: "a1cf08a4d4152fbffa3e0d186951cb8f7283cde1284b650b607010a79860bf48"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/MapboxCommon.xcframework.zip",
            checksum: "fed767f1ab280bbe838b7cffe75ccb415ce30ab3ec50275593b56e40c9c154ce"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/MapboxCoreMaps.xcframework.zip",
            checksum: "c3b5aaa9968bb8ba3294451d27ce87988646ed328f04d1680cd3242a432c46ed"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/MapboxMaps.xcframework.zip",
            checksum: "74256120b5d390f0380876dffa3194e5dcb711ce9c7be3e864b01b5c07d31aa3"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/NordicDFU.xcframework.zip",
            checksum: "70bd086387edbc48b4dfe626070d999d395fee5fb39b6b4f59979ff9012227e7"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/package_info_plus.xcframework.zip",
            checksum: "1e74b6575178abe02ab993c08548e281588a3cae82cca340943f362166183886"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/path_provider_foundation.xcframework.zip",
            checksum: "07038a116774538df512344cce89454e53bb878624811f63bc2781544f60cea4"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/permission_handler_apple.xcframework.zip",
            checksum: "855be102388b58448e8d4b2e56d434e8c8619085f89b537fa042536c1e3106e0"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/share_plus.xcframework.zip",
            checksum: "5ecc4795eb755a00cef948b6fd8aeb1026d20152404d9d51c6f14c53d41a8a53"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/shared_preferences_foundation.xcframework.zip",
            checksum: "02008308ce0a3662f363fcec3b53a212c1a9e5a917343ab019c884335c361ec9"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/sqflite_darwin.xcframework.zip",
            checksum: "c88b343040ef70177a4b78e8dbba576efb322f42eca2a49cc72b0f219d9685d6"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/TOCropViewController.xcframework.zip",
            checksum: "050af3fd3a727f4926daf828d61d9fa41a68f1d79bde896f46cfee1598bd352e"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/Turf.xcframework.zip",
            checksum: "243097ae454d0aa7a16e668a49dfc471e69c23f486fdea31f17e9a07fdd7013a"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/url_launcher_ios.xcframework.zip",
            checksum: "6cf02edde8b44a7a54960a7e5d7423dffda69b6cb89aeed93c5379bd9ded0ff2"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/video_player_avfoundation.xcframework.zip",
            checksum: "0d62a7275196f29d65bc8985f0127db9603ed3034cda0f59321552a3e4060654"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/wakelock_plus.xcframework.zip",
            checksum: "df4df7fa92c047eb34f0d6a8520d34927a21e92514c17755ed127457155dbd96"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/ZIPFoundation.xcframework.zip",
            checksum: "94ef8d7f1ff3de1eb42e234959858d0240ce31e1d202b1154ba284a6c3a2efea"
        )
    ]
)
