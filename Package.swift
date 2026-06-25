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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.278/App.xcframework.zip",
            checksum: "e7d921f79b4089de2101fc4dabc54d6558e0af8e6c72d4162cf18b70c72404a7"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.278/Flutter.xcframework.zip",
            checksum: "19225c9e421b1c66c3383337673432fe3c2387fe7501e6a0b24cbba5a60213c7"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.278/connectivity_plus.xcframework.zip",
            checksum: "38943e4a763152ab4cd97c27a6327d6c100b7c798ac5001bef4a7a9d63907dbf"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.278/device_info_plus.xcframework.zip",
            checksum: "54a3b4d8aecaeb4a940f8af58e3aa83d20307c21b313b2501ddc1483fcdaa43d"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.278/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "d008f5341d789edada7cb6c3fe154a51f6ff837e36f6efda46c5cafc21dbed4c"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.278/flutter_local_notifications.xcframework.zip",
            checksum: "acb3236c9e9e565219592ec785d908a97715bd53898aaa1d8c38cbab88102ad9"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.278/flutter_native_timezone_latest.xcframework.zip",
            checksum: "72fa5b5398ffc40aa5d24741e6fccc549e522da0930bf553dfd1f4f594e974f1"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.278/flutter_secure_storage.xcframework.zip",
            checksum: "4e7ce8ae4e198a5659981a41a424c4ac41a4b868bd683c119492815cc735a402"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.278/geolocator_apple.xcframework.zip",
            checksum: "eeeca02e2bec8707d59bc924e45e248fa806a314ceaf8d13d470d815379b173a"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.278/health.xcframework.zip",
            checksum: "1c2264c0987b5461fd27542c442b34b41108a9db8e6c1c78e991fefbbf5d89ee"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.278/image_cropper.xcframework.zip",
            checksum: "2aeadf0a227f6f6824fde157f182869e2b7416a3c8443ceffd12fbeab3a310e9"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.278/image_picker_ios.xcframework.zip",
            checksum: "dbc1aab2fff8e7ff14ce96b365ac5bbc07b9839e9e9613bd33bbbad5574ab81d"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.278/mapbox_maps_flutter.xcframework.zip",
            checksum: "8ebdb8e5001390691c69e8c341933ca83f7a517d7b67d497e9f58e46460ae1b0"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.278/MapboxCommon.xcframework.zip",
            checksum: "f1905fa77743db894673a81cf8fa0ff028cd0a6c165c0a3cd658445612bbce1d"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.278/MapboxCoreMaps.xcframework.zip",
            checksum: "490d6a990acc1e677cd3f27d1d9e4fba32972881cee846d7c252a3b2be98935d"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.278/MapboxMaps.xcframework.zip",
            checksum: "cd64dc530af3b03847c33d06a246b0f60088a2a3a36847e064b9d1849b9414e7"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.278/NordicDFU.xcframework.zip",
            checksum: "fbe740aa35285eb0be8cb48b6a12a68a02e51209d82f5fe151d15a44be70f152"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.278/package_info_plus.xcframework.zip",
            checksum: "e97e69d03452724245cea9a217f4edd699c3c2fb307d48555728d52a0f0937fc"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.278/path_provider_foundation.xcframework.zip",
            checksum: "73cd0414c2fc8bd0b2cfad54bf4bd293d5bfd46212fbf0274d7a700408a495af"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.278/permission_handler_apple.xcframework.zip",
            checksum: "9ad9788f13f6274e5e36641d147110d206b8e6bef8fbfc6ef40db32067235ff2"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.278/share_plus.xcframework.zip",
            checksum: "60ff68fa216ddd948244646782a43100e476696df04f3d2c64b227fdc28c8142"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.278/shared_preferences_foundation.xcframework.zip",
            checksum: "f26741af8166a29184e7d0ec3b94c39c15b708d590b8fe69d5875e5429dc98af"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.278/sqflite_darwin.xcframework.zip",
            checksum: "df5e4c04f4339a94141eaa7ccce5a854d479884bb8388492e98b5a869f27379a"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.278/TOCropViewController.xcframework.zip",
            checksum: "8659ad53fbaaf91feedfd44edb7de79383152ef663e691c07b1c298f948922a8"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.278/Turf.xcframework.zip",
            checksum: "576f4b76f08612388bbca8f58946d7ed869eb7b077c20c81bd18ef867b7a08e9"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.278/url_launcher_ios.xcframework.zip",
            checksum: "e9a0b8a761e4ed930a56a5a829a9b9756c66f95e1ce76ec1ab0c3b41e3d445c3"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.278/video_player_avfoundation.xcframework.zip",
            checksum: "dda3b4720cbd23cadd85cc9e857f6f592b5129118a859af985293d540b6a2353"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.278/wakelock_plus.xcframework.zip",
            checksum: "d86a6926d96d8e89700efa21754b6f92ea8dfe0b22e2b27506f226f94bdce4e1"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.278/ZIPFoundation.xcframework.zip",
            checksum: "fc516eb09405a85787e0fb2b6952421010d4b167f6df29ba744defc561c57e35"
        )
    ]
)
