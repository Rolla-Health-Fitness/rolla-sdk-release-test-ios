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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test.252.1/App.xcframework.zip",
            checksum: "17f077aff9e34b60c73e5cf391327c03abae0d0f61810206f6ec6539b73166db"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test.252.1/Flutter.xcframework.zip",
            checksum: "bca962b79147bf0307ac15822b7892c19e0957ab9b5a9de084d71168d67308b7"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test.252.1/apple_health.xcframework.zip",
            checksum: "fd10ef3dc97a7e01035bf205f3b019dc0c5920300a3828df15d366107893d48b"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test.252.1/connectivity_plus.xcframework.zip",
            checksum: "472d0b2d42df05842b8122b2dd2d5eb8b9d0f13c1785a5dbe944047399209899"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test.252.1/device_info_plus.xcframework.zip",
            checksum: "fb2fa41de45eac5d68e04adc9b7053b7a0ed3ff80018b424d3cd6c7d20b83fa5"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test.252.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "37058cf0ce36d3d18e54c6e5911ac7132ca8d7ba5abc596ddf843ca337ae4a57"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test.252.1/flutter_local_notifications.xcframework.zip",
            checksum: "487220e62024c3fb039b86169493d1792402111c5236a92d72d5bd7bde0c5b6d"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test.252.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "081aa16892f5f40148d24930b420e3f7eb358c96fee1f78bf9f1bf94e630110b"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test.252.1/flutter_secure_storage.xcframework.zip",
            checksum: "5f1590234225415b22c6727237a433e57307f271ee272babcf90a3f7592363d5"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test.252.1/geolocator_apple.xcframework.zip",
            checksum: "8bf17291bd8a813db8dd47bdf122c99434abbeea566e514d99c2e32be962eb30"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test.252.1/health.xcframework.zip",
            checksum: "678ab466ceb52feb1d4493fee0f3bfe63bd3ac35d570571e8593f1732be2c1fd"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test.252.1/image_cropper.xcframework.zip",
            checksum: "43279ba97eed0248e70cef3a8e3d74de6ae7870c89c9c0624138b8c86cf54b34"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test.252.1/image_picker_ios.xcframework.zip",
            checksum: "9ffa2ce68314e2af3c3b7229d611930d6b73441e9964465e362c0e84a05461eb"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test.252.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "3ad3b996760e76e372540b329d8ee83b463b632cb891bc293978f0d0994cc9a6"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test.252.1/MapboxCommon.xcframework.zip",
            checksum: "330cdb389b4d29ec3dd5fe47bf2ffa8ba54629b10e731fb28e92104b82842012"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test.252.1/MapboxCoreMaps.xcframework.zip",
            checksum: "e9cd43df26ff21ab662ecd797d11f7cff7ebbe2c36a85877a2e2c407b65f4ebd"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test.252.1/MapboxMaps.xcframework.zip",
            checksum: "a9e577e86f56406dc81000af1e35bc7faf6a527f4763aff847bcb4b5d506a22b"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test.252.1/NordicDFU.xcframework.zip",
            checksum: "526f0ffec3681ad29d9002b4a35c72619051919ea5799899c5c9523ddf49e11f"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test.252.1/package_info_plus.xcframework.zip",
            checksum: "48da1c847d22260f5548f51e948411c97a2b7ff6d43ff701182258bea306cb81"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test.252.1/path_provider_foundation.xcframework.zip",
            checksum: "e1c37f87d36391845a47686247b94d0dca4691ca77284c8cfee6cf735d1ace64"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test.252.1/permission_handler_apple.xcframework.zip",
            checksum: "d7dc0f05b7d3d0b39eb3bcbd9d8cd56318846551acae463e54ff7f39e5140a73"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test.252.1/share_plus.xcframework.zip",
            checksum: "e8654f0959bbc8e5f98daae3cdeec7f1e4e1f5414d27123be7d203b1c9893e2d"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test.252.1/shared_preferences_foundation.xcframework.zip",
            checksum: "f5b81d0553fece4bb0b1a166f17f9328d2e45052d0df4e9caa4989431d0020ad"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test.252.1/sqflite_darwin.xcframework.zip",
            checksum: "d8b9d9a98df9c012eb6a6d0fe3f5b3538e788900bd8358adfe0bd643b020e120"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test.252.1/TOCropViewController.xcframework.zip",
            checksum: "052d2f54e7c498cc5a94f32664f31bd3d2b0b14637b589337acbaac3136a5811"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test.252.1/Turf.xcframework.zip",
            checksum: "52e6928b682aaa7b360795752308b4ee8a96ec3fff0dfb66c491c588c5430a8d"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test.252.1/url_launcher_ios.xcframework.zip",
            checksum: "930c08e6882a64dee219360970b7c5965ec8d0b3ee8eec2d5adb672f391813dc"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test.252.1/video_player_avfoundation.xcframework.zip",
            checksum: "3b59dd60e7cc0831c030baa120734b4ed8a70dceb3b9cf4751a2cfaf7432cc43"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test.252.1/wakelock_plus.xcframework.zip",
            checksum: "b43525afd1aa4f022ccb2373d895924abc79e6511272707fd8dde193a4924072"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test.252.1/ZIPFoundation.xcframework.zip",
            checksum: "b78c7e38c3f2e212aed7cdd3bc8a7d14fb9003bf5a090c8c76ac4e4149b15088"
        )
    ]
)
