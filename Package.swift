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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.329/App.xcframework.zip",
            checksum: "779b3e55c58c52e565d79a2a253bb253392cdc004dcd95b7d3122747d68a16f9"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.329/Flutter.xcframework.zip",
            checksum: "c73b8bc15a842d40e0f4281d83e65c4c8ac0f1cdc0e54ac28e8c2d7dda6a0c4a"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.329/connectivity_plus.xcframework.zip",
            checksum: "c966c64aacacc7e211547bd0ec35556e9f62d99bc07704ad0022e3ec1b4fc4db"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.329/device_info_plus.xcframework.zip",
            checksum: "afa689242b00caa27e268f011d001dfb8bfec98eb4bbf3d2b077d531cd2543b1"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.329/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "f55868792c75552a656451024088c89bc4ed2a87bfad063216d0be420a2c6923"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.329/flutter_local_notifications.xcframework.zip",
            checksum: "47fda3f9f677effb592ac853f51901d991678acbfbe142cb71af9ef05ec438f8"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.329/flutter_native_timezone_latest.xcframework.zip",
            checksum: "e783638cd9a1d5d89ccfa4b9d2a92a4d88b342a5569c23e77920caa1473399a8"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.329/flutter_secure_storage.xcframework.zip",
            checksum: "2a999a43a488be4b0b06dc7af5d964f681eb19276c3dc7b707839cfd38907937"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.329/geolocator_apple.xcframework.zip",
            checksum: "595436268d225be0e7c4cff5bd83f83e00f9c5c74fd3fec10efd65bbc28eccd2"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.329/health.xcframework.zip",
            checksum: "08e15690c973aa8eb3fcf8d054e8120395bfcf01c43b6bb12451d4bb86632c66"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.329/image_cropper.xcframework.zip",
            checksum: "82421a0acd72bc359cff801ff68d17ed0f1fadef534c58a645ac97c74bbb2759"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.329/image_picker_ios.xcframework.zip",
            checksum: "f20fed8387e70a873056286eb711db997c614986be943c2ef6b509b167b038dc"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.329/mapbox_maps_flutter.xcframework.zip",
            checksum: "f1c0cd7c04c23cc2660b9a5f85877b165e134235fa101fc5d6c9a6b5b2a0417f"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.329/MapboxCommon.xcframework.zip",
            checksum: "8cd399669efcb28760a2f91415b4412ce44b0aaf69f3e8a8d824de830d260986"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.329/MapboxCoreMaps.xcframework.zip",
            checksum: "31f5ebc992cbfb3bb6befc048d33c7680e9e9a779f77041dcff3a801dc36f7f2"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.329/MapboxMaps.xcframework.zip",
            checksum: "0dbfdee91643cd2e78760e41ebc63a573503cab87b5592c856ba703e2809cebd"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.329/NordicDFU.xcframework.zip",
            checksum: "d9b06c29eddf3955380d62f44c36c412da3d44b54a182c73d5017bd8174d0bc5"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.329/package_info_plus.xcframework.zip",
            checksum: "7eff1f6998e1377aaf605da3627a7cdb9c54682d5b11ce00d55a110bd35dbc9a"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.329/path_provider_foundation.xcframework.zip",
            checksum: "76c586a43bc4b44f71e7f3f8828980376318247ad1d80d19683e27cbcc7efeae"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.329/permission_handler_apple.xcframework.zip",
            checksum: "61f31f70dd8a3e7f8491dc4bf386e551a318934c233cb32d8e36544013e74b22"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.329/share_plus.xcframework.zip",
            checksum: "c7b996114e8c5412f4a920d3705e014394234cc4c00beaf2721322209a9dac37"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.329/shared_preferences_foundation.xcframework.zip",
            checksum: "820198774cdd38665776cf259026b43289d27305dff406af19b1fb29016c971a"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.329/sqflite_darwin.xcframework.zip",
            checksum: "8cb1d08c0ad41cf15697ff0b2d9f3ba97d5cc93763ea195ee821cb95718053d9"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.329/TOCropViewController.xcframework.zip",
            checksum: "fd985faeb792a76b79ed25df6a868e4e6a93d9261d2b9c09995705280aa472f0"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.329/Turf.xcframework.zip",
            checksum: "84e318b9a676a5db80865d38782729958318ac95dd48ca8ce25e4e63e0ccbf07"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.329/url_launcher_ios.xcframework.zip",
            checksum: "9539ba3c8862865399bb0555d8fa1dd54415e5e74a36d2d38e247307cd32111f"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.329/video_player_avfoundation.xcframework.zip",
            checksum: "5ea038b0cd4a9b5a4bea268740aaa6c6c7cf90e41fe9d9c8086b1d4fe87fe0b6"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.329/wakelock_plus.xcframework.zip",
            checksum: "3e550449b65243ae4001d5c29dc3bb46ffdc32cdd472f7893b026db44fbe15ac"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.329/ZIPFoundation.xcframework.zip",
            checksum: "86a903cbdf9a179e12ff0659a670a7eac688e6a1c43bfcc4cfeaed331bded463"
        )
    ]
)
