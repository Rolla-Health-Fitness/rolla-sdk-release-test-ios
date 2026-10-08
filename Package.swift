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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.43-test.353/App.xcframework.zip",
            checksum: "846c82ae2fa88b25269fceea7fc7d93623b541825c0875dcbca8ef01634038ba"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.43-test.353/Flutter.xcframework.zip",
            checksum: "82575c5963f8ba53d75cb8229c5ce45093d869afbb376334e325f2d85b37df2f"
        )
,
        // Flutter plugin: camera_avfoundation
        .binaryTarget(
            name: "camera_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.43-test.353/camera_avfoundation.xcframework.zip",
            checksum: "f1aa4f37a1c5c601f11ed32387170bdb9500086cc98a1e0b207881d5c1150875"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.43-test.353/connectivity_plus.xcframework.zip",
            checksum: "08bfdb3f0a2c4174cc980df5123164cd8175957c809afd9526b452478fccb999"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.43-test.353/device_info_plus.xcframework.zip",
            checksum: "2a3b9d6aa05e6f3f27030b05076b880addf1a5ecd16976596551cf5e3c1c3813"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.43-test.353/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "8e979518977e22b6f8271223820fee63161aa97ed94265601be66f0f8cfe0cb6"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.43-test.353/flutter_local_notifications.xcframework.zip",
            checksum: "f764f1321b50d2aa48faaf1d156d121f421a323b2f4a7b3188c6a77fbec31645"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.43-test.353/flutter_native_timezone_latest.xcframework.zip",
            checksum: "9969d5963634671f4718904945cb05988d46bdd0b59317330ea8f9f46ed59e73"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.43-test.353/flutter_secure_storage.xcframework.zip",
            checksum: "51a6a68b70031a12af8d3ead95adc623bc4a61b8cade24faf780a3710629a1b9"
        )
,
        // Flutter plugin: flutter_web_auth_2
        .binaryTarget(
            name: "flutter_web_auth_2",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.43-test.353/flutter_web_auth_2.xcframework.zip",
            checksum: "f922e32ac3fbd9ed3ec15b9319986ceeb751c1d7cb9536138e1ad103184efeff"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.43-test.353/geolocator_apple.xcframework.zip",
            checksum: "d0c9ef925966ef877ade1051aea915fd17d454995d0f350da3334862a4314b7a"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.43-test.353/health.xcframework.zip",
            checksum: "478cd73b515f81bf691cbe476f2911c6ba45e118a459156a6f6a7cdc9f900828"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.43-test.353/image_cropper.xcframework.zip",
            checksum: "27f2221e8467d748b0e4a42694f1e1a944a3b5b64a4ade7a86aedeb7f3ff2857"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.43-test.353/image_picker_ios.xcframework.zip",
            checksum: "f5b192466fd63c741921c9771b191c05b398bcd6b016f2b3f2a6264df22d6401"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.43-test.353/mapbox_maps_flutter.xcframework.zip",
            checksum: "4bac97fc5e11c19e4a43bc197ff08c34b5525d51a8e2f2eba38c96efda6c1088"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.43-test.353/MapboxCommon.xcframework.zip",
            checksum: "594474f0a7b480357ca631531efdf82b298bfa3dbd235eabcd3381935a4da521"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.43-test.353/MapboxCoreMaps.xcframework.zip",
            checksum: "c25d7895edbd0acbc9094d03780dc44bc4c478f737521c4f336098465c9ae0b9"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.43-test.353/MapboxMaps.xcframework.zip",
            checksum: "b41f57a7bfd61fcb7054782b8736c0b8f877b49e0f3bccb35f75195399b3c2f8"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.43-test.353/NordicDFU.xcframework.zip",
            checksum: "306bd67ac991bac32318889d4f2f91118717ba03a28a688f566f47bad3ff51a7"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.43-test.353/package_info_plus.xcframework.zip",
            checksum: "5b9bdf523cf68ed6cfeca9c66437f094ab62434d7048d696624171cd93443bab"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.43-test.353/path_provider_foundation.xcframework.zip",
            checksum: "4edb1ff51b0f58fd6e05f3dd4ec2dca2c4a37ca730507eb349560f1960b60e4a"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.43-test.353/permission_handler_apple.xcframework.zip",
            checksum: "d67af57a745dab013a9c7b2ac7ac94e95e4a80fa8be7d7a71c88767fded7870f"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.43-test.353/share_plus.xcframework.zip",
            checksum: "de354e447b4fb539b4757def6b3cdb7c536aa0ad1d39f29b83271be0d66fd76e"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.43-test.353/shared_preferences_foundation.xcframework.zip",
            checksum: "eb9b1810abe2a4871835e0a9f46bf974f93224afe623566c0c4fadfa0a453406"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.43-test.353/sqflite_darwin.xcframework.zip",
            checksum: "202aefc2a9b6fcea306afb932852d77107b795e7eafa57e9e8ee2129a7d03049"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.43-test.353/TOCropViewController.xcframework.zip",
            checksum: "3f014b5ca69db0cc9787a248763de0a9aee2cb75305209f8bf70393415ef2ab2"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.43-test.353/Turf.xcframework.zip",
            checksum: "3bbd68571ba6b525d264b30adb03bc7c5b17e968dd687887afcb801560def4ee"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.43-test.353/url_launcher_ios.xcframework.zip",
            checksum: "ce00e0e0c87e30553e75850343c5b0ce60b8736011364542a5ca98853b0e5e8c"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.43-test.353/video_player_avfoundation.xcframework.zip",
            checksum: "bd3a354992841d7345d34b5480d6836ceee83dd1cfb328ca12d8ba266b751690"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.43-test.353/wakelock_plus.xcframework.zip",
            checksum: "3ac5d2abb56d2575af598cda134f92e1fd41d8cfd0c76fa682949ad6e3136ee1"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.43-test.353/ZIPFoundation.xcframework.zip",
            checksum: "d6a8831bfa9e7f916ee2ec206228dda68e645e51ff5f813e9aa2eee2c5e1caa2"
        )
    ]
)
