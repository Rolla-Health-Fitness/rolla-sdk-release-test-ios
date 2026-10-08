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
            dependencies: ["Flutter", "camera_avfoundation", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "flutter_web_auth_2", "geolocator_apple", "health", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "FlutterPluginRegistrant",
            publicHeadersPath: "."
        ),

        // Swift wrapper API
        .target(
            name: "RollaSDK",
            dependencies: ["FlutterPluginRegistrant", "App", "Flutter", "camera_avfoundation", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "flutter_web_auth_2", "geolocator_apple", "health", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "Sources"
        ),

        // Flutter module (Dart code compiled to native)
        .binaryTarget(
            name: "App",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.42-test.352/App.xcframework.zip",
            checksum: "48f26302c1816ec3014920bdfe9523e40bf0b18dc0c17c77004ee21324b8a45f"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.42-test.352/Flutter.xcframework.zip",
            checksum: "1ab5e7722d8ca0fe05d0baced4d41cb61d4cd018eef75b5b9355a750b7e184a9"
        )
,
        // Flutter plugin: camera_avfoundation
        .binaryTarget(
            name: "camera_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.42-test.352/camera_avfoundation.xcframework.zip",
            checksum: "3f704f8f5ef10dd9923ab17d8a2b3b188e5143202c1f1e39a6c80fe58ebdaff0"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.42-test.352/connectivity_plus.xcframework.zip",
            checksum: "afce322e89670fa6cc96a05c744696c219363c1c2512c7e2819cac362d8a8d07"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.42-test.352/device_info_plus.xcframework.zip",
            checksum: "0c4afca65b4fda08754c8bd9c847ac60a6284c7f114249adb00afdcd3f2577e0"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.42-test.352/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "dde70c078dc95fe6b29efb9015004476149b15bdd00baddc9d445201de4e2e56"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.42-test.352/flutter_local_notifications.xcframework.zip",
            checksum: "05559ec167275ea1e86248a7abb0cf67d90dbe646b3ff36b9cb8e436d803cb58"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.42-test.352/flutter_native_timezone_latest.xcframework.zip",
            checksum: "51179cf14239be92357787dd700d1a5753bb3412679cf8c9d6ceae92a6aa73c2"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.42-test.352/flutter_secure_storage.xcframework.zip",
            checksum: "2476d4e7315534b588cc793a2e334e278fd26e684c1c121c8ef674e3cf9ac3e3"
        )
,
        // Flutter plugin: flutter_web_auth_2
        .binaryTarget(
            name: "flutter_web_auth_2",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.42-test.352/flutter_web_auth_2.xcframework.zip",
            checksum: "8584ba3c35fd3a27be0a3d6f81b371cd61145226d5d4599a6e67b78b97705a8f"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.42-test.352/geolocator_apple.xcframework.zip",
            checksum: "c1c40f70754acecc6ea6fb838283b8f3084d363ac5c93b6c891ce95d220e879f"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.42-test.352/health.xcframework.zip",
            checksum: "96cddc3d6cac5773c2b29c081ad1eaa976484373bc45d9430f1c4d1e097663a4"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.42-test.352/image_cropper.xcframework.zip",
            checksum: "7288a6d1b94a41ce2b926b5bdededa28839b63eeb7fbaa9239f1639ae3ea9396"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.42-test.352/image_picker_ios.xcframework.zip",
            checksum: "fa5042d263b9abc8e01e78b277ef83cda2dfade60befaf36777e669566014dbb"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.42-test.352/mapbox_maps_flutter.xcframework.zip",
            checksum: "50652084420a791378b6e69b2c01a0e733bc835defc1097b2f85b3b8cd6b270a"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.42-test.352/MapboxCommon.xcframework.zip",
            checksum: "cca22296df3de9b7f1da50f375244258219b8ba73e32bd912d999bdd96ea6ac1"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.42-test.352/MapboxCoreMaps.xcframework.zip",
            checksum: "b669a7216da4d0c124ccb69b6b67618bc5775092fc87fc7ba0c640329bd92cac"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.42-test.352/MapboxMaps.xcframework.zip",
            checksum: "d4271fecd509ffd22381636776df189e975d53236268c28b9ff5f302866c1e81"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.42-test.352/NordicDFU.xcframework.zip",
            checksum: "0951802d7b0b9430c3181eb2f2c7d08f5d51e053d2fd92d0f53b51e5b8b7d2b9"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.42-test.352/package_info_plus.xcframework.zip",
            checksum: "6a4f2f64b0298057fe15a9785f56469fb96756fd8807be232d950e3e4b3c45ad"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.42-test.352/path_provider_foundation.xcframework.zip",
            checksum: "e6b5f98da0eb8272c5aa6dd1489442bb8da4beb98c91a904e90599b7dd5ce91d"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.42-test.352/permission_handler_apple.xcframework.zip",
            checksum: "302da14d6f63f8d1332993aa63e1ee55d87c39baea97d5ad0a18ad9ec2dddc6b"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.42-test.352/share_plus.xcframework.zip",
            checksum: "d68215779c0c281c4a6afe5a460f3c832028cac220dcb09678997ca47d50af78"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.42-test.352/shared_preferences_foundation.xcframework.zip",
            checksum: "4709a5b478f146237d86b388b243e850e095ba194953112a7b7166ee254a1638"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.42-test.352/sqflite_darwin.xcframework.zip",
            checksum: "69bd2e5d8a4af778743958a57efae286931332a30c723a979791c2f480cbef38"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.42-test.352/TOCropViewController.xcframework.zip",
            checksum: "7ff3b8dd6891a7d3e444f6d7e0d740ec82dd5a74c17e1e9c1653439968d3b8a1"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.42-test.352/Turf.xcframework.zip",
            checksum: "a966f26ad388d5a596a1e061cc847f73c346dd2ee45950ca4573c219c4aa884e"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.42-test.352/url_launcher_ios.xcframework.zip",
            checksum: "be01a84b4b2c4b024481327ba11b27f03c7e7bc30e6b29d0bb60b64b593b74c4"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.42-test.352/video_player_avfoundation.xcframework.zip",
            checksum: "d3ab43fba6653fdd5e7f374ce953dc18f597c2439638693d0d155dc9718c2c18"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.42-test.352/wakelock_plus.xcframework.zip",
            checksum: "2f319ad069404e8e0df0f602d7afc44927a3a7811dd11a24bb2e8ce949d6895a"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.42-test.352/ZIPFoundation.xcframework.zip",
            checksum: "576ba30cd126a30ee84e9b673fe85ffb555e981505624f7bef8f44e7b3d83746"
        )
    ]
)
