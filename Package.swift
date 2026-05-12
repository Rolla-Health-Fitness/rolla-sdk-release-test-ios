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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.238.1/App.xcframework.zip",
            checksum: "0464a39d516dfe0a8a1dd6dd2c460993385a382fa450c65a0c04e808e7ba71ec"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.238.1/Flutter.xcframework.zip",
            checksum: "dd6cde099fc1fb512b3d12cbf565bb7dc1a31f326327d8fb1a6696541d7cbfdd"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.238.1/apple_health.xcframework.zip",
            checksum: "49f0987bd883b2e39760326ed49dd1e06b0cecf336b0d0009579779dbdf4f609"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.238.1/connectivity_plus.xcframework.zip",
            checksum: "62a9f8d7570f10d3d0ebc42cc8e4ef9db594a667914e81bfa308686822fa871d"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.238.1/device_info_plus.xcframework.zip",
            checksum: "ac8bf898de02df888e51b5ae6339cf16c057ddc5fd3bfbb4a2a11ad0ea1570f4"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.238.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "19c9844dd8c6a540adce76f8469a278f5f95ccc0dbbc771e456851a693504f1f"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.238.1/flutter_local_notifications.xcframework.zip",
            checksum: "a7e1ab2740c65295a62be2860b736d40891eadb53579965240e5a2815e92cda6"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.238.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "95fc22f232d60c85702b33a3ddbef4f2a2df9837716dbffc18bdfa083b581d63"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.238.1/flutter_secure_storage.xcframework.zip",
            checksum: "03418d5fb26e2bc3972d32a352a3b51140d140898f5bd9c8535525c6b2163587"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.238.1/geolocator_apple.xcframework.zip",
            checksum: "dc5cba17e2084fbcfcdbd3825417337343f16d0c9c3308c11035ec2caf78a326"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.238.1/health.xcframework.zip",
            checksum: "5cc514576cca18249d2ff3defac729b6667c36c01ee0fcad4486d9d890b9af26"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.238.1/image_cropper.xcframework.zip",
            checksum: "0d6fb64ade51e21f86895c4ae528fd36265738dcb6e97316035a1505b02a21f8"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.238.1/image_picker_ios.xcframework.zip",
            checksum: "2910f7fab3552c7ddfdf50a0c8fcdac995e50676f466d143a4a7621e77e434ea"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.238.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "067d558560627d1406bf490bdc99a1bf32a4dcfc603e5739a20d9c90a1926545"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.238.1/MapboxCommon.xcframework.zip",
            checksum: "570742a7b48085453cab77658acad70e6cec3e3287d4c09fba9aed83f95e3f96"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.238.1/MapboxCoreMaps.xcframework.zip",
            checksum: "e87b23374efcec6256ade4408f72e49d06a6131bfdd30506f8779ec74065c41d"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.238.1/MapboxMaps.xcframework.zip",
            checksum: "586e2abdb98d43c47a818b5c3429b6edf60eda4295c2284b4a6f0d6272973a3a"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.238.1/NordicDFU.xcframework.zip",
            checksum: "753cb7a58ad00fe492521c3d92beba5d4fcf6c8c0d6dd35545775c94cb47a7db"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.238.1/package_info_plus.xcframework.zip",
            checksum: "216cdfa39abbb8231e53795819baa4e24beda778e3db5f5d7cbdabbf9981ccab"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.238.1/path_provider_foundation.xcframework.zip",
            checksum: "d415ee0c23051d11af1cf4f8e073920ef75678797dc87b8a4b44d871b48f7a10"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.238.1/permission_handler_apple.xcframework.zip",
            checksum: "eb22a63ecb43fe776db016e914676cf9884ec72584fe51e53a682c29f9e77a47"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.238.1/share_plus.xcframework.zip",
            checksum: "372b01a6af2e979681c52c432ccde205a935b89bfa92efc0f6eda5b87c9f9f1c"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.238.1/shared_preferences_foundation.xcframework.zip",
            checksum: "2c7d5bb9141aa3a98337a1d1c00ea6290c879d8fc86d08315b1be49cd0c2af74"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.238.1/sqflite_darwin.xcframework.zip",
            checksum: "d02a5b44213885a0ec20ccf1cf701464df1d7461cd8de8dc2fc7f79b45992db8"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.238.1/TOCropViewController.xcframework.zip",
            checksum: "fec91108507569429d880feabbf5430f784d8b40d27a126cebd6aa8ec7dfa12a"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.238.1/Turf.xcframework.zip",
            checksum: "4b1326bcc3381fa0853835e7793f870645788ee43e8d428213519c819364c009"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.238.1/url_launcher_ios.xcframework.zip",
            checksum: "69acda9696f6e32e7023c65f1e6b78dfa5a8ce8815833570f883d6dca72497be"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.238.1/video_player_avfoundation.xcframework.zip",
            checksum: "9d693a8457daa18fe8659651debad8c99f08ffebb83b453c79da3d0fa25dad40"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.238.1/wakelock_plus.xcframework.zip",
            checksum: "920b0407e0d2e25fc9ded45caf870f10afc964b83dd9745597b5006fd50c0106"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.238.1/ZIPFoundation.xcframework.zip",
            checksum: "5da6d6f5fa006c6cf70663b871141d17210da24f02344f74e6f3543bb2dba7e4"
        )
    ]
)
