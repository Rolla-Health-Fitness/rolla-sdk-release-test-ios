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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.286/App.xcframework.zip",
            checksum: "0c9bcb68455fa93270373588529d83e72cdad3b7555423a39502b459c6e476d0"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.286/Flutter.xcframework.zip",
            checksum: "7147e5d71c7df763bd15e1f3bbbce8e1334d363c0ef65afefd3fa1cf7456ce4a"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.286/connectivity_plus.xcframework.zip",
            checksum: "2bf8b2de0e09933ba3f85f3ae0f065d074211ad0ed88b467fd2dc98c61fc0d8f"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.286/device_info_plus.xcframework.zip",
            checksum: "4b0adce555468dcc068def90834d7069ac2cb254c3fed00cb012e7af05ce2cf4"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.286/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "d7c4909d827e6bfa38cf4ad7f8e18041c81c1a91f4c8fca2a54fcd5009baa809"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.286/flutter_local_notifications.xcframework.zip",
            checksum: "7ed84c97289615f70a089981d515d992e807eda315ba25dd9224a209bdbc2e88"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.286/flutter_native_timezone_latest.xcframework.zip",
            checksum: "5df99390200cb67fe3c641e0f84e1ac8ad7864cefe899142090d26ab798c4b61"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.286/flutter_secure_storage.xcframework.zip",
            checksum: "e1fe6601464a3385eba329c17f66b1254220273a43f697e28d814efc1f4e4098"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.286/geolocator_apple.xcframework.zip",
            checksum: "c93f6e5a3d21490591a911f7eb48e9b1797f4343c8ae722d338bc6d1a6fff654"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.286/health.xcframework.zip",
            checksum: "3f686c13e0c767a3d4027f3abbcbef75d6a86a7c6454b5f68e546972652b57ea"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.286/image_cropper.xcframework.zip",
            checksum: "0b287ede6cd5f875b65c909e991932d0374f46224a4c377a1e66a3caae2c8dee"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.286/image_picker_ios.xcframework.zip",
            checksum: "a05628bdcff8b1de231f7338f727526a1954a8322f7d1802deb2da21eead1403"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.286/mapbox_maps_flutter.xcframework.zip",
            checksum: "21a11af43e519915b2a19c2fab4ccd4f2d9a9e3a7abf524a89b6dc0c7d42402d"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.286/MapboxCommon.xcframework.zip",
            checksum: "56eb065190bfe9e9de88380067a7279d3a213b89c8bace961d987954adde24c4"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.286/MapboxCoreMaps.xcframework.zip",
            checksum: "c1b61e9a7282965738134e80ecb35a2ad3904237caa14880aa58aea7c8bf0a76"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.286/MapboxMaps.xcframework.zip",
            checksum: "975c27f588d55c2b80b6740579d084009d772fde974c8eeeb86b355e24c857b0"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.286/NordicDFU.xcframework.zip",
            checksum: "b35a2250df5d9235741d187c73e64692e6a100489c81cfec1713f53579c06316"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.286/package_info_plus.xcframework.zip",
            checksum: "bc768a210022195dae9e8754bc3864b6b7cfb833a4e97d7a12e79a93e219871c"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.286/path_provider_foundation.xcframework.zip",
            checksum: "f40169c149c9f5a387306b01bb072a2e1171c7d82a4e681cd3386d88b37daa36"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.286/permission_handler_apple.xcframework.zip",
            checksum: "aa520a1a68e4a148080f7c31f4a100c569884f9cc9e137a84355abfee05d586f"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.286/share_plus.xcframework.zip",
            checksum: "378426973c3ccdafd51d293f9cdc939a0eb6bf16548605a3860a157b8aeb2f4f"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.286/shared_preferences_foundation.xcframework.zip",
            checksum: "3a60aade941dcfbc5b4a8d6b0bf138048fd211a90026494c2780b5e308981877"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.286/sqflite_darwin.xcframework.zip",
            checksum: "603826f326863fa124fd4bbbbb02bd1d382a99f36a2f785267f032979e4aebb1"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.286/TOCropViewController.xcframework.zip",
            checksum: "9355debf190e64f8182f39ee2178c2661cecf602ea5e11780432319ded33d54f"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.286/Turf.xcframework.zip",
            checksum: "4a0d968b71f30bfdf1b93050d14ab02373db0153bd69002b18a1d4cd809572fa"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.286/url_launcher_ios.xcframework.zip",
            checksum: "a7bf7601faf51284f4452aea2b51762625be227ce4c74b47cf9ce5dca4e9b788"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.286/video_player_avfoundation.xcframework.zip",
            checksum: "53a0c01722ab2a5d19e8a793a69843e56c88c80a72ed0809eb12b7c7e33057af"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.286/wakelock_plus.xcframework.zip",
            checksum: "6b4090252b242f7b10063c62711f0d5ba961e3e3e2be1ad873f85228e52d29ec"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.286/ZIPFoundation.xcframework.zip",
            checksum: "b1acb2bc0dfabacbd338f6c89ef806e4398c890208c9bff3a2ec2334fcb07135"
        )
    ]
)
