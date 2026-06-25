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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.277/App.xcframework.zip",
            checksum: "3c54865d2251e5641c3ea63f826822b3c0f43cca8f65398fb7b1d9ed33d1b831"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.277/Flutter.xcframework.zip",
            checksum: "e405af819a6e24acb48b352b5c47c891fa25ddaf26da2e07c33bad30a606ad87"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.277/connectivity_plus.xcframework.zip",
            checksum: "db53107bf501d7bf0ce4ab2d72ea79b77059b2fa20420b77c9cadad58a22f5c5"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.277/device_info_plus.xcframework.zip",
            checksum: "77d977b1a1f1b2b48eda2abb74f07006fcc0101a1d32dc2e9f8864cbe554e684"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.277/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "cc3b7cc6d5c91460e7a6ac31c249ba9c6e17ce768343301fd20c1f4e2d903d38"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.277/flutter_local_notifications.xcframework.zip",
            checksum: "bae2e19fe8e20d2cde3918347da352f82917661513b5bdf64ce7358fe448db63"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.277/flutter_native_timezone_latest.xcframework.zip",
            checksum: "2eac47635317f324f3aae9b32bb38cd9d719c2a84a4f3fb9977656721d9ec011"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.277/flutter_secure_storage.xcframework.zip",
            checksum: "503088a042c1ddd4796f32d96d2cec19102e84cf0e416cc29fc960447e925db1"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.277/geolocator_apple.xcframework.zip",
            checksum: "cb98dd7d65154534f643a1a620c045dff9f7411228943c2458f08e9841b43ffa"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.277/health.xcframework.zip",
            checksum: "91510a3699f20391e94be9a443816493d3856c6a90f731e6bdb09dd975103480"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.277/image_cropper.xcframework.zip",
            checksum: "cebf093d02b6e09594ad759c3f0779f07c29787f03ade7a9846bc926bef9edcb"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.277/image_picker_ios.xcframework.zip",
            checksum: "8eca619a02e38ee959ea0f89f5ab14fa4d13ed05d77a6483f4e2a6356e68e2e3"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.277/mapbox_maps_flutter.xcframework.zip",
            checksum: "16ee6b759cbfe08bd20286f99108ea7ea860e00824ca05d4d035f36f71bcca35"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.277/MapboxCommon.xcframework.zip",
            checksum: "3d8ea06789a71904be7720bd70433658d4a4d3045ae5b80d84f7de7288224432"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.277/MapboxCoreMaps.xcframework.zip",
            checksum: "bd69941b4cc6e9b846055ab722c5f866120462c389d023767b021e25a4e2d6fb"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.277/MapboxMaps.xcframework.zip",
            checksum: "b6a462e5a77f0b1000d5fcc2562ba79d79d9fb8e4e565a411f5ad13f80fe72a3"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.277/NordicDFU.xcframework.zip",
            checksum: "bd7dafaafcf36d1815c263d3130efbf5f09fddf2a53dd476897cae86124838ea"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.277/package_info_plus.xcframework.zip",
            checksum: "4880004d367ec38380511c6ec585725ee1947c28b87516ababfa84bf6f9d629c"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.277/path_provider_foundation.xcframework.zip",
            checksum: "27c35d8135340995b4708d3b737e7d2d30b5e8de8a76218d763fd2423bae84f8"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.277/permission_handler_apple.xcframework.zip",
            checksum: "306546c438d728ce1b127fad11acbc98d5d99c238b84f2fb9afecd40bbc14345"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.277/share_plus.xcframework.zip",
            checksum: "6728cf2839d7dfccdb4ed251ac7139ed6033debc601969e9318bde158e262300"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.277/shared_preferences_foundation.xcframework.zip",
            checksum: "64fbcdbd5e29324ff2c643d14cf43b62d4da69ba9b9f6d206b61f5832c6d2e1a"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.277/sqflite_darwin.xcframework.zip",
            checksum: "a710dc5c19a55404ccc338b6866402b03d36f605eef0420b3beb7775c5bbe7cf"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.277/TOCropViewController.xcframework.zip",
            checksum: "2e01077ffafb11e8df29010d5fa479183dd29ef70c151e1014ec7f09e7ea2282"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.277/Turf.xcframework.zip",
            checksum: "2ccb569d5f8e970f4414144ad7a3b294477b5a4d8f5aaf42e7054ac3859b9afc"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.277/url_launcher_ios.xcframework.zip",
            checksum: "7c576cd1d7df922c188155381c9461cd78413f994ea592d5d544f92906c3dbd6"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.277/video_player_avfoundation.xcframework.zip",
            checksum: "34db2041d94ad280e0bb171db9e096eaf2e1da4d4ca602c6daf1e4b857705d79"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.277/wakelock_plus.xcframework.zip",
            checksum: "8099db612649c50e8b201f85296d228504f08b9a14864efa2f22a688dee2cde1"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.277/ZIPFoundation.xcframework.zip",
            checksum: "fd939b33f00c82d16a604bed8a673806b93560562330144252ec683175d36f77"
        )
    ]
)
