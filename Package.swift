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
            dependencies: ["Flutter", "apple_health", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "health", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "FlutterPluginRegistrant",
            publicHeadersPath: "."
        ),

        // Swift wrapper API
        .target(
            name: "RollaSDK",
            dependencies: ["FlutterPluginRegistrant", "App", "Flutter", "apple_health", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "health", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "Sources"
        ),

        // Flutter module (Dart code compiled to native)
        .binaryTarget(
            name: "App",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.247.1/App.xcframework.zip",
            checksum: "a040a9b59dca5320e9b32e035e31cf2056bfe97fcdf0aecb88d2b2d226577bf1"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.247.1/Flutter.xcframework.zip",
            checksum: "d527d81184072a671e31cd02b20b46d89a15b6966ad3b4a9b25697a4438cd8c1"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.247.1/apple_health.xcframework.zip",
            checksum: "0286622fbd9614c69a0ae8b2bd5abbb27d92ad5be8c268c9f899775370e1bc35"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.247.1/connectivity_plus.xcframework.zip",
            checksum: "1a2bef1b64652d4f11a917cd1dba88330f8fe61519ee49d53c9a501f8b0a3bad"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.247.1/device_info_plus.xcframework.zip",
            checksum: "c7b17ee07ec7db407f46e157d8c688f24be9962b5e1911010b0e7fdaa60d2d39"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.247.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "cc4e5b7b40df31ef4cd4276ab38338a146f43774d1bd6710083fec4d68de1e63"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.247.1/flutter_local_notifications.xcframework.zip",
            checksum: "78511d9979298efbd11ea00b9f0e1d91488ef48662fea8693a02e938acae6f90"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.247.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "46e67ad5da106adbe862a22c61fc9f79b85545476722993d3d0c2e4d0be245af"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.247.1/flutter_secure_storage.xcframework.zip",
            checksum: "29c337d607d5b3d7831fc309af027eef890e3962ce3b85dda3a87a4aec06975e"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.247.1/geolocator_apple.xcframework.zip",
            checksum: "abb2d0ac2ecc41e850261c73381f5b04c538958ce2d35e079b7161beaeb32137"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.247.1/health.xcframework.zip",
            checksum: "48885d9c571a8b10cbdf3c926c2735e80f1f49845e2173e93c16ae82670246ea"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.247.1/image_cropper.xcframework.zip",
            checksum: "298ec2513d37dcf09ba4d3f47cedc918907d07b1ae77b6d47eb17902784c16d7"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.247.1/image_picker_ios.xcframework.zip",
            checksum: "59d7392cbc1122519944340dafc9d41dadf832c259333e8eaac3d61faeb44990"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.247.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "542c33bdba56aaffbed1e30fbf39715c6b9390baa4e75e4e197958c1b2cee09e"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.247.1/MapboxCommon.xcframework.zip",
            checksum: "7c75bd173a7cce9520179854e4d751880fb974e15ed595bb5cedaae2cc2af540"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.247.1/MapboxCoreMaps.xcframework.zip",
            checksum: "6ca033d34027cd86281c22c4815233665d55941ba3d4dbd38a0a10d35add9997"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.247.1/MapboxMaps.xcframework.zip",
            checksum: "35acda56e515f6f28d2322e80c6ae6def532368760b00a6abadba45bdc1280b6"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.247.1/NordicDFU.xcframework.zip",
            checksum: "a22f39adcece119c369b8794edbbac628f729a09996d363ff42d9c64da0d8eaa"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.247.1/package_info_plus.xcframework.zip",
            checksum: "ab7babdfc419e19fadd86f2866079794fe840a1527066866148efb81070dc39f"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.247.1/path_provider_foundation.xcframework.zip",
            checksum: "cd3c99c663b81d0e2698c9b2ccf2199f740f3b043bcbedcaee21f85c35147740"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.247.1/permission_handler_apple.xcframework.zip",
            checksum: "a76a2fcf8f7d9dab25a91e5842fbedb69647323f81a16a8b44f433a5231827dc"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.247.1/share_plus.xcframework.zip",
            checksum: "9725f5afdbf86d67d477a98fe10a55f1817af27268ed637a583222b4228d9c63"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.247.1/shared_preferences_foundation.xcframework.zip",
            checksum: "f2cec62a684ebcf6953fd9af11492710b069e813138849422756a6c369001337"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.247.1/sqflite_darwin.xcframework.zip",
            checksum: "136b74c789843c7f2ea1f7cbd3c35266d17892647bf6ca41be211a8f265e25cd"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.247.1/TOCropViewController.xcframework.zip",
            checksum: "98d424b4a5683042d396d5ad62ce77b89f82652bfaa89832288ab48dd8ef3647"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.247.1/Turf.xcframework.zip",
            checksum: "a5c324b4429459fa9e94ce7181a7cff634252656a8f4a2931a5dc59bca9a5a62"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.247.1/url_launcher_ios.xcframework.zip",
            checksum: "d540fbbe33145fc00e5e2d7a297f3749c93c4157f8690be43e87711aff415100"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.247.1/video_player_avfoundation.xcframework.zip",
            checksum: "f01eb58a86b4f51db61c4d3c3c62f1263f29b9646f0fe4e063fadf15d73e09a8"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.247.1/wakelock_plus.xcframework.zip",
            checksum: "7fce96ac1fa75f4d9a81be4ad21f75ab9a70cfdd3635c2fd7aa579a82789374b"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.247.1/ZIPFoundation.xcframework.zip",
            checksum: "e8ff24d51007898bc41dd2ce66c4e684414c29ed87b52cc1cd147b9e5f86bd60"
        )
    ]
)
