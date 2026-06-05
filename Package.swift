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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.249.1/App.xcframework.zip",
            checksum: "34be2380fcf2d89baa1ffc159668a9eebc63891e2325d23210241124cc4fe7d5"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.249.1/Flutter.xcframework.zip",
            checksum: "264a9ea4bd61b1d541e7e1bbce1bfc6f7ae2542a069b9718303147e5bd76eb0e"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.249.1/apple_health.xcframework.zip",
            checksum: "6d805c6b3c0b62af92915de38ac2a1ee5ac2c5c39fd78eba7aba482be7ad3cc4"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.249.1/connectivity_plus.xcframework.zip",
            checksum: "ab7c5688f318122e5fb729131530b5db8ea4c18ec602db71c41c9d45c86290f6"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.249.1/device_info_plus.xcframework.zip",
            checksum: "b6ee181818018d1dd55f9ba5665b4769e1bfeee49a98e2b5d817bcfcc323bd63"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.249.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "f6e4cd637f6e4fd5b304047d6429b7b1b939742a0cc950129c8249ebd9b91713"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.249.1/flutter_local_notifications.xcframework.zip",
            checksum: "0e6784c0ae94672348f8de32d97dddcab4d4bfc80140bd65dc98be0f07e107d7"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.249.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "ec88ebbc9f88b0ce94c8c8f208c269d8f871dd270809a9e96994a38116a5a6d5"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.249.1/flutter_secure_storage.xcframework.zip",
            checksum: "127c92952a303d9511388782bcb11b2f942858a1f9ac868868083263086bfd51"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.249.1/geolocator_apple.xcframework.zip",
            checksum: "47af4f9e73dadd0d832f025befe49b006c4b0a05ca73cca67df582f7711ac680"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.249.1/health.xcframework.zip",
            checksum: "7977c64f7d4645adb37f460deee6e3af58cf6277d41d0688be217ca396676cc4"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.249.1/image_cropper.xcframework.zip",
            checksum: "5a31a043400f2edaea09747ae891d237ee95de647ee5298d3b611e26322c89da"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.249.1/image_picker_ios.xcframework.zip",
            checksum: "940a3ad6949833439e49e534e7cfd475109347d8bf56c10c5d637afafea2e912"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.249.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "f76c65170ad1ad63048366ff7a264f5ffce1e40cfa6349d739ad11e14112c81b"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.249.1/MapboxCommon.xcframework.zip",
            checksum: "1dd42831e33b717f58c5f9b47825c3804559cba86390aea1285a4f56cd76a69a"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.249.1/MapboxCoreMaps.xcframework.zip",
            checksum: "0c6f75b9ea49e70a66c1990233568b9f303e22fd15e8d8153040dd666d54b1e6"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.249.1/MapboxMaps.xcframework.zip",
            checksum: "70d2b947ae24b7662157c4652241d2fa15a084514f40ddb81429dbb43084646c"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.249.1/NordicDFU.xcframework.zip",
            checksum: "99f697ccb5089d3c526d431612013e11bbf3e2756093f0ddf54daedf86657fca"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.249.1/package_info_plus.xcframework.zip",
            checksum: "7c9eabb942fdba44e6d5a153cd1252c4274bdecc653b5fde579977ee06f5d255"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.249.1/path_provider_foundation.xcframework.zip",
            checksum: "73f2aaa48cec95165d3cd44e65c52b77cd872c2099f79e5aba9c49d2d7086858"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.249.1/permission_handler_apple.xcframework.zip",
            checksum: "5c46846d8797c7e94fd1fc6952ede08b46823e741516d807a3082eebe6b8e5ee"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.249.1/share_plus.xcframework.zip",
            checksum: "2d7aeef84c9fd3a8215df218df5278022fd269337a0b28b3d5d3f491fb76cc9f"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.249.1/shared_preferences_foundation.xcframework.zip",
            checksum: "172da96308aa0f8a1de904d5d60c46e60033c60b7053168682f896832df5f10c"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.249.1/sqflite_darwin.xcframework.zip",
            checksum: "eb399a4d44ef80a7304deee0ce5b64353db4c96916392e392a0f1c0aeb5c750f"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.249.1/TOCropViewController.xcframework.zip",
            checksum: "4aaf0043975e11e81d75f841f3ca354bc2da4d3364ff31a990292a23c3f65a0b"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.249.1/Turf.xcframework.zip",
            checksum: "0523191a6b20491b539f8ad568868859e7298844221a8c6de5168dba40a47e12"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.249.1/url_launcher_ios.xcframework.zip",
            checksum: "b0a57219239538416cd667917d5e282aeeba67d4f898dbf84d60f7aec60bae7e"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.249.1/video_player_avfoundation.xcframework.zip",
            checksum: "8c51656107b42ec66de4eb4f5726757d95e7bed4b1dfa0d243992da10de96e4b"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.249.1/wakelock_plus.xcframework.zip",
            checksum: "3c14bea58aeecef0e8501c7edab148b1d6757203072b42621fba237f101f165e"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test.249.1/ZIPFoundation.xcframework.zip",
            checksum: "245dae9711517cb17a4b40c96525450233cf99856e90e322e5c41b659d64bf6a"
        )
    ]
)
