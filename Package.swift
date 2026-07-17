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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.28-test.311/App.xcframework.zip",
            checksum: "f82780474f87891c7c74224127ac928591a879774e42cb100c02a09ccd8e0a74"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.28-test.311/Flutter.xcframework.zip",
            checksum: "f3db4e095f59527fcbddbb3692bbeba72a448b34a4ec1c2fcc3860a0010956a3"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.28-test.311/connectivity_plus.xcframework.zip",
            checksum: "43f039c5ec39c5a65972f53860a2d51b6015628a9f370251aa53a84339abd055"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.28-test.311/device_info_plus.xcframework.zip",
            checksum: "034d0fdbf6f71964eabab02c546fb87e43db346209380324194c1161494a95f8"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.28-test.311/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "3fdffe87e70d03ecb767c76de195dfa0bde41b1099b0837ecd1635fd3f808640"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.28-test.311/flutter_local_notifications.xcframework.zip",
            checksum: "224f5d2990b06461d53234fbfd0871f63808c9ec4a84a4939816bf4753f8375c"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.28-test.311/flutter_native_timezone_latest.xcframework.zip",
            checksum: "603945ee12e7fcd1096499cd06af8207cfef56f143f0001b8e72c7c477340475"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.28-test.311/flutter_secure_storage.xcframework.zip",
            checksum: "6d994bf7e7ad9e1ac80c337c3398218357c5de5040565b52c451abc563ffc10d"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.28-test.311/geolocator_apple.xcframework.zip",
            checksum: "2fc8be7bc1cfd724666fbbeb79f69ce2b952caf99edf7d76971abf55f5ba9224"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.28-test.311/health.xcframework.zip",
            checksum: "abe3b0fa96db615081addc9ea75c95d0f061200bcaee8444d138031f12ab68b2"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.28-test.311/image_cropper.xcframework.zip",
            checksum: "3f8de3ecbe95e73ab0028d21a830424958cd81a483647455b576ad125cc0a7e6"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.28-test.311/image_picker_ios.xcframework.zip",
            checksum: "5d130d438312edff5d7e3e41e102c6a60667ca7da9defbe27577ef117e26f242"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.28-test.311/mapbox_maps_flutter.xcframework.zip",
            checksum: "9dd4f2698f2b95535d8122befc63721f3b2785450a837e813dddcbd6eee52fbd"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.28-test.311/MapboxCommon.xcframework.zip",
            checksum: "608a58db7fa11afbb3b259bb75ef1dff297474f02670799a3f37f5ceae11d48a"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.28-test.311/MapboxCoreMaps.xcframework.zip",
            checksum: "967438bc46ed0a2da795e093bc3c7159fe5385b878bea87f86f49ba7dd5f30b7"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.28-test.311/MapboxMaps.xcframework.zip",
            checksum: "d823c01561cf3e67eb212f9f003bcb77cca62362d65c17b6d91505bd1d96abd1"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.28-test.311/NordicDFU.xcframework.zip",
            checksum: "e1d4bd4afc70c220f76c183dccbd605c9040f6cbba1c5665d340f7b98b6da414"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.28-test.311/package_info_plus.xcframework.zip",
            checksum: "9a6450c3e48aa558e0cefa46f5209d01f53c7807962f8d395e2717fc10990ae7"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.28-test.311/path_provider_foundation.xcframework.zip",
            checksum: "b57f5a8cbd455b46cc475263b6c700bb82b03a7ca8112736fbec73aab5a914f0"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.28-test.311/permission_handler_apple.xcframework.zip",
            checksum: "32e1f02d91d77bb0940a852675f1f89bc0a78be6e7eb71ade9a0a3dee45c1290"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.28-test.311/share_plus.xcframework.zip",
            checksum: "a501a684ff485b97898e5a1a802a4b817ceb9f99c40d61ea5cefbe38d3a6647b"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.28-test.311/shared_preferences_foundation.xcframework.zip",
            checksum: "e8f39b3001cf1ad3f199257aac3dfb4aa7fb708383112ac1e1f2ccba9033c6d7"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.28-test.311/sqflite_darwin.xcframework.zip",
            checksum: "6c66d310882114c71ceb306330dda058330b9357a5a0cbd2b3d04372f07d04ca"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.28-test.311/TOCropViewController.xcframework.zip",
            checksum: "ff6b55c3f67365a057bcde268136cc99c435b26190dc7985cc323e340f4d5eee"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.28-test.311/Turf.xcframework.zip",
            checksum: "199b2344559aa9c33fb6937c8b84194f4c6bb7ec3ce5089dc5d02b0a785d8184"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.28-test.311/url_launcher_ios.xcframework.zip",
            checksum: "35443764d928c2493a408db5b25c08df296b4db8f62308831ed910804ec71b00"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.28-test.311/video_player_avfoundation.xcframework.zip",
            checksum: "9c7bfcb230482cf416e29f8ae4cdf17d48898ac6254236e1d028ce3ef701ed00"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.28-test.311/wakelock_plus.xcframework.zip",
            checksum: "12712be666d42f41f41fd9ca8bfbd7a8f5b4ae37bb690808290e28f58571ba6f"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.28-test.311/ZIPFoundation.xcframework.zip",
            checksum: "c35e4d297fbb75cf037e29804205aabe4367f5a0f422a44635b3302282759d14"
        )
    ]
)
