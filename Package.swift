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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.297/App.xcframework.zip",
            checksum: "67fd83bd6b4272183659574b57b559eeb17ea177ea21944e9e916e813f0d2163"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.297/Flutter.xcframework.zip",
            checksum: "362373f572aac67f80d2f0aeb58c7b4c417a94c413698e141a686ae812939da4"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.297/connectivity_plus.xcframework.zip",
            checksum: "04e544a5e0821ee57293d2046f2c02f455a7a2dc0135fab9e6cb7efda888d8b0"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.297/device_info_plus.xcframework.zip",
            checksum: "ca146d23b7c921fc6527638a1edfaecd62db2460c36dbdd09901e1455b9b2a61"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.297/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "901b472f8e21e65edf6777b476133186e0845c2ae96ba6ae1cfc5ead2105c4d4"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.297/flutter_local_notifications.xcframework.zip",
            checksum: "78c792055b7ed83d27029ce7c1a50645e333c6f635dbc30188ec38afd21d8426"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.297/flutter_native_timezone_latest.xcframework.zip",
            checksum: "9a1929374f0c0a204903b80e530eac412e00d274d2152b1595252a5f127ed794"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.297/flutter_secure_storage.xcframework.zip",
            checksum: "e0a49fd43b332e8376d3836910f63dc01900428961b9fba353055501ad4c746b"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.297/geolocator_apple.xcframework.zip",
            checksum: "31e55ac2f27bde052024fdb30bc4d209eebbdcd9e6a4b4ffab7673d8be325b6a"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.297/health.xcframework.zip",
            checksum: "cf676a0c3a3752f7794762ef310805c05d66e3682639b372d5b61e2705bc1a27"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.297/image_cropper.xcframework.zip",
            checksum: "5cf2727baa8e5eec0b12175d57ccaabac4957d2c5dc80e4f760aa30e124593a5"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.297/image_picker_ios.xcframework.zip",
            checksum: "206b3d01222a5ab433844bbea3a6ade2966a9f5a3dec5124c64de68d8f6b2285"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.297/mapbox_maps_flutter.xcframework.zip",
            checksum: "eed89f1bd87976925276fe8fa098c1b0bea85150f0083f711b81eb8814eec821"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.297/MapboxCommon.xcframework.zip",
            checksum: "1a9e374f8a79ac4a6a8b80733aabe00bfe78f46c349b7c72f5d26263f104e0c5"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.297/MapboxCoreMaps.xcframework.zip",
            checksum: "86369b1521b1ece128b7b873a13b87c6ea1e5c78cbc2fd4cf20f08bce24c8f86"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.297/MapboxMaps.xcframework.zip",
            checksum: "9c8e0d322332b5d9c3817faed2fd37d616954e22c57389eb0f1880eea2923c9b"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.297/NordicDFU.xcframework.zip",
            checksum: "3aaa1527d552e263c97509de73429d5bc819612f3db1deeb72d51e8b328cbada"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.297/package_info_plus.xcframework.zip",
            checksum: "821eb0d3cf7f105cad5c49a1448df44a71f277c8a30fa79c65f301620978d565"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.297/path_provider_foundation.xcframework.zip",
            checksum: "d09cc7cb03493e23c5bcc8bd95adba02a55be78dc5b741006ec8b571bc3398ea"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.297/permission_handler_apple.xcframework.zip",
            checksum: "1ef1e60261363d6eeb38a726d43a043d775e6b0d1560a303694a12b8bf9056dd"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.297/share_plus.xcframework.zip",
            checksum: "5b6cd312e29cc8eb0593cc873e6a4e80d61fb13e2b14ec51d6483192581c6f5c"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.297/shared_preferences_foundation.xcframework.zip",
            checksum: "7e096628ddc4384ed275e9851cd7c60a85c6a458f356f6cc61da153140f8613d"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.297/sqflite_darwin.xcframework.zip",
            checksum: "30fc336252a3392833fda179670809967a7ad36ace6bb8abacd15bd9a4ba26aa"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.297/TOCropViewController.xcframework.zip",
            checksum: "90c20aaa508bd02f863e5ff163e2af47cef3d35a272ece4915e0ea9ca93dd08c"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.297/Turf.xcframework.zip",
            checksum: "0490dc06e83ddcde5edcd99830413a9a6067b4ab67baab295aeeb1caef5d036c"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.297/url_launcher_ios.xcframework.zip",
            checksum: "1a1e3d764ffe9e6ccb4b2d8eac60285541a20948680059421dd1355079abe5ea"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.297/video_player_avfoundation.xcframework.zip",
            checksum: "1536abcfd74dcb401d2d099bb47435ee541570966a910e5621c4a0ada4981425"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.297/wakelock_plus.xcframework.zip",
            checksum: "b4fe07b94550e39b0bfa31e6f06e4b92a5c7a52871322c17a8b39aeec22cfc70"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.297/ZIPFoundation.xcframework.zip",
            checksum: "b0242a9909d9d4fe2ed0a4bbd4a5b8623c26d0ab44c431212dd4cb4a4e753150"
        )
    ]
)
