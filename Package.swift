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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.310/App.xcframework.zip",
            checksum: "4fcab5b357d207834e1eabf0ca9ac8a7fe348d17f83acae11fe36e66186bd686"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.310/Flutter.xcframework.zip",
            checksum: "dac5034158d30924b2ee0939cd59f63ba3b22b403d227087c5c0d4b641370f8f"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.310/connectivity_plus.xcframework.zip",
            checksum: "2551724dc9e9c2c15514cf64378987e1b89c3e16f04c972abbf04dd27dfd810a"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.310/device_info_plus.xcframework.zip",
            checksum: "1326ca4d0be6b1fab7332cd87a6298d685e13a710b5261ef390a4eb1ecd6ad5d"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.310/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "7d6c6a1e86f62af8865d34dae56992f4a10b9339570a8c8b0c8f8e99eaeebe08"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.310/flutter_local_notifications.xcframework.zip",
            checksum: "a795636be2c3b209047e548e1f1b3848562c31ef709da1284e0ec31afeff918e"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.310/flutter_native_timezone_latest.xcframework.zip",
            checksum: "16b0a182e9d2d52afdd05419b6022df1dc432614521bb3a6019297487feb6498"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.310/flutter_secure_storage.xcframework.zip",
            checksum: "8d9bf81feee93acb057222d05497c19528c733f635016f18bff5707b8c19af68"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.310/geolocator_apple.xcframework.zip",
            checksum: "3eb29e59c3f9946b371d2ff8336de816d983ed25d2592821fa6961e9a392eaea"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.310/health.xcframework.zip",
            checksum: "f4c22ac6fd3c6150a06e995dad5ef6fad6761b39a1788311b95ad6ba1b6e8d8f"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.310/image_cropper.xcframework.zip",
            checksum: "ce252db0ccbafcfe15bd6d74f96ddf7287583dcd2111eb9692dbe1ce73cb377a"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.310/image_picker_ios.xcframework.zip",
            checksum: "10f64588d7bd31384f2426a995e7e750433f7604ea2de649fe627d752019722b"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.310/mapbox_maps_flutter.xcframework.zip",
            checksum: "5e198c047a8f8c7888f1793cd0ef3d04baf490966671ccbda57b943847fe123e"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.310/MapboxCommon.xcframework.zip",
            checksum: "7743d8b8c1a1879d4a12ba45837276137b6f3940446811edfec86214254f91c1"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.310/MapboxCoreMaps.xcframework.zip",
            checksum: "442319651f2adc749fc64ec587d6cfe7672e6fa8304b5c0806d994f180d6adc7"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.310/MapboxMaps.xcframework.zip",
            checksum: "50cd9bc2f6ae6351586d9640504bb13c019dcac9b1b1745aa3142be37be333f2"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.310/NordicDFU.xcframework.zip",
            checksum: "e59bcae6333e7a28d439c62755d3b9fbccbf991f5d802e207acc650e23823725"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.310/package_info_plus.xcframework.zip",
            checksum: "43021a293ededf13a905e57823e5d4e0c3704bc0b3f260f8f4b9f9ad0a8227ad"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.310/path_provider_foundation.xcframework.zip",
            checksum: "aa547259e8caa7fb3cd8263e74d353799c6ca9225a0479f5a5018d965c67fa02"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.310/permission_handler_apple.xcframework.zip",
            checksum: "da716f1ab40bddfa36244ee75e12737ffecf706eac2ad2f455209988fc63847c"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.310/share_plus.xcframework.zip",
            checksum: "08b8728d17132b5cac398c86067a1e4ceb5755b1bc8e45e5d60a749e3118c456"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.310/shared_preferences_foundation.xcframework.zip",
            checksum: "f03e6d2cc2a2ba62f09eda13f884f118275b9ed0c456a077434f9af9764a50ca"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.310/sqflite_darwin.xcframework.zip",
            checksum: "711aef28cef7ee72b5feb7955456fc998c05c6ec8cb0445047718cb1218a71d8"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.310/TOCropViewController.xcframework.zip",
            checksum: "0cff3b5d7cd44d24096819276103fc05ed4b7d068eed653a3737793698490e1b"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.310/Turf.xcframework.zip",
            checksum: "6ab56ed02fe618b7e30ee56b329775dfafa4e5532624129cd9ea04d9cc2751e2"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.310/url_launcher_ios.xcframework.zip",
            checksum: "12d618d4cdf5f45c320bb679b386bbe16e84c0578ab608d0cf880bd546d41cd5"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.310/video_player_avfoundation.xcframework.zip",
            checksum: "1cdd80334d604acf75bb9a9b562548bcbae90bbeca1fa41a480217503a12cd83"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.310/wakelock_plus.xcframework.zip",
            checksum: "9e0f7991d76e7a36430bd5ae805f66cf77959c754355911ba0899065b75bd5b2"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.310/ZIPFoundation.xcframework.zip",
            checksum: "49b86810095cdc3473bd48a4fc8261adb981b67fcda7f418f187d6e60b9c7452"
        )
    ]
)
