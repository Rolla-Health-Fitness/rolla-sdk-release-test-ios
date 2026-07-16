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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.300/App.xcframework.zip",
            checksum: "98311da3fdf44816e8198a9ac56aa1d140598986547f4dcc16e3639e888f3f9f"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.300/Flutter.xcframework.zip",
            checksum: "5c707296e0ee8327143ebddc4bc58d0ab287062f74ec66c52490a8e3d05e053c"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.300/connectivity_plus.xcframework.zip",
            checksum: "572441df34a85a93d6b7d82598f34c9d9ca54a2c7aa866fc135f2eed77b03afe"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.300/device_info_plus.xcframework.zip",
            checksum: "47f1cbff66e8913907ef2dba0f7869c72bba1a7a5dd76bfd8d0d97b88f2d3c51"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.300/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "c3b64ff213ed2b69dce812854f3502a4a0c6448711c0224eb1feb8eb1788bd76"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.300/flutter_local_notifications.xcframework.zip",
            checksum: "41f580ac958f31b180ce565801c5c34c4c673e4dfdf9dc69880831c1ef3f71dc"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.300/flutter_native_timezone_latest.xcframework.zip",
            checksum: "08ffcc9310f9c714dd54971f7f7ca2a54c5c371c56d911ab7f6e9166f078d34d"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.300/flutter_secure_storage.xcframework.zip",
            checksum: "14077c62ec8c5bf5c024ae799e0eac7a33b566343e411af10e4132c0954f94e7"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.300/geolocator_apple.xcframework.zip",
            checksum: "c8377f5522abb95c351afabc1ad1dbbb39cbfb53b0facefb3febc8d47d49e0d1"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.300/health.xcframework.zip",
            checksum: "c42124e3a1297c7c713ae8d0b62dfa5c9569e08c47118062a39e163d041b254a"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.300/image_cropper.xcframework.zip",
            checksum: "1a417b3f72f0cbe3aecae159c1a3a2c6c182491f3854d4fc25d21abfa5bdf33d"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.300/image_picker_ios.xcframework.zip",
            checksum: "b768f9f764a65067701ec077be8824cbc90c5b9458642c2e1eaf1932c86c7fc4"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.300/mapbox_maps_flutter.xcframework.zip",
            checksum: "fd573e77d06151fe35fb8a320ec869bee59534be009138bb138db66600a62e60"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.300/MapboxCommon.xcframework.zip",
            checksum: "60704f96036e73144fce5b052f304723b1dbd54ebc96c445bef856bcb39b6832"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.300/MapboxCoreMaps.xcframework.zip",
            checksum: "2517925bd71e1cfdaa51d57eede1f558aa0fe7f62c6effea7fd7a42b0e21b31b"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.300/MapboxMaps.xcframework.zip",
            checksum: "01c07be85cafece24f254afc41d64efa6f8d1436061adcd47ac22e210620dbd5"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.300/NordicDFU.xcframework.zip",
            checksum: "9f18ba6abc4ced72cf9a17f2b913909b135c83d53e1f153c2e729e89124021b6"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.300/package_info_plus.xcframework.zip",
            checksum: "9aea0cb597e7bc999d8f451a5e6bad3b9f3870b9ec6284e4c91f706793555a9a"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.300/path_provider_foundation.xcframework.zip",
            checksum: "7b231b0828b0cd880f6dfe94ecb81d43a356ddcca64c3108664e1e76b3f08b7f"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.300/permission_handler_apple.xcframework.zip",
            checksum: "2135732f4ba30dc0862ba0af86eb3d57ca298129b4f54de85c9013e5f6ac9c33"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.300/share_plus.xcframework.zip",
            checksum: "ee7415bd70dc5625e418d094b66bcb6650fc008fb7f4808384c042499d577d41"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.300/shared_preferences_foundation.xcframework.zip",
            checksum: "46eb48a3e56ae4285d25b0c498b2144df95a396d83c76f82fad5a9725912c633"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.300/sqflite_darwin.xcframework.zip",
            checksum: "c569650cbd55100f6684ef9b2f0d423c1f6b130764d023b0ca34e1bbe7a2e35c"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.300/TOCropViewController.xcframework.zip",
            checksum: "1d33a3a180fa47d640fc966bfe64de9192fc462dd98cc9f44811b261a4f62e8a"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.300/Turf.xcframework.zip",
            checksum: "d766d1e3df4e117eb7bc2f46c9cd627ab5899903e8cc6cc4d5d2ef6bd79a1634"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.300/url_launcher_ios.xcframework.zip",
            checksum: "2bc86ba1e36c62def17790c9ac9ee4b3e17cc574b99c67132364ec257d7dccee"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.300/video_player_avfoundation.xcframework.zip",
            checksum: "bacf8a90fb1c54e5b44da247a288d67f6c3ccf130dbbcbdc59cb103ec1b4b777"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.300/wakelock_plus.xcframework.zip",
            checksum: "a27994d4b66ebaa9309f1c4b83d58013729b2385c1ee4a5b46a77aabe48c7682"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.300/ZIPFoundation.xcframework.zip",
            checksum: "73bdbc6028393a3e9a69ecc4d6e1a87a2c5537e52e37ed9810f0eea122eb6b33"
        )
    ]
)
