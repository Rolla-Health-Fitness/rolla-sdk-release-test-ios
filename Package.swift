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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.224.1/App.xcframework.zip",
            checksum: "905a029d4ee6355166347bb32ff0a1f307c134c7882f3318d9a31e22a702d925"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.224.1/Flutter.xcframework.zip",
            checksum: "17ef037d92d0306411cf22b4c5fd9b7489f48b637141cfe3fd61fc573563ca6f"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.224.1/apple_health.xcframework.zip",
            checksum: "383959c4be35d26c54f1a37690eb1bf6bf61f8dfba19ee2dc893fdadcb4cd745"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.224.1/connectivity_plus.xcframework.zip",
            checksum: "2f5a61a241e1e0540468c23cf7f24c42d8b3423a3225a42eec04cda52db2e7e6"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.224.1/device_info_plus.xcframework.zip",
            checksum: "d649734382f5311e7ba0fb87f69474277e49e00ce54f106e8f5fe9ba8b7ada16"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.224.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "7b9815bb1905b0560442fd4c89c760783a785734f145f076b707ceee4007798b"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.224.1/flutter_local_notifications.xcframework.zip",
            checksum: "eaaf0faef893bc17e18a013c619df309d7366dea39cea218706fcd955503864d"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.224.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "6a2a6fed19ca492d001307b5758deec1b477327ee9269a2aad127e92678391e9"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.224.1/flutter_secure_storage.xcframework.zip",
            checksum: "14eabbfa406063a67dfeb94035e4a8f0e7c7d5501c6aa1087115e3f44b479359"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.224.1/geolocator_apple.xcframework.zip",
            checksum: "56f9658b835b54e41d5ffde1eb2421bcbdef2d9a7ee3a846e2e9af9187030727"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.224.1/health.xcframework.zip",
            checksum: "4c93a4f174aec1d6f4d0fe119e9fb8e339a523ea71eea3c068ee8451eb86bed8"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.224.1/image_cropper.xcframework.zip",
            checksum: "4ec3e32cf25eb28f725978f54d1b414cef053a8292d7e2780f7043a7c949bb64"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.224.1/image_picker_ios.xcframework.zip",
            checksum: "01f543246843430424686645313d38e347bda80b494be846683647567c1ccfd1"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.224.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "2ddf1a1aec028387940e83400099c514b7d3acd3beafa4e7cfd5396308777811"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.224.1/MapboxCommon.xcframework.zip",
            checksum: "4a47c4519faf593009d5ec0f7579093920f8767feacc3de428d47df1229112dc"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.224.1/MapboxCoreMaps.xcframework.zip",
            checksum: "737b407f191837e31a5b3b8651e85129c805ea9f1ac994f8a74baa5b28afc307"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.224.1/MapboxMaps.xcframework.zip",
            checksum: "834001bb6a73fba0f32f8f92f49c55b98a53c65fb486b7dec925256ac6d09091"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.224.1/NordicDFU.xcframework.zip",
            checksum: "6a30519e7dc254a15a444c4b0f5b45623591201d2494bc374a91b3a559928658"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.224.1/package_info_plus.xcframework.zip",
            checksum: "2b00931ac63f78c68111d31030c1ae079675530279370b5f655bc51eec0ee0c4"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.224.1/path_provider_foundation.xcframework.zip",
            checksum: "e1d5ac432f7f77b87e53639223a7cb9bb6a874c8df38353dc6dd37c616e8a9f6"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.224.1/permission_handler_apple.xcframework.zip",
            checksum: "35716623289568c441a4b92b8ebfafef86de3e34f67bc2a4382d60797241b967"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.224.1/share_plus.xcframework.zip",
            checksum: "4d3478450bcfa8d790f0e6ef7eaa233b6fcab5bce9d77610b663550323f8a15c"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.224.1/shared_preferences_foundation.xcframework.zip",
            checksum: "46e9d301b3c888f26efe22112b32c17b36c183f0be07ca19a236df489b212ee3"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.224.1/sqflite_darwin.xcframework.zip",
            checksum: "4f6a40b46d5b0e1a6f06fe0c3a2dd086c474cb84ef4cd9923807c9987ea83631"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.224.1/TOCropViewController.xcframework.zip",
            checksum: "ea2ae7fc5e9eccc0cee2b7d49f8bb70250a3672138f73bd0be3bbac53319138a"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.224.1/Turf.xcframework.zip",
            checksum: "c1f5f5b4672b955e4e70a7cec2be6f0e4c9065f175f1da20885670e8a01b41fb"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.224.1/url_launcher_ios.xcframework.zip",
            checksum: "096f14b6d6cd9ef4da0abadf641bb4972f1d776dab83b4a4e5a79ec58b85d15c"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.224.1/video_player_avfoundation.xcframework.zip",
            checksum: "018f0afbf9261d81accb2ddae1021b19132bc7c201a2fbacaccb00fb0ec0b71c"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.224.1/wakelock_plus.xcframework.zip",
            checksum: "4325f8895714a074cd91c9c0f2a8a91ba14ba9427cb9302d8153a47e709e197f"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.224.1/ZIPFoundation.xcframework.zip",
            checksum: "a0eba3020f8674d6b1ebb491fb0636afb5d5f31d673999c5b6e7269b49d98a1d"
        )
    ]
)
