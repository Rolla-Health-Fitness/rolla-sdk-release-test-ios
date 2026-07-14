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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.292/App.xcframework.zip",
            checksum: "c1f85af3b2b03d75ca1fcb14fcaeb41eb5be58bd0352a91825e0f2fb99b45042"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.292/Flutter.xcframework.zip",
            checksum: "66e950c1065cb58019c310f1d38d80cbaf1addc801ea6c808476bc9f9381fc2b"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.292/connectivity_plus.xcframework.zip",
            checksum: "c90ed82fb1d6a088cf9f406838ff38740b2b6cb2c4835cb84d1fdd0885480842"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.292/device_info_plus.xcframework.zip",
            checksum: "5313848f923ebaa018518659797c062c3d1c960fc5d5451f44ee6f58dad8be93"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.292/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "a1578f7f67ff686b03bbe5f4e9a0fc77ea62f476a9585c545f1064bacd477cb9"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.292/flutter_local_notifications.xcframework.zip",
            checksum: "4c9045d1c4469ddbfee030c8be6971f3c4521e49ba97dc3006b07a849d1aa43d"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.292/flutter_native_timezone_latest.xcframework.zip",
            checksum: "338973f98b935c0191f25d1a02986264e625aaebc491b7eded6507e05ddf4d34"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.292/flutter_secure_storage.xcframework.zip",
            checksum: "d4f377a253fd3ef225f3cfd51f10efb4b93e5a92d6a2854dd65af57da7e0a646"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.292/geolocator_apple.xcframework.zip",
            checksum: "e1e3e16a097a76a2fd5f19c7f15222e9cb138c5b5b9a8be3cd3910376d4cd6a6"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.292/health.xcframework.zip",
            checksum: "8f7ed0f00b29dc9fbab602aec429619d2e71c134bbe33c68560287f15e15e57b"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.292/image_cropper.xcframework.zip",
            checksum: "bf6a61a2dec2a48afc84f1d6062c5abe4e16d1aec477928b622d33944f923188"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.292/image_picker_ios.xcframework.zip",
            checksum: "20e82cdd5a3d954562f6eea9e051c2c167259bcb618ba0d2ed7536de416bd4ba"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.292/mapbox_maps_flutter.xcframework.zip",
            checksum: "550f2b4fed8b8c531a382b727893bb9c7170ce0999f190a4bd70a5f3326b02b2"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.292/MapboxCommon.xcframework.zip",
            checksum: "f5d71f163148feeabc16dd80893df0ad21faa76b7ab47f8cbe64b36c8c09b83e"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.292/MapboxCoreMaps.xcframework.zip",
            checksum: "21573ce5d07790672c7eab8083d9c02965a3c64331fd26560836de3d3ed975fb"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.292/MapboxMaps.xcframework.zip",
            checksum: "dba0688f3fe3cbfe15ddbc1228b634129791a35e351a140533b750b6f20afaab"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.292/NordicDFU.xcframework.zip",
            checksum: "a4c14e1b0d0c0acfaac79c8a59985bf88008ae59b5a89120eca95aeaa6f2eeff"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.292/package_info_plus.xcframework.zip",
            checksum: "50be61da08ca015c39893fb0eb455aec463d5b9f7d4b8496be0ee32ef17fd52a"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.292/path_provider_foundation.xcframework.zip",
            checksum: "9eaffe95ddfa99528e8e3cb097e72fd316f38172f29cea013d056f9e0dad0ab3"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.292/permission_handler_apple.xcframework.zip",
            checksum: "d6b0d94f30882d11587a636083a34fbae62ac87382ec8ac011b40ac091f1f8a3"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.292/share_plus.xcframework.zip",
            checksum: "5463e653313d3b1bc4b8408a210d6d8694c0d666e18570a5694be5e67d130d21"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.292/shared_preferences_foundation.xcframework.zip",
            checksum: "26ddc6ed49151f7540d700d92512dda0ee2782ab00933ff73e190aac626e72c9"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.292/sqflite_darwin.xcframework.zip",
            checksum: "4f3bf188347469f5a1232a655d9ab03e65e2cbf986f0b0748c461e8f0cd1e120"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.292/TOCropViewController.xcframework.zip",
            checksum: "248ab93b5028555f0c67df798502203dd62cf115002c36d61fab97d3eaa8bc2a"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.292/Turf.xcframework.zip",
            checksum: "f896bea7f4485b1780788395bc8afd0ae6f0afcc4958fd390e9988fa53edd884"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.292/url_launcher_ios.xcframework.zip",
            checksum: "962e36e7045e2de0cf3859d63236695efe13247608d532d1cf8c8ef9f16d4279"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.292/video_player_avfoundation.xcframework.zip",
            checksum: "0d0250cf3d794b8ac778b48a8488817ead8f5bcd5561924909a1b78c2ee9bb09"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.292/wakelock_plus.xcframework.zip",
            checksum: "7f65a7b7089e804db8fdcb9a454f8fb590ba755e4fc5aff26f98e7d5ac83c8ad"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.292/ZIPFoundation.xcframework.zip",
            checksum: "8261e253a36e84d08e40b656c33d8635aea8ad504273f946987a2b2b0cb9f7ef"
        )
    ]
)
