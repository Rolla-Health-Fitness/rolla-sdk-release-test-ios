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
            dependencies: ["Flutter", "apple_health", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "health", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "FlutterPluginRegistrant",
            publicHeadersPath: "."
        ),

        // Swift wrapper API
        .target(
            name: "RollaSDK",
            dependencies: ["FlutterPluginRegistrant", "App", "Flutter", "apple_health", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "health", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "Sources"
        ),

        // Flutter module (Dart code compiled to native)
        .binaryTarget(
            name: "App",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/App.xcframework.zip",
            checksum: "29abc8094d327b3915be705512621688dbeef7f7e7af96a4b315e5ccf1072ca6"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/Flutter.xcframework.zip",
            checksum: "b94dcc55c62e7cb0d15a3ae4f7717f5d529f2899c6a738e6de3f6ec187879b97"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/apple_health.xcframework.zip",
            checksum: "51ca08001ef403be49f508f84911d46b97407c30d1fa53e2906e437fb33c83d7"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/connectivity_plus.xcframework.zip",
            checksum: "e0cb4c1342acec1d0a716a326616f518c81a5b5378d3471b68e0ef23e7da1f3b"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/device_info_plus.xcframework.zip",
            checksum: "d3d2c765dd69046d76566a04d8a9baaff88a6d18c3809e87b0ed36fabc2613f1"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "9c1153da118fa5d300eb6bcb17eda012182e59b98bfe6bc706d31f95edc5e867"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/flutter_local_notifications.xcframework.zip",
            checksum: "004bc1d626a60359db3fd90e22325ef64140b03d4cf8be9261b0ec674bdf5a66"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/flutter_native_timezone_latest.xcframework.zip",
            checksum: "9ad5bdff1347ed939b2bd7fc47715c63922164573e2589c441d4a4ba0f2de12c"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/flutter_secure_storage.xcframework.zip",
            checksum: "8d385ab81d95e2634bd84ed48bffd4b52a860d9d5eed0ab4810343f7386d0963"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/geolocator_apple.xcframework.zip",
            checksum: "28f790bb777bfa1ac26eb51d89dbc10e0aa4a49a9ce4f76017ccad309bdacb07"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/health.xcframework.zip",
            checksum: "d6ac9a28e5dd8c4840ddb02c3c0a7f0d0bacd7f636cb439452a12d39fa9bcfab"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/image_cropper.xcframework.zip",
            checksum: "7b84d7d0c5541db62d0f276e402de8de03697df76bfc74bc8a204308a15133cb"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/image_picker_ios.xcframework.zip",
            checksum: "e470fd17a159a3b94383b9327590842d678420baf8694faefd3e125b1759ff45"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/mapbox_maps_flutter.xcframework.zip",
            checksum: "f5afe72d97745e7de1836521d98dc8808ff8a58d0bcfee3f95940f26ad72d47f"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/MapboxCommon.xcframework.zip",
            checksum: "179e1fbb7236fcb4cd4ccfae39e69b275aa6439e26b1ae3ce5c5488dc1c95938"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/MapboxCoreMaps.xcframework.zip",
            checksum: "3bde50b2a1fb345e5efdc149091e939e8d0a439b9c25ddf84b3e3321a09f5703"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/MapboxMaps.xcframework.zip",
            checksum: "8d51e1900f0045ef4a2cdeddfd201077712b16b01a4932f6d7172382be433a7f"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/NordicDFU.xcframework.zip",
            checksum: "04b478165cd4952177ac72e20ec3deeeb92a136bc6f62a750896d5cd5167562c"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/package_info_plus.xcframework.zip",
            checksum: "af32d17c29318a51591fd21aba0d0c6bdb802c5f14ec0b996e42e9698ad188da"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/path_provider_foundation.xcframework.zip",
            checksum: "a75eba4a4c9f08b3fe3db6291b2113bb193eae7de12d98b7eb462727984b4fc7"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/permission_handler_apple.xcframework.zip",
            checksum: "247373e5a079f2ee4bea031b4c3a73e4fcc560aae8b1e0ed4c99cb3f05722e41"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/share_plus.xcframework.zip",
            checksum: "9bf5cbb995939ecfe21d2982befa1f38fa33924bb4d7d06906341412125f2e36"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/shared_preferences_foundation.xcframework.zip",
            checksum: "8f7848e74e9fdb217b09e9cca10b6f9f1b6364b2e4f7b083352a245cc8faa224"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/sqflite_darwin.xcframework.zip",
            checksum: "4d9e0305463356dc70eb75ee47467397bce1f9d0a0a861e8e039c794bdaa41ee"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/TOCropViewController.xcframework.zip",
            checksum: "514c01d49d0f9a259395def875639e41e3f63b55f52cd4875e1575f3a8c8ca1c"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/Turf.xcframework.zip",
            checksum: "1f3ad7224d0c6a8113c1e961e45bb2674d60a3ee5df0a8b42188d6178883d6f4"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/url_launcher_ios.xcframework.zip",
            checksum: "af096667ced4bb7d27c17ab56441af05703b786bb80afcb723d36b171502f8bf"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/video_player_avfoundation.xcframework.zip",
            checksum: "b5966f79b8c385e8c473999320a2de2a4e80d8628d948821d0f1677a5ca1ab16"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/wakelock_plus.xcframework.zip",
            checksum: "aa8a83809f8dd550c8a0f88fc765e290d6983ea86d90b27b29d6698e24635683"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test/ZIPFoundation.xcframework.zip",
            checksum: "f5ff40f83fde9f56124e90d7a1fd2fa0366f1f6fcddc28ab75346639cafe5adb"
        )
    ]
)
