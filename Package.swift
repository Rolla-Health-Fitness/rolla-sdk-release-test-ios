// swift-tools-version:5.5
// Rolla SDK for iOS
//
// Usage in Xcode:
// PROJECT → Package Dependencies → Add Package Dependency
// URL: https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios.git

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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.0/App.xcframework.zip",
            checksum: "c81bdd3478f4fb7249ecee53dfd076c0d678ce836790ed5edabf4c3e85b8376d"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.0/Flutter.xcframework.zip",
            checksum: "246715eefd92b7276d182bcb9096e4d0421318e2c185a158953425905127dd73"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.0/connectivity_plus.xcframework.zip",
            checksum: "f6b680ed3dc047f866e2db6936bd904e53a9cb860c0d8cd2b9ad2acdd6238969"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.0/device_info_plus.xcframework.zip",
            checksum: "983e61995119eb038f59fbdb62d3cf82d79334c9c7c9a28c1d5087c322725ee5"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.0/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "00076847e162848fd0f9a4a78889466d12d492812faebab338b371ec0eb6ee23"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.0/flutter_local_notifications.xcframework.zip",
            checksum: "d810043d30f19de43c605c365494e7ff6c40b3eb071625df948afbfdfa9c663c"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.0/flutter_native_timezone_latest.xcframework.zip",
            checksum: "701da20484167fc1352394a089706178b2cb387d9af2001b2096f793e6c905ec"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.0/flutter_secure_storage.xcframework.zip",
            checksum: "18785db9e86dcafda0446c6b7c7a866a2abc134d16fbfe2078ff5228c4e1eb63"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.0/geolocator_apple.xcframework.zip",
            checksum: "1b3e4185c637307fa20c9d3f30a48b543d6e634192194c0b4a2e07ef267a2774"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.0/image_cropper.xcframework.zip",
            checksum: "b1749bdfa5f9c9508896648df3381d23e470a4f8ac431e7b4bf533104d651d2c"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.0/image_picker_ios.xcframework.zip",
            checksum: "f27420f2b2c3a9d40869526f40e9834a9bceff991ffd48e452099814f1568119"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.0/mapbox_maps_flutter.xcframework.zip",
            checksum: "3c29991436ffae6fd47fd49ec95183e128e6f026cf75bec1a6fc40032b682efc"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.0/MapboxCommon.xcframework.zip",
            checksum: "84c0483d01995e93a8d6a9668f68199ca2ef2350e5309b408693804de38a7bb2"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.0/MapboxCoreMaps.xcframework.zip",
            checksum: "de96d889c1e38bda681f623a70fd93661f59ccbc2f4fd3674a8c34e09ba41012"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.0/MapboxMaps.xcframework.zip",
            checksum: "46b482c8764b54ee0efd3425f63d1ff82c4b22cb53bb170570939c6e1b364f7c"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.0/NordicDFU.xcframework.zip",
            checksum: "5874093a6e82fb874a2729be621e31b684074a4c561e00945c22a4e0d568b909"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.0/package_info_plus.xcframework.zip",
            checksum: "8248b1d32ded700e6ea1e8f63cc067a4d4c41317c15aeb26eb420ef72894bc55"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.0/path_provider_foundation.xcframework.zip",
            checksum: "7ed776757dec3b4489710529649060537bf642f75917cbdfc368bbbe0f68a96c"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.0/permission_handler_apple.xcframework.zip",
            checksum: "76b4bb7cd6a82527145a7678480703f952aafeb021219f94b1a3faba76a4b135"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.0/share_plus.xcframework.zip",
            checksum: "00636e71f03caa8d3c848bfbab5b82ab80f6fdf79ba11b6a3cc8386d9eb0b7da"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.0/shared_preferences_foundation.xcframework.zip",
            checksum: "5d6db6b460b8d05dd06ae661354f6f78fabc6000cbc79eb008ff310bba7f5066"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.0/sqflite_darwin.xcframework.zip",
            checksum: "35877921ce04d8e9b56d53f18dfdf072e7664603cd990330be38189b871104f7"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.0/TOCropViewController.xcframework.zip",
            checksum: "bc181fb396e053e8ec1f3dc53dc1b2cfd2b7e2e3c1cadcdad8e95fad0b936a45"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.0/Turf.xcframework.zip",
            checksum: "f09e2e6135c1e1847c960a665dc80a333eb99296c74e7d4c6478fec268c45586"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.0/url_launcher_ios.xcframework.zip",
            checksum: "6117e15b0c13cb5cebe9da4d8710c9747d3a8bf54097320c50df711cd722b6d9"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.0/video_player_avfoundation.xcframework.zip",
            checksum: "28a62cf08521444389e7154aabc4e5f20c8034116d9bdb6bc01070db83a1a2df"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.0/wakelock_plus.xcframework.zip",
            checksum: "707a10aeeda1eed8eb25955d7d829f4935861f0ae685036ca9530e24f70b10a3"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios/releases/download/0.1.0/ZIPFoundation.xcframework.zip",
            checksum: "db9adb8237c06999b9ad7aa959eb0073d5195f6689be75899104236a2e9bbade"
        )
    ]
)
