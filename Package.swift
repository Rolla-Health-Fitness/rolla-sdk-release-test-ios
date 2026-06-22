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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.268.1/App.xcframework.zip",
            checksum: "7765364bf5fcfabe791e400947bd55fc1d14b11791bf1ca521203220329e9293"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.268.1/Flutter.xcframework.zip",
            checksum: "80fe86d8c77257ab096a856863f491e958d586374ecb190686d850da1c250d21"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.268.1/connectivity_plus.xcframework.zip",
            checksum: "5248c48c9472984cbec187b39fe12cef076cb97d0e87663c38850d8f44475ab2"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.268.1/device_info_plus.xcframework.zip",
            checksum: "163c1989060ef6df73e96ab2a87d5037749ac993234349b2a1bd19a5b1ca964b"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.268.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "30290c7355a7fdc762a1514652e179c0a00481aff8d84ff6aa9c28cbcd3fa445"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.268.1/flutter_local_notifications.xcframework.zip",
            checksum: "9d93f068455cd7b2bdaede044cb7e4b694565be75b464fb2a735f26539d21db1"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.268.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "2278ee7049fb0a3681d6ec89187a89e873aa949dc167dad75f0693bf1aa44811"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.268.1/flutter_secure_storage.xcframework.zip",
            checksum: "ca12d1e8ae4096c86f6c6a8f17e79f7e0e6fb79d40d34576fcb6d4c0ab49b8f0"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.268.1/geolocator_apple.xcframework.zip",
            checksum: "644269c20602d286fb6c3d0556d2f76442256225d5b4e9d17c44b12b360cfdb6"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.268.1/health.xcframework.zip",
            checksum: "db5b44ef16d0519ab7a8c44cd58a7202893acc8abbe722eb318b8501cbd8aced"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.268.1/image_cropper.xcframework.zip",
            checksum: "f49b0c3bb90cc5e1b5a4a5ae2fc9595b94d6866149c30661a66951f8ec1b9df3"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.268.1/image_picker_ios.xcframework.zip",
            checksum: "88aa80c8c11fa2eb76d5dd691f3cc8a411699eded329fbd938550c141a9acfd5"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.268.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "5ece9186d36b35e62b99d70b1cfada29fc1b1ec8063f130d35ed257fe655b1ba"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.268.1/MapboxCommon.xcframework.zip",
            checksum: "89fb7ce89e2f8bea6b2e96e67d12959fea1c75271e8631c7c206afb78f317abb"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.268.1/MapboxCoreMaps.xcframework.zip",
            checksum: "22247f73855ba19fb60c6ddaa391f571347ce2572c62d6c2bb9d5e1404876057"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.268.1/MapboxMaps.xcframework.zip",
            checksum: "87e178c93f1a6e287ecf7e0dcd46d0fdd8270dfe0c7c9af511a57c9115b1c2d8"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.268.1/NordicDFU.xcframework.zip",
            checksum: "c12c1f9b9130d3cc1e7a9264932fd00d909dd83d3163a6a8cc6bc21b424b10e2"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.268.1/package_info_plus.xcframework.zip",
            checksum: "ba89f0acc914cd9d49f350734c1e864b3d02faa9cc812dab6bf6ad5edc1851be"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.268.1/path_provider_foundation.xcframework.zip",
            checksum: "43dbede96a99f8003c142ee9d020b8a93b3ad2b5557830001b777e35fc21c0ef"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.268.1/permission_handler_apple.xcframework.zip",
            checksum: "62e322c15b082ea9959205c44366bd308af519e10e6755130e432701fe3e7424"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.268.1/share_plus.xcframework.zip",
            checksum: "791e45afecc16937acf975e46963e0cbfe6a0b949385575c17f5c0da4e736b29"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.268.1/shared_preferences_foundation.xcframework.zip",
            checksum: "48874ddcad8322ef8bfb5dc91f579e3aa3196b6b2553d75bf06b01cf43af93fc"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.268.1/sqflite_darwin.xcframework.zip",
            checksum: "8cbb919a9a756b228db63deb6bca77cb03fe61b89c01fd5d5e49914c8a6e7aad"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.268.1/TOCropViewController.xcframework.zip",
            checksum: "fe90df05463915a6872be6d03ca553e1ee78257ecc6ca63bee4f6ee5e9057d3e"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.268.1/Turf.xcframework.zip",
            checksum: "50fb266cf7f38c16fea1ec0cc6e2c41a9ba27eba10d8e7c7b7169058b829e05d"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.268.1/url_launcher_ios.xcframework.zip",
            checksum: "c85fdeba3337ab0f3e058fd20b167680f48c25e79948391c2556192622485c66"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.268.1/video_player_avfoundation.xcframework.zip",
            checksum: "14ad92b74c791d9ab2ca507c91db06b6be845be5fee9419c53157e322ff19523"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.268.1/wakelock_plus.xcframework.zip",
            checksum: "6a3fa317da5771845a3d8a210502b40247f7a24b26f25e79dbc61ab188186f64"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.268.1/ZIPFoundation.xcframework.zip",
            checksum: "5bb5d1163320d46c9426c639e1a2de5dd29f319d132260e4f82e8cb6c7e7cfed"
        )
    ]
)
