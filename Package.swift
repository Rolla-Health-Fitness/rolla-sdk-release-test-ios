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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.282/App.xcframework.zip",
            checksum: "3e19602f49510a9a64824d81673a728e2fa2b7a240cab2bae2e3c9684602c884"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.282/Flutter.xcframework.zip",
            checksum: "fa6eb18bb05462ec8b6f43abf6834917d32b3f4524b5b9b6fd5596ba69164c35"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.282/connectivity_plus.xcframework.zip",
            checksum: "7676c2e6f1194e74e00db9f17fc8a2e949839a4ad769f2a83e31ee0680d3500b"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.282/device_info_plus.xcframework.zip",
            checksum: "f5c493233de1353194318552cff46219a1cabcbef82f843bb3f5fac4c1b35475"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.282/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "4b2820092941655b1dc39b63f8b2dca5b24948e5e2cdb6a8771e04692d83dc48"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.282/flutter_local_notifications.xcframework.zip",
            checksum: "324ef75ec2d1f3eab94e4576fae8ff752f2c3fcae9c9d6f9216c2116c0bda835"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.282/flutter_native_timezone_latest.xcframework.zip",
            checksum: "6d5d4083464c49df067558df67c50a447e69e9a021a86361a1c0e3836c1300ef"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.282/flutter_secure_storage.xcframework.zip",
            checksum: "5452c07c58cfcaec6850bfd468befa80efb36bfc9bb9aab74094e740f2b41153"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.282/geolocator_apple.xcframework.zip",
            checksum: "734703ce6ba7557704ce792bfd7ca83c4e7ccde38cc0def20dbec6d2218698d9"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.282/health.xcframework.zip",
            checksum: "366780be34093d086ba0d0f9673584bebc278c2b2209451e907231303afc9908"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.282/image_cropper.xcframework.zip",
            checksum: "8df22f7bfd53bb848bbf2447d6919918838e1fed67ba95805787fc4eb62368d0"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.282/image_picker_ios.xcframework.zip",
            checksum: "86893a8773b7ca7765456cd31d4ee8d7b58a77f293c048e12cf1b19549629605"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.282/mapbox_maps_flutter.xcframework.zip",
            checksum: "e093abe366ce3457315d698375e27e0e1c62fca812418047c2be3a6f0828a304"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.282/MapboxCommon.xcframework.zip",
            checksum: "697e3a852f84662f4f38ead5723ecba8ca50b427986ffde8d754749f088e76a7"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.282/MapboxCoreMaps.xcframework.zip",
            checksum: "0d1e1644ba8367074f928f46b2d96386ab5bf37034f89744b39030dc354b328b"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.282/MapboxMaps.xcframework.zip",
            checksum: "f28c56539150b54851f4a48339ca8a706ce5cc408ce40d3c28efe2393401c3eb"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.282/NordicDFU.xcframework.zip",
            checksum: "00731be30397f2fac9d2e782295a9a743da59208260f7d5923382ced7392f5c2"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.282/package_info_plus.xcframework.zip",
            checksum: "4b6048f419038f7864766b5a512e836e702808c74f8081152f49a8b248918fec"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.282/path_provider_foundation.xcframework.zip",
            checksum: "682da6b3888f96c62155e991b4077664f4c71e9c681bc5655958a2775480aee2"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.282/permission_handler_apple.xcframework.zip",
            checksum: "5669c38c70049838d07bb107b883cbf8de00ae3a683ed533f2c34b723bef25af"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.282/share_plus.xcframework.zip",
            checksum: "314d72fd7362c59b4df6c33622c2748d887ccb021e4c293071c5da7fa0ae9903"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.282/shared_preferences_foundation.xcframework.zip",
            checksum: "4f7533831ed1430edac12b51e3915a2f4a9ccc4c49bd1541b77c108e5395d464"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.282/sqflite_darwin.xcframework.zip",
            checksum: "31584d1f543bf6b17fc14bb52f6168ae653a21601e5e205cf091b118c4ff7a57"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.282/TOCropViewController.xcframework.zip",
            checksum: "ceb29f9af64329f3d0d5471d56cfa2e26a25acfc2be34ea47de756b9c1d08456"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.282/Turf.xcframework.zip",
            checksum: "35f290bd67ca4e59b574c9ac62811497fd31d823b1c6b1dbad1bc8e518062e06"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.282/url_launcher_ios.xcframework.zip",
            checksum: "c5758b911295a61d4c3552ccf8155e8b6874bd975f4fea03d114b1614ef322be"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.282/video_player_avfoundation.xcframework.zip",
            checksum: "c2b49b2235a3891f743580ef69c2b9b72bcb479a491530466b87452ceb96e4e6"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.282/wakelock_plus.xcframework.zip",
            checksum: "84cd461dba00863ae05450eba160e392fbdd0e71a945576528cb33f7c60bb413"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.282/ZIPFoundation.xcframework.zip",
            checksum: "8e711beb8f8b0ba4057904363ffd04e9be8e7cdb9e8683f7e2c0a621ae386add"
        )
    ]
)
