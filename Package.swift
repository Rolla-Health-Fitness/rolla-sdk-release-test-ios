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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.314/App.xcframework.zip",
            checksum: "0859eed71344d13b81dab41db26ec7f9e3cb44140ea1b58bf02aa9f1cdfc8185"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.314/Flutter.xcframework.zip",
            checksum: "c15877305a4893c5644d4418d9752cc8a091c295fd28b90a1ba1e1769cffdc9e"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.314/connectivity_plus.xcframework.zip",
            checksum: "eba0014da003b825de10c437a4c56aec443670e09a45fb873b8d21359385af6a"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.314/device_info_plus.xcframework.zip",
            checksum: "572a6ca61cfa51fb303ae2421a5978b80448a2637d5c53b1d827a997a4f48640"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.314/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "135b80851c48dad07cd7e5f7a57586998499cae90c90d380be4bf6f64c742186"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.314/flutter_local_notifications.xcframework.zip",
            checksum: "b6d9920ee6ae763dee0b30cf8189b65277b8d83235946ab794438a688f18b48a"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.314/flutter_native_timezone_latest.xcframework.zip",
            checksum: "a639c3db5db6e9ca447d5e5ae74f8e6dcfd94e73772ccbda3ade8ecad8c948f7"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.314/flutter_secure_storage.xcframework.zip",
            checksum: "dffcc4ba490b5cea902944a3e431dd73df4bc19c3fd0134406f4d0b16b7879a1"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.314/geolocator_apple.xcframework.zip",
            checksum: "f7a96f32f1e908f9c14c9707c6bff3236a1312d1eff117e333fd29d07d86a95c"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.314/health.xcframework.zip",
            checksum: "6c2d0b4f58971184396b696b83e30e898159b6e145c9a21cb58cf36eebca0b8c"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.314/image_cropper.xcframework.zip",
            checksum: "2dd4db701678c3668e0a6a0cd5b8601845eada848b4f2bf4fa7d3d78a05eb645"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.314/image_picker_ios.xcframework.zip",
            checksum: "3be82045c08d6583b948d2e18aaf3988cfd9dc0a7773dbdc95679fc8774323e5"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.314/mapbox_maps_flutter.xcframework.zip",
            checksum: "5d72f001133f9c1ee28f7d1af0ff4cf531d17f267369115da739e85c897b4092"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.314/MapboxCommon.xcframework.zip",
            checksum: "12789d816c812ff506bc99bae114c08908ed5ba9fed7a047247873d8128faa4a"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.314/MapboxCoreMaps.xcframework.zip",
            checksum: "e37b562f75579150f0de040f8740d8bf3afff425deeb4187f963587ecb39d58d"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.314/MapboxMaps.xcframework.zip",
            checksum: "b5e0264096caf02d097ee46ad4e377352843dc25462fef8cfbcaecaa9a88b210"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.314/NordicDFU.xcframework.zip",
            checksum: "a39fa8c22c905911478a8f1a658834be4984123804198f00229be83b6f1f7121"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.314/package_info_plus.xcframework.zip",
            checksum: "94808b3f6f82bec281b661c7f1585526d3bab815cba75cdfd67cdd59c58ed71d"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.314/path_provider_foundation.xcframework.zip",
            checksum: "262f0a6c01f28b2be3be7e77a4b692854f8ca8988c95d5d7590888f555043b37"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.314/permission_handler_apple.xcframework.zip",
            checksum: "b7adf726becea80c162a2a4600fc811ff85fcbaec3d594d8adb3831112ef75e2"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.314/share_plus.xcframework.zip",
            checksum: "23ae0ae525117a32fa65e92de78f11c1ff659be006788816fd07f4ff1aaa61b5"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.314/shared_preferences_foundation.xcframework.zip",
            checksum: "3533c92db89c9277b5b9c8587642de057e314d32b578a4f18cc7a482a7a502d8"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.314/sqflite_darwin.xcframework.zip",
            checksum: "dbeff36ad86b239c824738a427fbf713279fe29845601f9093429a5cafe2bc6c"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.314/TOCropViewController.xcframework.zip",
            checksum: "6b973f9017b753b66f541e6b8a7e909d6e7b98af45f5c0673b623a973ead6fba"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.314/Turf.xcframework.zip",
            checksum: "d365b5e95c26ce376971886eb13bab189fc5aee8ac0d37c47c4d69163af64d8f"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.314/url_launcher_ios.xcframework.zip",
            checksum: "5f378d0ef4b2f2d96ea501fbcaf824cfe98241502a6afd8e99e317902ca33da2"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.314/video_player_avfoundation.xcframework.zip",
            checksum: "d29b4a157e2d0c22e5923411cb158588dbf4a7d292eac9cb6ad905c2adcb2378"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.314/wakelock_plus.xcframework.zip",
            checksum: "79fe2946056b562cdb1037c368814c0ff09f8c405de9fb5d034c5d3ea1c46658"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.314/ZIPFoundation.xcframework.zip",
            checksum: "6a936fcb4a734c68db51580b6b0a96c700a173de8e1e23524c3e68e17e7e3028"
        )
    ]
)
