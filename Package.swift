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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.302/App.xcframework.zip",
            checksum: "10f1f6bb978db6b77330568b89f65296b3d17e11ccb5ff538a6b63aaab065e4c"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.302/Flutter.xcframework.zip",
            checksum: "664a147385a0983bc001a856774aa3ff4178466d16ac10f4e71fdbce43c1d057"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.302/connectivity_plus.xcframework.zip",
            checksum: "460e8d17de4a5f2cde4a1792907effb378bd67bf073087445dfcb23efb8252c1"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.302/device_info_plus.xcframework.zip",
            checksum: "1f501a8cd093a23c95f80746ad9ef4adc1ca056a284e2395cc9e84d5451ec8fd"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.302/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "f2b10701029d79e6f258e438d5fa6856ddc327c86d2389fa2a2c2a8cbdc29da5"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.302/flutter_local_notifications.xcframework.zip",
            checksum: "4967e2a85e0da93002b01897fb8025c13af9c22062f8bedc202df1b56fb9c5e4"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.302/flutter_native_timezone_latest.xcframework.zip",
            checksum: "a2d90bf04416f756df60dbba9abee3f97ee92749054d71f42312903d51ff2807"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.302/flutter_secure_storage.xcframework.zip",
            checksum: "d10f6c510beb718e1757eaf28c001e0bd5f10cbef367f341d306cd0208615902"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.302/geolocator_apple.xcframework.zip",
            checksum: "44d7637664062f8b2262d7ffe22934efc5c461d2de7e2f812406e83961ad7919"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.302/health.xcframework.zip",
            checksum: "a1462b5b6dd1100fc5b4d08ac3ff9ff267ad2462fc23840f5229ae698aef70b4"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.302/image_cropper.xcframework.zip",
            checksum: "314221456eb21206bec8b73c2e907efb04f0831e5c477cc4bb0c54f32b73956f"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.302/image_picker_ios.xcframework.zip",
            checksum: "de4cc3aadac2f660e7fe77710326dd85c0be779a18bae59467ba9288f4954cf3"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.302/mapbox_maps_flutter.xcframework.zip",
            checksum: "6fa82fb38f355d9ef549a30762dd92092fe55347280087dc286a943cb3643b32"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.302/MapboxCommon.xcframework.zip",
            checksum: "442d8d666d88f39c50fdf57e4b7bc1c201972f6f190d7ea3a5c15e2a220020fd"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.302/MapboxCoreMaps.xcframework.zip",
            checksum: "b0bf55e43197518a2a6037f3d35f67dea90fef0ed4abdf0b1b42b191526451de"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.302/MapboxMaps.xcframework.zip",
            checksum: "c8a41e596deed935cc5743c129a441c66664e1ec097bf2163a9f7c64b8436fbf"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.302/NordicDFU.xcframework.zip",
            checksum: "32f2143d29f724ff56522550000ffac9f2323a8c3d856c901f01c0421e98722e"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.302/package_info_plus.xcframework.zip",
            checksum: "dfdc25ada74ce387c8ce11a7f934e20575bf5846e4d6838322c6e354fa6fb198"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.302/path_provider_foundation.xcframework.zip",
            checksum: "bf62e16044c6f1a2aef63cac97b5def84f17652de744b10123d926356773e1d4"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.302/permission_handler_apple.xcframework.zip",
            checksum: "6c3df9f8b27122a193eec9e87492ec30a3d90ef9a5051f1c9601f5a67b1336f8"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.302/share_plus.xcframework.zip",
            checksum: "4744aa9a4570eef1c02a286ec38a6af63c4ba57e0ab09896ff26fdd74f802550"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.302/shared_preferences_foundation.xcframework.zip",
            checksum: "71ae3f436fcb6be8149bdb320ed1ef40346a4293a1fd8965fac119cbd6a0cd9b"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.302/sqflite_darwin.xcframework.zip",
            checksum: "8e158dcf34bfbb030919beccc5dbbc29774dc9e97389a37c0ab195b1b760185a"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.302/TOCropViewController.xcframework.zip",
            checksum: "66d5d88d454c591315ce5aa6b12b76b3691b278d4d95a022df65fe46439b3457"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.302/Turf.xcframework.zip",
            checksum: "6d39a3f4587d3bfd627afc2d4151d0d775797decca570efdeb9c39c40e7a1c32"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.302/url_launcher_ios.xcframework.zip",
            checksum: "aec6eae0ebbcae627aaf9f459e6e08eda71c54541de566b75a25bca6f7ea1b56"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.302/video_player_avfoundation.xcframework.zip",
            checksum: "a0194b4dc3d29a7b4033ea29a5b34c3886d03c85532a38c4d86e00c60b1d1a58"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.302/wakelock_plus.xcframework.zip",
            checksum: "bfc5fe8af2a3031b682922670a298cb52f4d430b26d7288f4fd60c5511c556d0"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.302/ZIPFoundation.xcframework.zip",
            checksum: "bdb10a44f2b89b925ed116565634eca2feb8d97444aac0fdc1b34fffd4b5e086"
        )
    ]
)
