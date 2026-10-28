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
        .iOS(.v15)
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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.60-test.371/App.xcframework.zip",
            checksum: "f5fbfa2c75cffc0e31496a00ceff3b4603365bd9fe7222864788195afbebc1b0"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.60-test.371/Flutter.xcframework.zip",
            checksum: "b22f651b0815fe014844e6bbb0c793731584d4d2a3759235cf0b24328e666ece"
        )
,
        // Flutter plugin: camera_avfoundation
        .binaryTarget(
            name: "camera_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.60-test.371/camera_avfoundation.xcframework.zip",
            checksum: "b591ca380e6fcd1e1aa92024fa89172832c928045a17e815cd8d275bb7306cfb"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.60-test.371/connectivity_plus.xcframework.zip",
            checksum: "dc5e11f78db133762ca00b98e484188cd9c9c70579505a768ff92f1220869e91"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.60-test.371/device_info_plus.xcframework.zip",
            checksum: "643734efd51f8c14463115d85737c915121d62b3169e206de087a0bb91d58651"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.60-test.371/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "292e3378be8442d79dccfb6de291f060b1b255ee39ceca54b86c3716c558a19c"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.60-test.371/flutter_local_notifications.xcframework.zip",
            checksum: "3cb40af2bb74e7959e6f523a7a473609c3eca1f84fd6fa9ec40857c43536a6ee"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.60-test.371/flutter_native_timezone_latest.xcframework.zip",
            checksum: "c2718ab62436afb86c34f1251baa6c8afc855b14722f1c0b67448d72f94eba74"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.60-test.371/flutter_secure_storage.xcframework.zip",
            checksum: "596dafc698ab432f1f889852bf25724a273a7385249d12ba9c84c5d4deab750d"
        )
,
        // Flutter plugin: flutter_web_auth_2
        .binaryTarget(
            name: "flutter_web_auth_2",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.60-test.371/flutter_web_auth_2.xcframework.zip",
            checksum: "f50cbe0930c1dadce3e5a69a37723751007cb167a15cac412f03d8c67349aa87"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.60-test.371/geolocator_apple.xcframework.zip",
            checksum: "02bdd65c67d982f08dcccab3e93e8e28609ad572a3647651e02e017c4558fcd7"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.60-test.371/health.xcframework.zip",
            checksum: "16f848f199eb62d1ac58819ce3cbdb5a31821d3885f1eba478b858f8a474530b"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.60-test.371/image_cropper.xcframework.zip",
            checksum: "fcafa89939be6287fa2577729d96d20602c3ef1de6d07e4ba1861baedc55cbe3"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.60-test.371/image_picker_ios.xcframework.zip",
            checksum: "adf459becae58f62156c73ae43866e8c9663819a29d5994b64aab05abb2a6634"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.60-test.371/mapbox_maps_flutter.xcframework.zip",
            checksum: "3f1c74aa4d81f55354bd31e472a4ed323f1e280e0343755807d95a4f4f7ab6f4"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.60-test.371/MapboxCommon.xcframework.zip",
            checksum: "34d99b61dbea4858786ca315ad9354fdb89836c1e17f0d2d9d3e57ec31ce0369"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.60-test.371/MapboxCoreMaps.xcframework.zip",
            checksum: "c458d0deca41891dbb25f45d73cc9d10628fb77c9f4dad72e4aa883c57d093f4"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.60-test.371/MapboxMaps.xcframework.zip",
            checksum: "4b0168cfc1c2ee042857802088ed053008ad1dd35032d288f2d3f1d891fb5ccd"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.60-test.371/NordicDFU.xcframework.zip",
            checksum: "4a729daed868b05c23e0ed9bff3ab9665893d6006ae204c9685c2d9d0ee5a20d"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.60-test.371/package_info_plus.xcframework.zip",
            checksum: "c8c9aafca87baacc09c256cc0c0fd8a47bc159b6ec59273300d4304aa342692b"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.60-test.371/path_provider_foundation.xcframework.zip",
            checksum: "1a4622d46791439338739ac8a384505d41b0302ee5493b2a3f4af36fe0bf5fe8"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.60-test.371/permission_handler_apple.xcframework.zip",
            checksum: "726440b0d1664a11e3425eaed29cc53c757732b1c2592884dba368e9cc0ec1f2"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.60-test.371/share_plus.xcframework.zip",
            checksum: "57df3c1a938a1199361740af9cc5334696249f7e93e31797b0f4ac3f47c2bdfb"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.60-test.371/shared_preferences_foundation.xcframework.zip",
            checksum: "7c4e4328f8134abdaaa2de4b6218ea0daba487e04ba7e203c813b1c00dc7a8d9"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.60-test.371/sqflite_darwin.xcframework.zip",
            checksum: "8cff696356c1c573f8a4be45aa0cac44ddc285a9c091ae1e7bdea658c77daecc"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.60-test.371/TOCropViewController.xcframework.zip",
            checksum: "30dd94285f51e6d071a084e45163abac42de3a93d10d7e698f35060474554eb2"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.60-test.371/Turf.xcframework.zip",
            checksum: "ab132b89fd19028aa84691ecf7f07631a9883cb90376e1492dd726ef528d42e3"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.60-test.371/url_launcher_ios.xcframework.zip",
            checksum: "0b2aabd67852679cfd4162ac311fad16dc19379d0e3cb093895f6f78728bb304"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.60-test.371/video_player_avfoundation.xcframework.zip",
            checksum: "c03d18c37d708be354f1223c5f9e9b6a03ca4ec1c9595381bce13d9e9006837b"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.60-test.371/wakelock_plus.xcframework.zip",
            checksum: "f0e007b48e20b76e4af0a6ed993836fc44303e489af7f2d1873146ce1b5c3418"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.60-test.371/ZIPFoundation.xcframework.zip",
            checksum: "a6dd0f3cfbad5913828c7536dc22a109b2d13392585ccbf3f70ab95fc259a1af"
        )
    ]
)
