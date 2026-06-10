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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.256.1/App.xcframework.zip",
            checksum: "438998ac32577b6f183d301586e1f81c40ba0ed910f64052e90527e1adfc2c15"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.256.1/Flutter.xcframework.zip",
            checksum: "7b951ab3708ecb004f902b5ff114a3c18890555c873ef5f64a59aafe81e09f7b"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.256.1/connectivity_plus.xcframework.zip",
            checksum: "65825e7f3b6dc69faa839f775db935fc6236979f87270305d9d990b8dc098ee4"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.256.1/device_info_plus.xcframework.zip",
            checksum: "efba06f600ac43bb98216b05e81865eb735ae5f3e1aa682bc6a72ae5cafb1876"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.256.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "2060579d2c32d5604b0fd63bfcb132e48a33d16873cc9d9ca6dfc2a0b65ca92c"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.256.1/flutter_local_notifications.xcframework.zip",
            checksum: "2f0608f8b571e54881fbbe8d7505ef1d294577e0c788c12aea40381ca229b637"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.256.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "4526aebf05f4c648c08ec4b67543155be8e965610d12497f78323ba8811b2861"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.256.1/flutter_secure_storage.xcframework.zip",
            checksum: "71513fc1c6da611b37fc2e0702c4dcb58897f6f93ac001d72c17a830bf915312"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.256.1/geolocator_apple.xcframework.zip",
            checksum: "b8bf7ce90291a5ca604676dcb7f34c1fbdfd70fa7352dfca631f9235041d357c"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.256.1/health.xcframework.zip",
            checksum: "964043d49c0f19e30f71dbac9afbe3a6f66102d58ca6b084d0f9d247dce5c96e"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.256.1/image_cropper.xcframework.zip",
            checksum: "198d7aacb5cbb128553db969b22757931de5106ae13878a02550d0bfc3b1fda0"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.256.1/image_picker_ios.xcframework.zip",
            checksum: "ad7491169c0db3f0d18ae1aa564e9ca89788d3386fcb48fa9241d44733313ebb"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.256.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "43edbc577b4686f9f3889ff238b800ee0a4a2748621b1d751574d1370e5091df"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.256.1/MapboxCommon.xcframework.zip",
            checksum: "9338e56fba3b692b3b3c39aa955cd6900f696f3c900053f7798afc58b9cd2cf2"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.256.1/MapboxCoreMaps.xcframework.zip",
            checksum: "a2eb8476d560ec2864a91740935f9dcbf5d4470c99405489ecfc60295c20c1be"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.256.1/MapboxMaps.xcframework.zip",
            checksum: "0ccfa1559627af72a8bae417196d52e124456e160949ccc921d1d1dcf80d85a0"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.256.1/NordicDFU.xcframework.zip",
            checksum: "f9b3331676c44cffb0c6a02b564f5b5ffc625cc64716d47783b1ae018415d60a"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.256.1/package_info_plus.xcframework.zip",
            checksum: "b60530c684563989d8ab63d4b54344c532f56b2dbeb4bd409b82092bea631249"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.256.1/path_provider_foundation.xcframework.zip",
            checksum: "86561b6f487a7803c25defc5b79c55c6fad1658bba8ca122b603a599060fe831"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.256.1/permission_handler_apple.xcframework.zip",
            checksum: "5bd656766897bc0ea0c5cfe1dec5516ab6f3b290c7321b64b5c32b227b43156e"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.256.1/share_plus.xcframework.zip",
            checksum: "f4b23a3082d50024cd1aeb60ff204b2468167669001984cdb11b3d14f9425e82"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.256.1/shared_preferences_foundation.xcframework.zip",
            checksum: "8c85636b15d11246a9276807ac6aa0b4fab26495e63817161d6d95a90f4560b9"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.256.1/sqflite_darwin.xcframework.zip",
            checksum: "e807c8d1b10d6a7ee2d07195524fe0e65b08fb1c05c6c4394dda16b45cc763d4"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.256.1/TOCropViewController.xcframework.zip",
            checksum: "370e48e0c44fe39870df2b1fb5d291ebf3b4456b9df3355aac574c1d3dcbaa64"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.256.1/Turf.xcframework.zip",
            checksum: "1ea3b41617b1bf1a904f974d65b5f8385d90b2f7d0605f634b80f143b643af1f"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.256.1/url_launcher_ios.xcframework.zip",
            checksum: "b11a8b65c8d1b1b6bf5b1ae4dfe0daaf5c4960022eacc844f738c79f4586def7"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.256.1/video_player_avfoundation.xcframework.zip",
            checksum: "610d639b2acd56bbc7310b6f1de1f0451ef377fdb222abc841b094eccd60d534"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.256.1/wakelock_plus.xcframework.zip",
            checksum: "20a59110613a9b59d5bf1cf86912edeca78868d2253e0f3e64e4264ff7080bc6"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.256.1/ZIPFoundation.xcframework.zip",
            checksum: "0492e76c28235ed8937a310356dfc832c254416cc3ff4a86adc414c204ceae64"
        )
    ]
)
