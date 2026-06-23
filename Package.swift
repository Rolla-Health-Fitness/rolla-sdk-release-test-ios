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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.269.1/App.xcframework.zip",
            checksum: "2f011aa615204d9edb8b2e7a0d1b3bc3654861ef57c2b8737a1d86adb03cc811"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.269.1/Flutter.xcframework.zip",
            checksum: "c0913a6cd106dc7c3a42ef3a0dedb93f097a27a2bf79d5c62233fe1a66794367"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.269.1/connectivity_plus.xcframework.zip",
            checksum: "fab2634cd98a312f8a115b6b3ed785ad80292a8319aeb3d4fc77dcb9d9bdad7a"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.269.1/device_info_plus.xcframework.zip",
            checksum: "39f20061eba13696321955936eecb7a4728a9eafa1de4fe1c0bc3717de5a828b"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.269.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "57420aa128871558c603a45587f4e06110f79c559100a6fe0581e373ba9c1afd"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.269.1/flutter_local_notifications.xcframework.zip",
            checksum: "8c8a4885c802420de94cda8c2763dbefdd24b6b0fc876f2ae9b4dc467ac5578e"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.269.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "10f4bf5bc66f317a9882cf43083cdaee6a79ea479f460df0620d321cdd8ed418"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.269.1/flutter_secure_storage.xcframework.zip",
            checksum: "001d70c9f4391f523e58a038b4a767916d27cc836b0384184935f80ad47396a4"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.269.1/geolocator_apple.xcframework.zip",
            checksum: "53ae53cfc72ecf2ea3b58f2e1068ae9222935d61555332d02c1648070aca7eba"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.269.1/health.xcframework.zip",
            checksum: "0bf977c1ca1e4b195d9d2d5654780562bfd6bd4625e4e5f55a33420fd1840e12"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.269.1/image_cropper.xcframework.zip",
            checksum: "af9041de5363dc584c0a1d18a7e65d43c9190a105de2eecc83b5acf4c570b8fc"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.269.1/image_picker_ios.xcframework.zip",
            checksum: "ff6e21610b72ea68917d6aa48599a67bda0619cfa4287dbea36a647ac48eaaf2"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.269.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "d612233dc38476b63fe4048a379cc8e8737b665df6f5a975e60fa67dc09a490f"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.269.1/MapboxCommon.xcframework.zip",
            checksum: "0cac446ca40910ec7e07159838b26a173bb46ca94844e61bee6321db6145e384"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.269.1/MapboxCoreMaps.xcframework.zip",
            checksum: "1890a6745692b9d065b824d4e4a7e0bd48c7337d19ad58a420b15bbf50789554"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.269.1/MapboxMaps.xcframework.zip",
            checksum: "6046d77d0125bfb9a124f64f555032f482763fe05ec4129d74200a3ce2fcd62c"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.269.1/NordicDFU.xcframework.zip",
            checksum: "32ab54cfdb1d6de290beada1032728789e0edf0747af6a5c9247a2c566b7dece"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.269.1/package_info_plus.xcframework.zip",
            checksum: "2ebd368f90082d10e44eb5a4156254e67f12087d3bb7ae527d5a5897a4e353f0"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.269.1/path_provider_foundation.xcframework.zip",
            checksum: "81647f6c6d8a67ca4feaae622fc5c1d9ed10a8c8971a439e1d60ee6f0d051706"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.269.1/permission_handler_apple.xcframework.zip",
            checksum: "949549a9861dfe16bafbacb43a71789980c8147ccdf869c37b8175700b08c686"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.269.1/share_plus.xcframework.zip",
            checksum: "cac85e9efe23bcb320300c63ed8ded2f11738adc206ab91f3f33587dbe1d36d1"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.269.1/shared_preferences_foundation.xcframework.zip",
            checksum: "48900888fc37e936abc2cb7728ace1d9ae2f5de2eca469f3cc488e255c9d8b5d"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.269.1/sqflite_darwin.xcframework.zip",
            checksum: "6f7c999c597f12b8510dc267c405b09c2971300fd900af18c3f649e4887bb34d"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.269.1/TOCropViewController.xcframework.zip",
            checksum: "d05512a79ed0fcea163945e0d95352c65120a2d9f1fa29c0a70a7d7420e5a7a0"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.269.1/Turf.xcframework.zip",
            checksum: "a31ee2529bc08f6ea2f4c98d9334b4e9ac38616216b1997d16e673913364b2c5"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.269.1/url_launcher_ios.xcframework.zip",
            checksum: "10e60e6228ae07857aa08106e834efcd0f4225e475a25e8c66fdb52e20f15caa"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.269.1/video_player_avfoundation.xcframework.zip",
            checksum: "3148d9ec7b6dffaa549f8db39b586fc2478e2a6592284fd0bce91bb3fa725182"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.269.1/wakelock_plus.xcframework.zip",
            checksum: "63e49c45e9e91f0bb00b2e3bdb13764e1edd0edbf983b94bab1bca333e34fb4c"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.269.1/ZIPFoundation.xcframework.zip",
            checksum: "fa53e4bf4911ed8ae7aebb380e232ad3743e4e21e1d8928f0dc4ee2a1a885808"
        )
    ]
)
