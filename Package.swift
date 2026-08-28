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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.33-test.342/App.xcframework.zip",
            checksum: "eefafa1ddb811ff375828ee52a669091b757a3415c8546dfed852e457c979445"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.33-test.342/Flutter.xcframework.zip",
            checksum: "2e2fa6aa81c730936e9cdbc11269491fa2d10b4e80d7370de662a41aa14fe8a8"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.33-test.342/connectivity_plus.xcframework.zip",
            checksum: "0b1383d62786e2abf8c8e360b5bd707206b08fa4a5416343c0319ab8e6d823a2"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.33-test.342/device_info_plus.xcframework.zip",
            checksum: "f04b3beb7da177812733e57c130ff8559f8c352af421f3f597779ae322fbac21"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.33-test.342/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "413c9cc8cef64826d53501c112bbf45cf56047f82f5aaedf391ca97e4e93a76b"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.33-test.342/flutter_local_notifications.xcframework.zip",
            checksum: "68eb5103b5d1e72f64269d8d66c457d52643d03aec01428a56ebbcdbe0740ad7"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.33-test.342/flutter_native_timezone_latest.xcframework.zip",
            checksum: "1bc68378a80048481b8d1785a45f2e8b486c29f4c935b3993af0204e032303a5"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.33-test.342/flutter_secure_storage.xcframework.zip",
            checksum: "13e2645bed44d8723973bcf4a3b9f0532ef4766d133677b51c259c8adf04644d"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.33-test.342/geolocator_apple.xcframework.zip",
            checksum: "e70f0d3852d53559c43283737223e515c0f1715714e11acc776e34ad98d2b58c"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.33-test.342/health.xcframework.zip",
            checksum: "ee1facd33427b5967b070964555ffc06697cf5c94dd845924a10057e8320a2ed"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.33-test.342/image_cropper.xcframework.zip",
            checksum: "28280050d293635821f0092acafffaff17549343cb38b76b87044dd9165d6d47"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.33-test.342/image_picker_ios.xcframework.zip",
            checksum: "7366343fa889a918a278aad609259b5a86df3013a1cb13a21a146b1754830fb4"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.33-test.342/mapbox_maps_flutter.xcframework.zip",
            checksum: "e0349fb97535e13c3f0daf110362465a11683d1547b2b27ab76d3c35baccd64f"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.33-test.342/MapboxCommon.xcframework.zip",
            checksum: "0372b68fe1732074bf055b316d0f51c51e7cb75704dd8eadfa6dbc6f9690e99f"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.33-test.342/MapboxCoreMaps.xcframework.zip",
            checksum: "1a5584a3be81d24d8cd38421a7efdb27e7f31f7cf73d0864a6723fb3f07f706d"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.33-test.342/MapboxMaps.xcframework.zip",
            checksum: "76fc816395d890bd4e120670a8a76ca6e4761a1efd4f6d86ceb06ecb3cc6f34e"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.33-test.342/NordicDFU.xcframework.zip",
            checksum: "61f65ccfeb1ffa47e60608e34f7b3dddffd43810c62d6c385d498b83be387064"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.33-test.342/package_info_plus.xcframework.zip",
            checksum: "002a104b82cadcc99b8a047ce6e0206f275a78f418b0782d5c26db6047f2b6c2"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.33-test.342/path_provider_foundation.xcframework.zip",
            checksum: "75d874488fa1328bc26804ef2911dd37dd5fb8bf9c85f0c5eba9fd37dc9b7a87"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.33-test.342/permission_handler_apple.xcframework.zip",
            checksum: "ba8fdeb16873cefce9aa17e97ad0484083fb5912b65383b164d3d2154c520a47"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.33-test.342/share_plus.xcframework.zip",
            checksum: "345284f8675c15c188c618195fce38564477a8e9f3231f404de63f9be445b359"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.33-test.342/shared_preferences_foundation.xcframework.zip",
            checksum: "b69bdddbe9d69eb6da146bfcdd35d01b00a090c41be178bc9e0de09c9583543d"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.33-test.342/sqflite_darwin.xcframework.zip",
            checksum: "47029fa6f124e55092ca61fb81727f54a844de5d015505b113e5ac5a7923a833"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.33-test.342/TOCropViewController.xcframework.zip",
            checksum: "d32bdeac9f7aed27f52923ef751eaab5fe818eebc5471d4a5a3d87895bf9348b"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.33-test.342/Turf.xcframework.zip",
            checksum: "e855b159d6b04e695b8879feccdfb017d726d61ad8d27d935b69fd80244a4fab"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.33-test.342/url_launcher_ios.xcframework.zip",
            checksum: "c282f35b13dd06ce68ae025f59296b61c68f93368d7faf655c9b2b4a1b2d3bdf"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.33-test.342/video_player_avfoundation.xcframework.zip",
            checksum: "43bfbaa53b9037136ff0bfe139726fe6a37cc8f5a0adacb89f58623df279de58"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.33-test.342/wakelock_plus.xcframework.zip",
            checksum: "689b39aac658952c4cab23562787570663021143a1f27f016ace9b3d44efeeeb"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.33-test.342/ZIPFoundation.xcframework.zip",
            checksum: "690692d0d9ebe3f1d2d68ada20f15cbf5ae3cd02b4c1569da398f5347736b7b7"
        )
    ]
)
