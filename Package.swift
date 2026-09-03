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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.40-test.350/App.xcframework.zip",
            checksum: "d4e2a8d70f750cc0e0b430ee145ccd9c365d288478bd5e1e0e2569d600e89119"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.40-test.350/Flutter.xcframework.zip",
            checksum: "c04573792f65f7e036f9ae2618260a032a7517e1c21b982b9ed774f79065fbd3"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.40-test.350/connectivity_plus.xcframework.zip",
            checksum: "2e79cf6b6e2f87591bd4b5a29145b56ab903c78875c5058d20ec79ab75b8843c"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.40-test.350/device_info_plus.xcframework.zip",
            checksum: "43807f4cf51e0d8653a41f4c9cf05e8072ba63fa097e95e711f176eb605807b0"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.40-test.350/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "9d5b82650e2c873e9eba35f2c269b1ce0217e0440768f6d8259dba9547d4dcad"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.40-test.350/flutter_local_notifications.xcframework.zip",
            checksum: "55e3f7a54a527f99731d4bd158c0917d8535aceefce45b2376b736fdcd689e1f"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.40-test.350/flutter_native_timezone_latest.xcframework.zip",
            checksum: "7ed96b8668f81f4b72affc6d539d0bb7e6eb4074a390205c566b3f25947493c1"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.40-test.350/flutter_secure_storage.xcframework.zip",
            checksum: "c8648273a1899d1bd8b48730ecba286ad204bd306cbc168545106cab62a5d743"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.40-test.350/geolocator_apple.xcframework.zip",
            checksum: "1b610dd8b0b8f6c30f6c3661b34dfb701a02460f58fda5594b8de4fa452805cc"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.40-test.350/health.xcframework.zip",
            checksum: "e071f45cbba1a476e56e7ebf6f9c8ca7c0d4deca1bc0615bf8a7936db3d9a651"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.40-test.350/image_cropper.xcframework.zip",
            checksum: "ff411bf0e88e8a7e226643fa7d8dfec7322a514eab79eb04b59a3322e9e49bcd"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.40-test.350/image_picker_ios.xcframework.zip",
            checksum: "f83bf4b4b5524325c005a0be3591a0142adbf71c5cf1d9090ee80be25ec4a49a"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.40-test.350/mapbox_maps_flutter.xcframework.zip",
            checksum: "5fdaa6db436eecc36f1f054a7842a53f2c4acbe2b846e3e5e098ebc3fab3855a"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.40-test.350/MapboxCommon.xcframework.zip",
            checksum: "2d168b6ae787354099a619f9fc9c05e4a32d2243c3406825392900633ab951b6"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.40-test.350/MapboxCoreMaps.xcframework.zip",
            checksum: "03325f5ccee6c18bd5cc86cb68a3fd1c035c4d48ef58cdd7823b89f2b5c09a11"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.40-test.350/MapboxMaps.xcframework.zip",
            checksum: "9e5f7d70eb06a7e6d2d75fdd5828cbd663bebe3cbab5aa8baea13af74abd20e1"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.40-test.350/NordicDFU.xcframework.zip",
            checksum: "69f63f295cc9b20e3bf2d75f57c902e27aef3083e4a1cd2e9a076dfc6cc9ea64"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.40-test.350/package_info_plus.xcframework.zip",
            checksum: "274529b4b1523572f8da17c37bdf2d1904c8379f036f0a829e42dd387151432b"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.40-test.350/path_provider_foundation.xcframework.zip",
            checksum: "c9c7abe28b6a3c9147d7235cda01dfae1b7d4daedeccc956984e1257c140a5ba"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.40-test.350/permission_handler_apple.xcframework.zip",
            checksum: "10ccf5cf1db85e9f1d510f38c214306d469bee89560bc7833a40a9cf0c4ceb50"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.40-test.350/share_plus.xcframework.zip",
            checksum: "756fcc6bfad41f09d374a2a74c97c04813b008dc9394b12f87dd7cf0e070220f"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.40-test.350/shared_preferences_foundation.xcframework.zip",
            checksum: "8f7f2bc7e18a676c81b0010e161c1867ef525c0c4b808125f28e254a98642174"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.40-test.350/sqflite_darwin.xcframework.zip",
            checksum: "abf3477837fe573b8157f6c431ee8185d4416c7b0be5a141236058d067050728"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.40-test.350/TOCropViewController.xcframework.zip",
            checksum: "768f1a2f0131e112eb2fda6f6e47865c28f54bec32e7652cabf2cbf856d957bf"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.40-test.350/Turf.xcframework.zip",
            checksum: "bad25996a5a5614ef652f875e8bfcf28ef064eec0993e302a18c87f1ee7ee2d6"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.40-test.350/url_launcher_ios.xcframework.zip",
            checksum: "9ddcbd5cbe64fc643a5c8ed1c5897110313d7ec9500ecc31d67fc7fb2b6a788a"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.40-test.350/video_player_avfoundation.xcframework.zip",
            checksum: "654e41955150efbbfe50f2b43918f18712bf4a8ada33889889c8d94aa51b8a00"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.40-test.350/wakelock_plus.xcframework.zip",
            checksum: "cc1fa50de6931c952eade751ae5f706a1b3f9ce98fb3fbc4a2becd4cbe75bea2"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.40-test.350/ZIPFoundation.xcframework.zip",
            checksum: "a5bf2a7bb69a35b6659a81e03d426717fb21d1cd932978e3befe9f278f99b916"
        )
    ]
)
