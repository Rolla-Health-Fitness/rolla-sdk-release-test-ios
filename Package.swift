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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.317/App.xcframework.zip",
            checksum: "5dea24fb1bf3e0105f446514a617d7fe9fbfa0bfb81e85d6ad4f51385913c993"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.317/Flutter.xcframework.zip",
            checksum: "187288d8a01245fd4038e54d26dd8c92b291ac6f519023f44d6ab429a646f10a"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.317/connectivity_plus.xcframework.zip",
            checksum: "9d3a466c73aad18a50d08fe9953445a919bdc7cbab5c3c5f3d1570fe049cc409"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.317/device_info_plus.xcframework.zip",
            checksum: "fd746f38bef60d99123b9352e330df70b9be508ca31f4332b00aed256259ba8c"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.317/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "9b5d3c713da50badb3017315f56e428041b77fa9eeba13dad4a1f35d71d3daaf"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.317/flutter_local_notifications.xcframework.zip",
            checksum: "15499fb0b24fde1d17bd59aa97d581947377928e8b5cb04b59dec2d4cc7db17f"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.317/flutter_native_timezone_latest.xcframework.zip",
            checksum: "4e2e72441b332dd67f55654eed1e2185b1a46f2a074c164431e1e22b828b70c2"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.317/flutter_secure_storage.xcframework.zip",
            checksum: "dccabfd5453db365d36759783a2cedefe4ac38ef340434e3da82012343c7edec"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.317/geolocator_apple.xcframework.zip",
            checksum: "df835b30321c7be5abf2c1a1327124ddb72a04ca90cfd8b5197c9a602357b8b9"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.317/health.xcframework.zip",
            checksum: "7eb94e784116f9784e17ee365fe9aea2cadee3fc6e2598214f8a18ffb025540d"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.317/image_cropper.xcframework.zip",
            checksum: "44bdfcf16207f1367a86f95b74e58d99c769047caccca917c55452e53e27c4de"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.317/image_picker_ios.xcframework.zip",
            checksum: "9c1ba007eadb36e8773bf9a36157ff240dffbf94d5f19e26e2138ca57aaaea88"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.317/mapbox_maps_flutter.xcframework.zip",
            checksum: "be288131c86b0724080133bfe02d8bdb08d9690ba64e065f3b924c4525721c3c"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.317/MapboxCommon.xcframework.zip",
            checksum: "fd1890be1a89cb86d76c9658a46ee1fbf845376b2a824c9a6896e01a9540a1d5"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.317/MapboxCoreMaps.xcframework.zip",
            checksum: "b7176492c4a21760b0bae55aab6d0b8941233ba8b0b10c01baea35c43208244c"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.317/MapboxMaps.xcframework.zip",
            checksum: "d4c80cd1bf2ce10351a0c6de79cd36bb596d3140621e723d9de737ac2cf94287"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.317/NordicDFU.xcframework.zip",
            checksum: "5056991c3bb70412f3cbbea98b0dedc40d808ce7951b876f7c3858416240a2b9"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.317/package_info_plus.xcframework.zip",
            checksum: "a18de942f456214b90fc092eb149ec1afef882b4cef84f2390817f709e0f61c8"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.317/path_provider_foundation.xcframework.zip",
            checksum: "dd37b99807f28bb0e47c9194d017cd9de4954c4b33e0ecb6048f30d188c9296b"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.317/permission_handler_apple.xcframework.zip",
            checksum: "ef546f6ecee3a7ca5f351416331ca61378a80cba17bcf38e925d89b1c930979d"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.317/share_plus.xcframework.zip",
            checksum: "e2b66d08079654cc56fb287bbe43a777fe3cb266af2ef18a62467fc5d04b8066"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.317/shared_preferences_foundation.xcframework.zip",
            checksum: "53ecd7f0fc9946a6c8bb1a1bb5aa3129a078c8865414885ba8e40b9e9588a508"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.317/sqflite_darwin.xcframework.zip",
            checksum: "d86ead5ed5713af82304f52a3e20c4dd35101f34d9b2d39d61bc316dd87ed2d4"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.317/TOCropViewController.xcframework.zip",
            checksum: "7717fc712200e68cb475302777e37323ca26c403f18a35cbf70be8dc9d97acdf"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.317/Turf.xcframework.zip",
            checksum: "cb305d1d9754f7838638da022161d5c91dd6111182d04db1f7fc33744f3987a1"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.317/url_launcher_ios.xcframework.zip",
            checksum: "84b70b9f4b71329748a791ca503b2440d8846a9a4ba87fd631f2ee6fbc9c87c9"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.317/video_player_avfoundation.xcframework.zip",
            checksum: "928659650943ba4390ba2305a16467d93e097f98f58aed4abd4d13db645fc3a6"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.317/wakelock_plus.xcframework.zip",
            checksum: "dc7577db29db0b3ce331568360fe6fc00638a2085f2aff491b195da13127e7a5"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.317/ZIPFoundation.xcframework.zip",
            checksum: "793c284f4fe329ba0a39a9aedce096e047e356044268c6135efd7e0b20fbaefa"
        )
    ]
)
