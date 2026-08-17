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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.337/App.xcframework.zip",
            checksum: "9546fa8a59591e4cc30cc9df1438d55f6c98c4589cce5d71cf4d337598c35f62"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.337/Flutter.xcframework.zip",
            checksum: "bd6f13068be00cbdb6dc2fe708c70e93d715e56e315e1e514f4a9fb2d39e75f4"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.337/connectivity_plus.xcframework.zip",
            checksum: "ce272d2a14e35e12dabf6273143158f5e7beefef2a356934b1f37b631c993667"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.337/device_info_plus.xcframework.zip",
            checksum: "008ce4696266a7fd319b6e763d0caf87ffd5c5e9a48fec5283d1bd530f3991e0"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.337/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "658d6c093affde7afd26091968fc5dd027b38acfc0d8edb7882531bf6f5ef384"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.337/flutter_local_notifications.xcframework.zip",
            checksum: "7a18506952c614686da2ec227016bcc5de79dee4a6dbf8a513b3fc645cfa25d4"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.337/flutter_native_timezone_latest.xcframework.zip",
            checksum: "a03e62f6b95ae458863fd6b270e1c7934f16348981378d2b321d61f4d0ea5895"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.337/flutter_secure_storage.xcframework.zip",
            checksum: "e58fedcc0b0779185f720cb38fce0819be4fe964256cdd287f9769aa2f2ce930"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.337/geolocator_apple.xcframework.zip",
            checksum: "fa2dca4f7c9c0fd1cd4df27c8bef7896bbf55bd297639a56a9799a4a31b7aff6"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.337/health.xcframework.zip",
            checksum: "73ae8d62a0750298d3ba3ec2fe13263b902f8d8050c6e184df56ea3ab3cae1ee"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.337/image_cropper.xcframework.zip",
            checksum: "d0c6d3fef77fee7e535a0c2939baf383ce72d49aafd293c7113a5b56ce6389c9"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.337/image_picker_ios.xcframework.zip",
            checksum: "ba5813cac1dd927f88f4d99a1723ccdf8dcc9a1cd86c7cdcddc9dd3450a56460"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.337/mapbox_maps_flutter.xcframework.zip",
            checksum: "f15123d1b2fc6215f20db7b1ebc13d4df300c57934649d1a9b577e4caf63716f"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.337/MapboxCommon.xcframework.zip",
            checksum: "d4973f5ac9285c4b698e18c53d51eeefa93c10d0a525708853123264d80e7e4c"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.337/MapboxCoreMaps.xcframework.zip",
            checksum: "9cb7ef7d858e636d27a9df09e2c0fbd797f98e55324bcf54e7995bbaf5b0ca80"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.337/MapboxMaps.xcframework.zip",
            checksum: "4394a2ece749f4b55beb6f8dc64eff7181f0019825c057685c0913bca1f25305"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.337/NordicDFU.xcframework.zip",
            checksum: "0eceb4b570ad965e69bbbc462d8a003c541df9bea93725b6960450d961dc2e61"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.337/package_info_plus.xcframework.zip",
            checksum: "899c522b9237728817fd13cc71a71722d37d62e9a73e4e7a3bfb37b1480188db"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.337/path_provider_foundation.xcframework.zip",
            checksum: "e252657513ffd25c16f83e4b4c4023dedf2b9cacfe134cf0a2453f590ae08cc1"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.337/permission_handler_apple.xcframework.zip",
            checksum: "154cd7ef1322e961e00031f4c73891a742f97d25f8e8168d7cc7d5e51a9f158b"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.337/share_plus.xcframework.zip",
            checksum: "2ee08494d2226df3599e8bc20fefd326c56d0607ab8ecfd7b58e95c4f572cd0f"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.337/shared_preferences_foundation.xcframework.zip",
            checksum: "b0b12c243bb479d37bffbf1ff84ed32aa13eb717de86896ff8691a55c7838c34"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.337/sqflite_darwin.xcframework.zip",
            checksum: "74e32bafa61e284d349e16fe6c1877aa9e3bf9195313199edb7523116fde0e3b"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.337/TOCropViewController.xcframework.zip",
            checksum: "52681f8fb95558aef9d92d289260f541688b0cf3674297cd73c818d5ae801a16"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.337/Turf.xcframework.zip",
            checksum: "f55f4c3d1d28e2283e0ea9ee9a305fc15b36faa149cce596d632d972e074e8c9"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.337/url_launcher_ios.xcframework.zip",
            checksum: "e8739462460255d277a9e0a53af101eab4907e283ca47109e44c023fe0214a0e"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.337/video_player_avfoundation.xcframework.zip",
            checksum: "6af002ef09afa5381f095b58d874741b3ec827f38b589b4524370e75e50faf40"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.337/wakelock_plus.xcframework.zip",
            checksum: "197fe8ba927cfe6f94f32bd35b5e6c0ae7e873cf21c537fbf6e5969fda6746c5"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.337/ZIPFoundation.xcframework.zip",
            checksum: "794c54cfbd4f48015306bb8af117c3ad7ba6750e409cebe6c5644077c52e70de"
        )
    ]
)
