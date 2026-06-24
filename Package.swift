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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.273.1/App.xcframework.zip",
            checksum: "5ff3885919135063552a538b517685fe91985ef9dc5351ac8a1cfbaab7a17091"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.273.1/Flutter.xcframework.zip",
            checksum: "c74f894f62a49472473863a5da79254c05e554d4d49b9767e45d9772b977728a"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.273.1/connectivity_plus.xcframework.zip",
            checksum: "d446dd0c3420672032dca6833904aced9b05475f8351355fcbe6019a1f1953c2"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.273.1/device_info_plus.xcframework.zip",
            checksum: "f232d01e5f0e562baf7b30652c95450a2cfffef75d213e93b0b400d36ac4bf25"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.273.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "600a69cc90a7ca78fde0cb7310964839b9fbbd8d65e82d5873b1cc6dda565877"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.273.1/flutter_local_notifications.xcframework.zip",
            checksum: "f0ffdf9befe84399c40a2166c06c403e22e8f7f93fa57def9b59f437e41a9580"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.273.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "5487c86bb3f77b21b182d864fd4019a80098bd32ec74794ab7f52406f58a11aa"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.273.1/flutter_secure_storage.xcframework.zip",
            checksum: "0dba05659c26f1965898011fd4456828c5483fad6f9b1e1c42f38055432ed95f"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.273.1/geolocator_apple.xcframework.zip",
            checksum: "288c1bad04757ca0a3bfc4c2bdd06e97cdf35e81926425cd5a6dcd41ef27ab95"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.273.1/health.xcframework.zip",
            checksum: "ada02ff026977c6934604a3efb202bed8370df7d4fa6af1c8610e2e0ea577f82"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.273.1/image_cropper.xcframework.zip",
            checksum: "cba7d3d62913ed4cd235b3bac7078c49055ec3662a3ccb8a83c7f0593153dd46"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.273.1/image_picker_ios.xcframework.zip",
            checksum: "f7c2923b1a9d808606c87f2a14853ca84b808f80ff3c6c0c8778161fd31b0e04"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.273.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "08ed02921dd9b6206e1b5bc0118dc6501daaf1c690f3d7fcea97eb24c629f1ad"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.273.1/MapboxCommon.xcframework.zip",
            checksum: "8f103578c23064326841278ca960d13449aa5a786b0686d8a7dbc6707733b29f"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.273.1/MapboxCoreMaps.xcframework.zip",
            checksum: "34411f23d4f27b4ecd5d2448c8e63ac0585e3ba503c4c6bbd1cdd0413e3db8c3"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.273.1/MapboxMaps.xcframework.zip",
            checksum: "ac88f5354cf3799b6c733ce6e23e283835ff119b78c3447b640f9e7635b21b73"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.273.1/NordicDFU.xcframework.zip",
            checksum: "ddb70f89b65c968dad597d03407379d05509ecbe0ec4ff7ac3d8b36b1a693060"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.273.1/package_info_plus.xcframework.zip",
            checksum: "8a883cdb4691abf559dd6e59cd6d680f2789b8f7e721006ad970b4f68090c670"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.273.1/path_provider_foundation.xcframework.zip",
            checksum: "6252810a5b6363e1f47263090192ec110720cb72a7151b39e5ab25978eb80d2b"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.273.1/permission_handler_apple.xcframework.zip",
            checksum: "f688f9a334f93e0b2783ed1fd59809c3fbe6d54d68fafc353d9975daf810cd84"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.273.1/share_plus.xcframework.zip",
            checksum: "3326398e69f274e28c45778e1b8277a7e47ef9b2c258db397fb27e1459057f43"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.273.1/shared_preferences_foundation.xcframework.zip",
            checksum: "b6019c02a5338477ea7b00bff2d6ea1858f4a204a137281c17c859fcfff902b9"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.273.1/sqflite_darwin.xcframework.zip",
            checksum: "690481c0542a7fc1b7c675a2fe43b5ef987db6a8ce21513d1244f183801fa45e"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.273.1/TOCropViewController.xcframework.zip",
            checksum: "1ffcf6876799b61234afaf51c6795f7e477497f3077024c64e0f352af534264b"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.273.1/Turf.xcframework.zip",
            checksum: "207fcd52220d7d77c53d758a302c389fb1fb63ccc55884c405b9c12a37ae3872"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.273.1/url_launcher_ios.xcframework.zip",
            checksum: "21ba510ca78fae1aaa29ae69950fa0058e125f174fd074c0c69f11df3a4605cf"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.273.1/video_player_avfoundation.xcframework.zip",
            checksum: "f154cf04616eef0feb7438d9ce706a3c82d98c1a408585e2d1bfc5c6804806ac"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.273.1/wakelock_plus.xcframework.zip",
            checksum: "225bf9997d0d43a37d698034cd30c7452df25d59b4b03ced40b0eaaf4f4fc422"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.273.1/ZIPFoundation.xcframework.zip",
            checksum: "7a75e0207bbf76b46ba47782fbaba2a069cf47df8ce72ee5f6b3c83549bd26cf"
        )
    ]
)
