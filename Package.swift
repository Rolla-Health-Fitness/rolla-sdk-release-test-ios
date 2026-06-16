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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.260.1/App.xcframework.zip",
            checksum: "d12a361735ed396435449d6d7351c1961d89388bf2900affed1c6f4caa1852f0"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.260.1/Flutter.xcframework.zip",
            checksum: "1a7afd251142801887bc5bf8bde1e50bf64e5628d1055d0903ee0541a60363f8"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.260.1/connectivity_plus.xcframework.zip",
            checksum: "2ca12a2f3c534609515d8d2862a36f8569974f313eaeed073490e21c12ac8991"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.260.1/device_info_plus.xcframework.zip",
            checksum: "3a281f66d44bf55dc0967c51451017a2556e17041603a59c236c4f87f210dff4"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.260.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "4012afe86caa6eafee31574eecc404b25129008ed1171721399b432a2fb78010"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.260.1/flutter_local_notifications.xcframework.zip",
            checksum: "bcbc20cd2624e97993ece0120c05cb3bc94d353f335366b6a2858839931dd70c"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.260.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "75c134c3f74205e6b5e0dabb9a787b0a01877f244f47706054d90e40f27bfe36"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.260.1/flutter_secure_storage.xcframework.zip",
            checksum: "296f8c0ad6e4184bda26c41c7a768b2138f4bcb64454923e80ad325d2ad69dd8"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.260.1/geolocator_apple.xcframework.zip",
            checksum: "e41eca9ae22359025f90d6bf077b6a6b46640270f14f79211c25b85a814ea353"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.260.1/health.xcframework.zip",
            checksum: "cd9f8f8a96fc773e9a59c23016a7e0c35680a2a6d3cf636a9c337ba9e0758b94"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.260.1/image_cropper.xcframework.zip",
            checksum: "ef93761380fd06fa2ed982a436e1c5a1714b72902fdeb386428a5a5369ac56db"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.260.1/image_picker_ios.xcframework.zip",
            checksum: "7778f895cdc2da1ab3a44b12876a5775a966d64950c62e21cd1eadfb50242d3f"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.260.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "98d2e81b316e767a30dac8f3441b7fd99078bd7f3d4337801f2253ab226dcd53"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.260.1/MapboxCommon.xcframework.zip",
            checksum: "e4e6aea6fb71870ef41416ed59d93961dfe1912bdaed154b3ee380321238d7b4"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.260.1/MapboxCoreMaps.xcframework.zip",
            checksum: "224376a1b8aeabda0f5f089667664e0362a40ea4919f087d2e4f50b9453c0664"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.260.1/MapboxMaps.xcframework.zip",
            checksum: "bf3880df7952ef0d74faf000aea60ebe0a558de8ee953e40ed62654400c22024"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.260.1/NordicDFU.xcframework.zip",
            checksum: "49a0a2dc607ecbd0492b7b8301af55d665c70cb50f4d1480aa26ac72617de762"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.260.1/package_info_plus.xcframework.zip",
            checksum: "71063ff19efd84e8a4c2ee222a06edb607e3bc92b3727c4bcc919437dc0c8193"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.260.1/path_provider_foundation.xcframework.zip",
            checksum: "cbe7aeed1d2ca4b9838baa9af22bc7e3f0968d1727f0a773294cf364e37721d5"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.260.1/permission_handler_apple.xcframework.zip",
            checksum: "8eb7348a5fa33794765ba65fbd473dfe9f702d50b22d366b12a763238b5f65ff"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.260.1/share_plus.xcframework.zip",
            checksum: "843cb7f421c0a5c241320f3988653f2a5b652289f10016bd38ebb0d6f87cd2b0"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.260.1/shared_preferences_foundation.xcframework.zip",
            checksum: "fc238a5dc2c613cf5f1e482eae4d1c497d8704a98311a508275b9ea62c0fd875"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.260.1/sqflite_darwin.xcframework.zip",
            checksum: "4fc62e2895f73e3a67ff24fd5ecbd15a58c814d16fbfa0392e0285bc32f3fe95"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.260.1/TOCropViewController.xcframework.zip",
            checksum: "5fe4a794756a23d900c754dfd0821ccd060785a947e8773588bef258df268e1b"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.260.1/Turf.xcframework.zip",
            checksum: "cae875c152da6444cb0f5be82ff9e5e66f0199c5560a5373e02aa4ea0dd5e104"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.260.1/url_launcher_ios.xcframework.zip",
            checksum: "ffa64ec42a00b9489bc03364e63d64776124e3828886fa3b348e4b1a56be1610"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.260.1/video_player_avfoundation.xcframework.zip",
            checksum: "98074899e51d58fbeaa59185eac79502cb6f5b0dd0ef2c3100625523531988bb"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.260.1/wakelock_plus.xcframework.zip",
            checksum: "5fa414d7a8aca25a5aad7fc99417092b8eb68dba46200db1ce678f36d57228cb"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.260.1/ZIPFoundation.xcframework.zip",
            checksum: "245cabdead9939c93510e897f1ebec7725e41ca4129b4ae7ec0198a941e4f358"
        )
    ]
)
