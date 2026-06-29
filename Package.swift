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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.280/App.xcframework.zip",
            checksum: "4dcde708549f4bac390c4c1aa4967522099a463d9c16f13a12e07cadf7206778"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.280/Flutter.xcframework.zip",
            checksum: "68de49efe8f07bfbcf96e3e24dac09ca46edf205d6ef85489264d6a1b2d8732b"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.280/connectivity_plus.xcframework.zip",
            checksum: "0a6eba04dd40f718d25586965a66c37c34846b2f6024674b38c2c9550438f3fc"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.280/device_info_plus.xcframework.zip",
            checksum: "a7cbf487d86cc98b390be34a661083efab3026c0b04469ecb3ae26a604a53537"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.280/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "4b7f5f2db4458123f96d3d1746659aa012f950096d06451bddf8e40e269bcb31"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.280/flutter_local_notifications.xcframework.zip",
            checksum: "6e09e71bbc3ce70db0cef249a68f43d90b6edc43ae7d577b1dbd6976b8f042d0"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.280/flutter_native_timezone_latest.xcframework.zip",
            checksum: "1e35642cd53c975df20c882e6b02458e07ad75c912432b3b96f199f8e4ad84a8"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.280/flutter_secure_storage.xcframework.zip",
            checksum: "4579a04e90f3f0ed7446ab12f96bbd78fac183845cfd855816607ace08dad5b4"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.280/geolocator_apple.xcframework.zip",
            checksum: "5f5cb92c0081e8a8db2f89fc612dc9662646bfc87d003f976b9b30b41a7ff3fa"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.280/health.xcframework.zip",
            checksum: "332caf71f589c7b452fa8ff3ebec186562e90c002e8059c2cb212f34961fefe4"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.280/image_cropper.xcframework.zip",
            checksum: "ad9ce5c018bac5586032895d1e0dfda5fa7073342186ab8b89242b8aed3733ab"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.280/image_picker_ios.xcframework.zip",
            checksum: "7ff057e73b0c1ed1c7bc85dd97fb70c22443a5514423d444276e1936ba0d97bc"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.280/mapbox_maps_flutter.xcframework.zip",
            checksum: "8395cc12a45521a184ee375ba5ea3e3eadd449d1bd2d1a2e973e1692888f3f87"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.280/MapboxCommon.xcframework.zip",
            checksum: "44ac800cfc7f633fa3e43dc4e5c87eb86b9b9d9e758edbb0ca28c30dd76a6a0b"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.280/MapboxCoreMaps.xcframework.zip",
            checksum: "8f7dcead20c75ba5dc8aab4cafe7af224e888ebd7e458d87bafc98e31d9391bc"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.280/MapboxMaps.xcframework.zip",
            checksum: "04d301fb887c59e8982233686f0bed7f530e6cfae0c87bfc2ad409251ef4aade"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.280/NordicDFU.xcframework.zip",
            checksum: "20493c811b053ae00f7afb1ab174e6612f7009bbd794508db9042331d7487e7f"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.280/package_info_plus.xcframework.zip",
            checksum: "0dbb2dbfcab91fd66f694c45c684943fb95f718ce72b54625cd28a09aa1043f9"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.280/path_provider_foundation.xcframework.zip",
            checksum: "b810e8e175a50abba88a9f1fade92cbbf6e5adcc36d6e63ba4bf387557b0f18d"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.280/permission_handler_apple.xcframework.zip",
            checksum: "a4b6636103b4a5247e7d28cccc92e327870d12dc72684270b77ff9fa9fb448ab"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.280/share_plus.xcframework.zip",
            checksum: "5c6574fedc1a467e32032f1ceaea96847645ad7d73d4c4065f3ee29805d2f104"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.280/shared_preferences_foundation.xcframework.zip",
            checksum: "6d0d7fc3cf35f0d7b71e4b3540ef95878b10fb4d9bb6a0734a3225f87b2f849b"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.280/sqflite_darwin.xcframework.zip",
            checksum: "a0f836e86964a3184e4245c27be2266635c224a95f2e0ec6a6c98b3e754aec09"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.280/TOCropViewController.xcframework.zip",
            checksum: "336981a9eb3f6f14a1654710a41757e00c3cb3425ce04157faa5421194e5469a"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.280/Turf.xcframework.zip",
            checksum: "8c20c45f0f6ca19d8f84720dd96804f5a4891ad607491683b6ea5f30681f4b26"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.280/url_launcher_ios.xcframework.zip",
            checksum: "50b5d0a5124fbe6a31601c18306ee8be2d69ea3f868b0c393fac0ef075db3fe5"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.280/video_player_avfoundation.xcframework.zip",
            checksum: "04ebbd7186971d6c37c1e02e03350be9e7e32ee1e24dff8fcebe23dbba111a93"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.280/wakelock_plus.xcframework.zip",
            checksum: "04df5e557808aefdbc4ec281e24c9bffc308164ad3e4069d8b5bc0573a825adb"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.26-test.280/ZIPFoundation.xcframework.zip",
            checksum: "5971aa78d2285d98895387606db87efedfcf70232f80afe889ce1012d3123dc9"
        )
    ]
)
