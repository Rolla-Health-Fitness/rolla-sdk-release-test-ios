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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.304/App.xcframework.zip",
            checksum: "5c4163d0e1901595017a7bd1b30f137e52ffddf7fd36f4cbc5a9000382400bcb"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.304/Flutter.xcframework.zip",
            checksum: "ee3a40a7f884b5729e9034beb6f20d1a6eb78fa24aef470ce4f3e6c2982bbf25"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.304/connectivity_plus.xcframework.zip",
            checksum: "741a9041ec828abe2808ca4587e67587b67fd11ca914d23c67a3f8c9e8b96304"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.304/device_info_plus.xcframework.zip",
            checksum: "3a85f68030a3c82992b2870e96162eaa3ac468f5ea02e018d328fed4257a8cda"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.304/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "d639c02fbc886a1226511cf8861e48a34df2a2f08abe6140d86f1f992f7b02bd"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.304/flutter_local_notifications.xcframework.zip",
            checksum: "7014d36fe67002da9e6bf5f3261c1e8255fc0eab057e1346345b853b0b81216c"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.304/flutter_native_timezone_latest.xcframework.zip",
            checksum: "517f1326685c8f7ec1f5021185ed9ed1f18f9736c1f8d16cbc6027f8e5ea8575"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.304/flutter_secure_storage.xcframework.zip",
            checksum: "12c89bca49557695ede9a10b00a2687837fe55e015f72ddd2575daf2dd272a95"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.304/geolocator_apple.xcframework.zip",
            checksum: "28f4afc3202be6d400beebabe3ee1a67799ef3762b133f4de4a8e0ec315cb6af"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.304/health.xcframework.zip",
            checksum: "255296e4df60c7d6af32f09df54d0465af79cbc2a6622b6be626d83517f8785f"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.304/image_cropper.xcframework.zip",
            checksum: "c18383a39f0d23b753ffa970eb8ad445e1ac992b997dd7427938994a7d807dd4"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.304/image_picker_ios.xcframework.zip",
            checksum: "9e23bfb1dbcd4906457f211b71581b0b0ea9ddc313039a2ccd4f6b14e5a6f17e"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.304/mapbox_maps_flutter.xcframework.zip",
            checksum: "375162fa3287ee72c0473af7cb71406b9c4fc9b0081d59f6930157a2a7590ed8"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.304/MapboxCommon.xcframework.zip",
            checksum: "31d59da747a432b67e51db745648e29f766593122ce44eda5dcbae5ce4068002"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.304/MapboxCoreMaps.xcframework.zip",
            checksum: "2f33daa6fa8ecef06ac3e79b5098a1f034e19ba284e160097bc2da0248b3c0b6"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.304/MapboxMaps.xcframework.zip",
            checksum: "a92cccce4f056c46ec40d27b8a74f15a23c09e93c959204a74e189f469e7a7fc"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.304/NordicDFU.xcframework.zip",
            checksum: "1173a47afc47ef63d60e0c4033468d236650c4d5b8c70a2563b534220745072f"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.304/package_info_plus.xcframework.zip",
            checksum: "2ff794616b9164fb649e6a3c89e59c9bc5bec7dc0a8277b75da7da90692b3c93"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.304/path_provider_foundation.xcframework.zip",
            checksum: "5a13efe4b44be58bf3f85626985f735190f8b4b3ebf7feb6a47fcf65e7f121a5"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.304/permission_handler_apple.xcframework.zip",
            checksum: "e839b5a0a6d35867376604ca8218c077beb62a113b7ea789baf290bd19cfeee2"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.304/share_plus.xcframework.zip",
            checksum: "cfbbd850182b301b75014caf095fb691c1a153fb7cca054d899b4d882fece9df"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.304/shared_preferences_foundation.xcframework.zip",
            checksum: "c3ce0c1bb9548ebdaf1387905584805f77ac82749f11d345a01cc94b27a82919"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.304/sqflite_darwin.xcframework.zip",
            checksum: "b50522f19c22d10e3d44f08824895e7174d3e5093eb6dbb832891d4eab7e9c8c"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.304/TOCropViewController.xcframework.zip",
            checksum: "b7c99667c0f573a3c1a39a02e6aed16908f6fc60d2c12c3fd9213a8eac79d16d"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.304/Turf.xcframework.zip",
            checksum: "3ee5d06d9cf47205af51e881d5419b9ec5029d086f549987e77992c05e9a72fe"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.304/url_launcher_ios.xcframework.zip",
            checksum: "14cd65cf3d07bc703b8c699be86ff52f6e94a60f7005a1f9100dfb0710b5da28"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.304/video_player_avfoundation.xcframework.zip",
            checksum: "884bb31d0153ceee58409d12cbb3f331f9dc019eaeae2847a14e0718026de8de"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.304/wakelock_plus.xcframework.zip",
            checksum: "f47c4be5c3843146b6285ae0e832b65881b3524c546477340c5547c4f317a30a"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.304/ZIPFoundation.xcframework.zip",
            checksum: "49b910e3b15ffc9886fe57bce39222554936cc882154c26070721e399cffaf36"
        )
    ]
)
