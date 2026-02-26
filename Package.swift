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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test/App.xcframework.zip",
            checksum: "4fffeae77a5e99237f37ed59589f749d87fb5510a1ca85dd1f2cc63dc4214d73"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test/Flutter.xcframework.zip",
            checksum: "092f9fd0f44f29f62234c5065868bcb14511105cfa7741556082a3a02f43e8e3"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test/connectivity_plus.xcframework.zip",
            checksum: "fe924759ed46eef1ad7f706cfa05a6b34b1c7ac7b4205c04617c05b00a39a3b6"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test/device_info_plus.xcframework.zip",
            checksum: "ca6156bf9b9a7c50483fa05512a4a06f182191c797a3d9b5a72da33c23a92503"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "c05352a5c21605ebc4a32626286d6f56b2a6e0ca5cb684405997b2f1777970eb"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test/flutter_local_notifications.xcframework.zip",
            checksum: "4cb4eefb65815900583eec5f6181b87175e377102629f379e1d444ae97c94a8f"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test/flutter_native_timezone_latest.xcframework.zip",
            checksum: "d33eded6fb0afa7e5497eaae895d7d4ebb28e77fea4cd87764390fe0b1f09f72"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test/flutter_secure_storage.xcframework.zip",
            checksum: "758217e0c474b104bab1a8ff1a0731d1027f2a3c94e9e2e34b5de14691b928c7"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test/geolocator_apple.xcframework.zip",
            checksum: "d6ceefda55f5a3392130b9c18cfe1080eb058ece1f88c80762c64854d21c2153"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test/image_cropper.xcframework.zip",
            checksum: "01345f73b587af887d3fa039284ac5dc58a1a9a7a420e2df1e7c00359e9505af"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test/image_picker_ios.xcframework.zip",
            checksum: "4c8aaa45436aa9efe74230909ef9a7f73a6aa54bd56e42261df2b3ecd14dac6b"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test/mapbox_maps_flutter.xcframework.zip",
            checksum: "acbbbda0dadb88d2ea12b292e9e146433f40ae0aa829122d98dde5ad612a35bc"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test/MapboxCommon.xcframework.zip",
            checksum: "61b6f326ace4dacc08f90a4801eccaa68f1e45bb576b88a83e07711b5109284a"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test/MapboxCoreMaps.xcframework.zip",
            checksum: "2f179ee2190e2781edac5665a7337ff9748e3b4e3ab008e1f4774a1c636f4d4a"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test/MapboxMaps.xcframework.zip",
            checksum: "5b1fe79df07fd3c27612aa6f7847913a7652b45be9724838a80c99d223f191a6"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test/NordicDFU.xcframework.zip",
            checksum: "bbfe05c8fe58d8f32bf295d5323a90a458229ecbeb052702cc6c3eafb831f4c5"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test/package_info_plus.xcframework.zip",
            checksum: "b6febbc45aaffc902b98af5c97a010ee69265f0988675879f0dd0c457bdf01e8"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test/path_provider_foundation.xcframework.zip",
            checksum: "e81a2da2510c782a21d4d70cff6a5864f9d37aa122af044edd6604ad49881b50"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test/permission_handler_apple.xcframework.zip",
            checksum: "dc9da6a860cbadcbb38aa26f7a20842a8ee441972d00ec5470fa735002fb3b42"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test/share_plus.xcframework.zip",
            checksum: "b0a02e0540855ecf425aece850cee8b11ebdf96acddc68a8b850c0e061fc755d"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test/shared_preferences_foundation.xcframework.zip",
            checksum: "8722c5bb5458ba32a02fedafdbfe0eb7f8121410b4129e2985ed1d774362bf15"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test/sqflite_darwin.xcframework.zip",
            checksum: "eb328b5c6eefa7b176f9ed2cacccce285817bde98998e9d1feb3351ae7f97947"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test/TOCropViewController.xcframework.zip",
            checksum: "2635c70b818082176de19b1317a1077dd29e79ccb9293652383467d7cad73c53"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test/Turf.xcframework.zip",
            checksum: "a7346d2b93ac8a22dbe43f480c9dbe578dea2f08aced6ccaf1318fcca78791b5"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test/url_launcher_ios.xcframework.zip",
            checksum: "011596757bba0dff2e15eacb459d1432eddf7814df6ae53310b9fd64d644ce17"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test/video_player_avfoundation.xcframework.zip",
            checksum: "fd9653fd3280dd56bddeab94fa486e6bf1b1a7b409aec74fe5bc0f34054816a4"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test/wakelock_plus.xcframework.zip",
            checksum: "c9125f10cc89e9b36d5ec5397ba67462a2e015ee1d79fe5aaff2d7b463f13e03"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.7-test/ZIPFoundation.xcframework.zip",
            checksum: "d6e421b3b7fe86472430920e923f74486935c4ab9e969d48399da15655b81af7"
        )
    ]
)
