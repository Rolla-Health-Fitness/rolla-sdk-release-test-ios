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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.334/App.xcframework.zip",
            checksum: "f3595c9502b1011fa70bbf1ee7904d2b396f7210a456202c82491e15e66c27e3"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.334/Flutter.xcframework.zip",
            checksum: "56c789e39f78952745867231996f08ee3833328d0d112fbf9c0a31227dcfd127"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.334/connectivity_plus.xcframework.zip",
            checksum: "e719009917292095e84c23be720ed6dce5d0c29f297cc2a408e4b50cdedc0e3e"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.334/device_info_plus.xcframework.zip",
            checksum: "d260d61f49e2980957ce3faf4e8e4ba6f4c9eff4f6e80376ccbdd2cc6108c6c6"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.334/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "a0dc4a60fd5d8f9c46371d955a9dc57d9da6e082a66f933c5e5b3673cedfaa82"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.334/flutter_local_notifications.xcframework.zip",
            checksum: "6c33d4b259a617e3a6712dfa49f202647bc09a317b5aa72359b59b598ea9e5e5"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.334/flutter_native_timezone_latest.xcframework.zip",
            checksum: "b90a4604e8be49105aa2c8009d48666b9e55713fafea3751692522f657837d30"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.334/flutter_secure_storage.xcframework.zip",
            checksum: "eea04ea219d8161ab4a4abd92e4d0ab442cdeb00b1fe228a26f6b18421c2e51f"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.334/geolocator_apple.xcframework.zip",
            checksum: "d7b5786c067a86d20a486d299d35fd8a9f03a485178697825314a1efeda0d292"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.334/health.xcframework.zip",
            checksum: "cd23dbb2860bab5c01b487f59df516b8b4450e4b84c64bfbb2cf0529ee31d113"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.334/image_cropper.xcframework.zip",
            checksum: "3a3bd66379306bdd6b852b8ab9499309fcaeb4ae1c90742fa77399f1d0b41a85"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.334/image_picker_ios.xcframework.zip",
            checksum: "3993ea561a7af19106a392ec444916e8a6a46c98edfa84ada20c228756f438ef"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.334/mapbox_maps_flutter.xcframework.zip",
            checksum: "5e5fd6112ab23ef3313270942f06ee8578514b4a8730a8a3c5760f95beb0b8db"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.334/MapboxCommon.xcframework.zip",
            checksum: "a50596aab284318acd6317d4a1fe6d1f27c7f478bd912272dc749c436efd290d"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.334/MapboxCoreMaps.xcframework.zip",
            checksum: "8e9fc594afd97276c67ecfb595e0777d27f7565f0b5a4675b369c1218731f00a"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.334/MapboxMaps.xcframework.zip",
            checksum: "375ce5e34eda1d42f907c53e33f84f6b539fd5cc1fa082f96b5a3dda3ae43916"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.334/NordicDFU.xcframework.zip",
            checksum: "8a16e45bff782eb40b7b05d4699e5da76069004d58b073eecb72a0b2e442f992"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.334/package_info_plus.xcframework.zip",
            checksum: "32bc17d78e4f016e9936132fc0f546b9493161dba01afffa0a9cc3342a5d3267"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.334/path_provider_foundation.xcframework.zip",
            checksum: "3347a17feffa1f220c75575c022d68133d5e1a634706658242a92701b4ed6207"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.334/permission_handler_apple.xcframework.zip",
            checksum: "14ef79822c9e1a2e61b2435d73b5255dc8e3d3d1811a3bc9fd74a17d9dad190c"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.334/share_plus.xcframework.zip",
            checksum: "8f1f22986781f4edcc9294092335241e6ac4134655f68b7ecdb83d5e97df2bed"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.334/shared_preferences_foundation.xcframework.zip",
            checksum: "dc2a3a8939a2451dc9ddc45b9613b3d4e9db5ec4f9cf4c856bf55acd6e80c5f4"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.334/sqflite_darwin.xcframework.zip",
            checksum: "f4cd3b38ebac4cb873ba6fd2861742e2130ed6ab04cd37b82b7f47b65b4b74ae"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.334/TOCropViewController.xcframework.zip",
            checksum: "528af766ca3470a35b0810f44480ad0bd4c0612c4e240981475ca9e5d37c824c"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.334/Turf.xcframework.zip",
            checksum: "efacae49e9a4a0db5b1a6ece97e5503a6e16bfdedfe875760a9b7758d232fa01"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.334/url_launcher_ios.xcframework.zip",
            checksum: "8238fb005c05fe8db5c74fb06235b9ea590e0f01df6866c022a958a3f5a7fb36"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.334/video_player_avfoundation.xcframework.zip",
            checksum: "466413ffd57040af92fdde8219081b33d2d64a6a1779e55304978d2029234d4e"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.334/wakelock_plus.xcframework.zip",
            checksum: "2ef1b79f8a60d3c0e2a233ca7aaea255664750315706ab665ad3bbc9bc25f5c0"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.23-test.334/ZIPFoundation.xcframework.zip",
            checksum: "5a5d0eb192e147cd240ef439fa4613e3115e07527b9a5a68a747d0ca3ff6a2c9"
        )
    ]
)
