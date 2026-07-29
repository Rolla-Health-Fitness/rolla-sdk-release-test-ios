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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.318/App.xcframework.zip",
            checksum: "ca56f34333868538366d190d96ace97d7d12a7a636430e7863f3b2b5ca643086"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.318/Flutter.xcframework.zip",
            checksum: "9b8b85a97d6a532803f435483b4a06bbd1ba33b12f43c00967899b82c1e275b0"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.318/connectivity_plus.xcframework.zip",
            checksum: "87fb8c3fc1ebebb7c6d889d9340324221d97566539c2542b38ffff75d720fbe9"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.318/device_info_plus.xcframework.zip",
            checksum: "5b98eacab2fedcbfc2c755c1837b309bf44e993ac10606e322d9eef555ec06f7"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.318/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "4a1db2e8db031ab3f420693b801345cf62027304aa5836d96fa8c5199c5f3e43"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.318/flutter_local_notifications.xcframework.zip",
            checksum: "c20a618d7dacdcdcff29d8a9db6c1e7e34442da208d91fb007edc3f9cdb79fce"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.318/flutter_native_timezone_latest.xcframework.zip",
            checksum: "a51d8b1e6210878da0a9a9b5ec9d259b2f6d9572b6d788fd1973406f3040623b"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.318/flutter_secure_storage.xcframework.zip",
            checksum: "985d222f0395742c9cc499d50e2ea6a2094bf72b568bf42c5ed7f23b3f1dc829"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.318/geolocator_apple.xcframework.zip",
            checksum: "568de9ecdd781f0c2dbad3ddb16e7ee9cd1ec7976d3d15c5f4c2e10c02117cfc"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.318/health.xcframework.zip",
            checksum: "fcea4af7cc86c4c2212da345f75718c5baba26b60f9dc2ca823b955a641cdfed"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.318/image_cropper.xcframework.zip",
            checksum: "e8522d0db66caee0aba577a831b8e1af85f2fb27db2808e02fb1fe5e92a1c3f2"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.318/image_picker_ios.xcframework.zip",
            checksum: "cc64d62fd3f42cde85167b5a05aa3469802778ecce0038833694cd6b8389a84e"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.318/mapbox_maps_flutter.xcframework.zip",
            checksum: "9c0d565ad44bac3fcca010d670a6758256f6a504a35ac6deb215ec5082a5408d"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.318/MapboxCommon.xcframework.zip",
            checksum: "5be670a0f318554d63443febb3462ca9dca0ca65cb168ae0a07d0b326fb11b4a"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.318/MapboxCoreMaps.xcframework.zip",
            checksum: "e588d99786d2f9d9b3011cf3e2e088927881151e0a28d18a9b3f0d32a373a306"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.318/MapboxMaps.xcframework.zip",
            checksum: "62be7f371e1d64ba9b0e484a78fd7e8e24868dead9b17e1906e1c677575be163"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.318/NordicDFU.xcframework.zip",
            checksum: "23b369a2b6e45e461b9d14554c476051f8f771a21cc37295b8a5d57358b2c0f1"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.318/package_info_plus.xcframework.zip",
            checksum: "b23c4b4fcf1cfa37d9bc213f8ee966900bd90c37588b3a76c27da8118b9ad9f8"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.318/path_provider_foundation.xcframework.zip",
            checksum: "32db537b7e6ea7102ad413be41277f9b3e0e65c4da0d69fd80b6e066b5527441"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.318/permission_handler_apple.xcframework.zip",
            checksum: "13cbb695b16924a1f4cc37128c483f34b150fe7d21f60705954ece9017e62495"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.318/share_plus.xcframework.zip",
            checksum: "4bc00633052c6f8c374710eddae6a948bb5793e58992bc212f2050714ce0d1c9"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.318/shared_preferences_foundation.xcframework.zip",
            checksum: "7c3d7bcc67bdf5ab600755ca209be92509b80df02e50da2daecfdda0657b098d"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.318/sqflite_darwin.xcframework.zip",
            checksum: "b9706f7a6544df90fee60b32f0c9c65d6f0b7c80aabaea940e4440cf5ab35280"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.318/TOCropViewController.xcframework.zip",
            checksum: "c26a9690f39c8bb3119266886866469abf22287579214d763fe5367075599ba0"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.318/Turf.xcframework.zip",
            checksum: "fd36f9a7e4937cb3b8ea07438b1d72167e3f3af2f955f9741c1ec632b2c77039"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.318/url_launcher_ios.xcframework.zip",
            checksum: "e6e87994ca26f38215d7df3a4c2a2a828387a673c47d492e94768cfc55e2e994"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.318/video_player_avfoundation.xcframework.zip",
            checksum: "5c1d0a18a521b372ef847be36e895c619957481d6d8bc9933d324b8b8fb88d03"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.318/wakelock_plus.xcframework.zip",
            checksum: "cb5365c9f2e637744855fdc4bac2cd66449f12575bc56ed322bab98b4516e3f4"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.318/ZIPFoundation.xcframework.zip",
            checksum: "0e03eafd7a13da36580406d1df8f35043354f72505bb18e5793f8b07e2c23bf2"
        )
    ]
)
