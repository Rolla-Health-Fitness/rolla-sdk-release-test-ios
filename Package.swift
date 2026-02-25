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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test/App.xcframework.zip",
            checksum: "62951f979bfcaf5eb3797cdb9d1a8205a1a139a9871b3060d1b942268a98befc"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test/Flutter.xcframework.zip",
            checksum: "05d392dbcf58f4d9f56e03e236ec1b33dbf7f8480b6d1fcad4e4a173c0af709e"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test/connectivity_plus.xcframework.zip",
            checksum: "0d458e99370a20d5a9b6462de7b60ecfa851579dcdf31f86911b6f1298b46d4d"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test/device_info_plus.xcframework.zip",
            checksum: "7797661b819cb3191f682f797c57feee55e60d372a303956a364d4341cb3b9c8"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "f967c1053ea0344562976686459719e0a3eb6278d8193ad2740ad63b6ec8e699"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test/flutter_local_notifications.xcframework.zip",
            checksum: "71ce9122470a3342992465f08a4a9140a1cc0ced3a7dbe6f41aa6e88517310af"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test/flutter_native_timezone_latest.xcframework.zip",
            checksum: "65173fc4c13525bb892bd159a59f180b5e99e5d82dd056832fa1c7cec86e7f9b"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test/flutter_secure_storage.xcframework.zip",
            checksum: "b589333431facdc0d2a40b7be9cba14f52b9f753be05efbc5dbb30cac84fc589"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test/geolocator_apple.xcframework.zip",
            checksum: "950dc18aa4aaa138ba76e856dcc70a97566824901ada4d66b1ce6b0adda1df86"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test/image_cropper.xcframework.zip",
            checksum: "554b97acb2d420188311570d3fa202ab2cedbeef32e753b33d0f8fb125ced084"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test/image_picker_ios.xcframework.zip",
            checksum: "df19080ea14a2dea0ec8bbc8716518e9e2367fa738c8d6c0a4f4ea68dfc5148d"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test/mapbox_maps_flutter.xcframework.zip",
            checksum: "7582790bb586ba9f0ce0afa25be16d60db8266bb3fc9259baa364c3670fc21d5"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test/MapboxCommon.xcframework.zip",
            checksum: "2b4375a4d5f3c410c8403ee32b5083861e5af2f233e6f7ade52a938b94748378"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test/MapboxCoreMaps.xcframework.zip",
            checksum: "45fa75ff48881634b9c97cfa41df54387a3880994e89c860fa769dad9b1c18f9"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test/MapboxMaps.xcframework.zip",
            checksum: "c90a8ba0041262f72724a4a68cdcf37c65760f48ce7ff91a7d3ac9da7dd99eb0"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test/NordicDFU.xcframework.zip",
            checksum: "7e7be2f0388b949d82c32272f4bf88e470aec03025bf2fc2a1620c864305c6e1"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test/package_info_plus.xcframework.zip",
            checksum: "0672d0ac0457a019d03c46a56089a8ab564e2a284b360dfddb8df367e7a923a0"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test/path_provider_foundation.xcframework.zip",
            checksum: "1122f44892b37fa67e3aacbbfc7264ed2dfb646e6679c79d04a3477829ad94e3"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test/permission_handler_apple.xcframework.zip",
            checksum: "5014d68bb20dc49c0159b2ce1969a166cadc6b4bf30c96276f007b8bff57498c"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test/share_plus.xcframework.zip",
            checksum: "3655efc9c19c891d9406085456c85e97c6aa53fb7f1180e7fa9a71f16822ac93"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test/shared_preferences_foundation.xcframework.zip",
            checksum: "02baec7d071fe68a2106c13b17e9b700239a3c4062dac5982e9ef8f2836bf8cf"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test/sqflite_darwin.xcframework.zip",
            checksum: "77a3aec03fae4e74b0021827d4d26f930a862b7e36a18aa24b23791bac6f7199"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test/TOCropViewController.xcframework.zip",
            checksum: "cee66fe90392d3502726d02d6e10fc55fb7db89f21727e5b4fe5221e5dc9ef68"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test/Turf.xcframework.zip",
            checksum: "02ccf84a14a9428d32af7133041cdc63af8f5ab77171916fd4a30a0890f9fa32"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test/url_launcher_ios.xcframework.zip",
            checksum: "e785457e51428513bd9c986eb82d71c007703bb71455bd2302ea2ea06d74619f"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test/video_player_avfoundation.xcframework.zip",
            checksum: "d6103113ad35d9149010e0ecb6028114fe87fa7435048f427a2249ed99572f4f"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test/wakelock_plus.xcframework.zip",
            checksum: "a468668d10e60e33198e5539fdb97aab9dc6507dc92a58b566f557906bf7b6ba"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test/ZIPFoundation.xcframework.zip",
            checksum: "30e24746b962c350b2640a2e4f378fa5344aa440921465ad3ef98cab7d8f3d03"
        )
    ]
)
