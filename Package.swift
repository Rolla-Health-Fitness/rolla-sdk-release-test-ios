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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.316/App.xcframework.zip",
            checksum: "d95a09e64ecc7f2beef0336e5d52284fd1f901313eb6b877dd83f3856a1dbab9"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.316/Flutter.xcframework.zip",
            checksum: "dfcef65716507078465e1f66cde494d47dcc370604c2d4246ef3fa2c18198fe0"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.316/connectivity_plus.xcframework.zip",
            checksum: "2cb8fa7ac281d2cd798c7e3882906161fc2d1ceec981621496b54c6820a7364f"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.316/device_info_plus.xcframework.zip",
            checksum: "1a39ab511c60be2ff9e453fc6bf9c5fd23a91f2cd351d38478085f3060dd8438"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.316/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "e3f33fe0c2301604cea64c82d4e3e6c5065d1166573b2e72f93da3ca7039b477"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.316/flutter_local_notifications.xcframework.zip",
            checksum: "1a918aba3d1df401f70cb6e9a2f5a7efaa0ad9962f0f5651aea23457889c872d"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.316/flutter_native_timezone_latest.xcframework.zip",
            checksum: "2c4e72cc7920f6e67298bf47d6e194252eaf85c5f42352f528cf4e1d1839a8cb"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.316/flutter_secure_storage.xcframework.zip",
            checksum: "ddf21c175f379e918eebca716bd9b89c2488f993380ef97f9683c64fe65c68e9"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.316/geolocator_apple.xcframework.zip",
            checksum: "3c81fdb725a4600c6d9f246f7681dea3a16979df3d45b1c6c30a65289a55ce2d"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.316/health.xcframework.zip",
            checksum: "3230399a71491c9007a7b8cfa0b82c2180018730ddaf6137e672110f69eed29f"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.316/image_cropper.xcframework.zip",
            checksum: "b1c74df618d3bf12a6655a45c4fe18fd4b59797f49cbdf467c1b8e4979cb8739"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.316/image_picker_ios.xcframework.zip",
            checksum: "a83754dc051cf247675203ebbbe38328a0916db8a412f25fb572697ce6217f16"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.316/mapbox_maps_flutter.xcframework.zip",
            checksum: "58b37c8eca012ddb66257647620b556c4cce920b4bbd8c2a9a9fcc07afe03a47"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.316/MapboxCommon.xcframework.zip",
            checksum: "73f5d9fb9d2c4e31d990d8ce1021f4c217567d5b71f656bb6ce6c1f52df85432"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.316/MapboxCoreMaps.xcframework.zip",
            checksum: "972c3b2d90779ba3f2580aad81940068c7f33fad0c85f343994e113cce063fa9"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.316/MapboxMaps.xcframework.zip",
            checksum: "ce96e0f2a1104a5ef25cd5ded1307b6098f713fb051956b022ab7ee10185d324"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.316/NordicDFU.xcframework.zip",
            checksum: "e46a0633b6544305c5994f09859556d4a732a3988382bef6c72d4c303f7cf4aa"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.316/package_info_plus.xcframework.zip",
            checksum: "e50c23cf721584a58f345720af918ace984db636a173f96e5e39c92789b5c4e9"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.316/path_provider_foundation.xcframework.zip",
            checksum: "4577292bf46897569405cfaf1512ca6db4c627a9b4dbb99c603a0efbe94cf758"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.316/permission_handler_apple.xcframework.zip",
            checksum: "cc2bef207f891cdd46a820425acc0b0cd4aadfe26a20daa57d1dc326f641a1bd"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.316/share_plus.xcframework.zip",
            checksum: "66e858795f4d5672e4c54f6fe1762ad00c0dbc6830a6bf64cbe0f2cd406f5bfc"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.316/shared_preferences_foundation.xcframework.zip",
            checksum: "76afc8a83143b17069dd7c22af3cbbde9397718dcdc786c909b10cfea09fcf80"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.316/sqflite_darwin.xcframework.zip",
            checksum: "5d4df58651006f000c5c0e89953f33bda17bc57eb617441a5d6a55bbed66d4cd"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.316/TOCropViewController.xcframework.zip",
            checksum: "e17cf74c850af6d9800c88fa227e37a815620d4473a5ef232cb371407263f510"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.316/Turf.xcframework.zip",
            checksum: "fb56ddbd5f7543ad7bed4379ebb456fa5d32e6564c7aa30f45d1f192eb7e3a68"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.316/url_launcher_ios.xcframework.zip",
            checksum: "febb59bccab0fed80cdd7b1d1cb674e412576968cb5926607725a84bb7455961"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.316/video_player_avfoundation.xcframework.zip",
            checksum: "daec9e072d898d112d109bf5c1d5163c0099da16722c48786d6c877ede4e8e75"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.316/wakelock_plus.xcframework.zip",
            checksum: "f37565f8221f0ea21767f5c500e36929a79e3801d9499b8ff52320cf0d537263"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.316/ZIPFoundation.xcframework.zip",
            checksum: "86ad91a128c3fd1e1ae75887458ed71e8aa1c16864fbfef464cbb0c1dc2f4621"
        )
    ]
)
