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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.54-test.365/App.xcframework.zip",
            checksum: "1210fe45f93ca942a81247192f26cb96934b555fba205a043761198b74dfd16b"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.54-test.365/Flutter.xcframework.zip",
            checksum: "d7e3f0123f6956f4f1ab91e0417dc1c9af976f91638cd42af807d215807e1ad3"
        )
,
        // Flutter plugin: camera_avfoundation
        .binaryTarget(
            name: "camera_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.54-test.365/camera_avfoundation.xcframework.zip",
            checksum: "3f55ae3f07026f8c01c7a5c4e95dce419066869ff7decf273332657dd6f94d25"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.54-test.365/connectivity_plus.xcframework.zip",
            checksum: "ab33eee75d06fad94a8a0a9a117071344f8642d8c8af08429cd19af50e2253f8"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.54-test.365/device_info_plus.xcframework.zip",
            checksum: "bebd99e15c364b8b326b0dc317cc4a3f6d947e640d0dd531189ccbe1526d2c38"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.54-test.365/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "af9c6b39eefe2e21089053cd3a48dc6f0e5a52db3692ecc258916e58495c8fe1"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.54-test.365/flutter_local_notifications.xcframework.zip",
            checksum: "19446212281afa961f3f6afcd677b5226652d480983bf631bdb668197b3a0086"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.54-test.365/flutter_native_timezone_latest.xcframework.zip",
            checksum: "2e52e8ef81a141119c9b4df8e90e0f93a788527c5e5ce7eb68901c75518fc424"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.54-test.365/flutter_secure_storage.xcframework.zip",
            checksum: "47bef3774e74588eb8aa6d7668eec393bfa462edf0386949747db36f61b58168"
        )
,
        // Flutter plugin: flutter_web_auth_2
        .binaryTarget(
            name: "flutter_web_auth_2",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.54-test.365/flutter_web_auth_2.xcframework.zip",
            checksum: "1191a5fdc6b54c4d1d00d1d55b059eab69ee0e859c627ec073c530414d545670"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.54-test.365/geolocator_apple.xcframework.zip",
            checksum: "2a27ebca920e1d045b8121815dab4b0f13c38b333ee9c2d910c1627d1c4ae954"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.54-test.365/health.xcframework.zip",
            checksum: "77498787f27078102f422cc38ba7d516a518dea126216b66a9f3b7e444b08f81"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.54-test.365/image_cropper.xcframework.zip",
            checksum: "96f053ecffdc08d572968624d02e09121ac45e0355ebcb70ede9062abb89d21c"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.54-test.365/image_picker_ios.xcframework.zip",
            checksum: "15300a4611dbb2d516bbb7aada56bc1b1236755a8079b0250be79b93064da20b"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.54-test.365/mapbox_maps_flutter.xcframework.zip",
            checksum: "3a7209d5442c8053644362aa90de69a1f0f0bc6cd24b3ea8b3a6cdb0daee37f1"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.54-test.365/MapboxCommon.xcframework.zip",
            checksum: "69ae6c6d433cc6327b0e3bd75a946daef1b94b12797f2f05232a05fa8e0de313"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.54-test.365/MapboxCoreMaps.xcframework.zip",
            checksum: "845cb587c8b0bb84e54ca04589dbf982f165f48503748d7982be157f493b8d75"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.54-test.365/MapboxMaps.xcframework.zip",
            checksum: "99c8ef012b116768d7c218c97f7e06c25687e1928a7e49d69a0221e1f1011e36"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.54-test.365/NordicDFU.xcframework.zip",
            checksum: "c3c8071e5ed5769e98837d44669370c4cd2ec8862ed0d9af35789825765700ce"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.54-test.365/package_info_plus.xcframework.zip",
            checksum: "5985b5c13870ca8999e325098f78ae013884480e0414bebfe58c3e8d2894c2d8"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.54-test.365/path_provider_foundation.xcframework.zip",
            checksum: "c0133846817dff1e2a46a43eea9a3940060ea1368193ca22969bd6749ae34ec4"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.54-test.365/permission_handler_apple.xcframework.zip",
            checksum: "08f4cf935c999bd86a6183eb1f1b24678e4904199a9d76e7e76ada788d541904"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.54-test.365/share_plus.xcframework.zip",
            checksum: "a32710c8b0fe517006b5fac44718f2206eb1924bacc5acc9da6e3e889d3f52b2"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.54-test.365/shared_preferences_foundation.xcframework.zip",
            checksum: "75e7f27e360b1b692af0b7a2ab82a5a49f31c75f75c27e6067af63d6d77b3054"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.54-test.365/sqflite_darwin.xcframework.zip",
            checksum: "ed3b03d7e665b1ce081829a4c772bf0d6ddd02fa86bc7b630cb82f2c90002265"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.54-test.365/TOCropViewController.xcframework.zip",
            checksum: "83966319cab9220c691bff1505c604f49a29afd9978b3bf665bd5573246e532e"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.54-test.365/Turf.xcframework.zip",
            checksum: "519675934cd64ac0a150e9112fd9e16f09d4f22f6b7bdef34a22721a8f8551e6"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.54-test.365/url_launcher_ios.xcframework.zip",
            checksum: "db69bfa2151105554b4471ee41fe46ceac1e879193416145e714e8f13fb6a4f4"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.54-test.365/video_player_avfoundation.xcframework.zip",
            checksum: "cd2b1537d3b711e96c15017f227d69fa1f5faff4aa27f07fac32eb084ef79664"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.54-test.365/wakelock_plus.xcframework.zip",
            checksum: "76cdb7662bb80a3db6558e811860f0201243220122a9e395bdaca9b94c3536d8"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.54-test.365/ZIPFoundation.xcframework.zip",
            checksum: "2ef3e704ef8d5e5b9cac0ad71c1f90d4de8c4c66cd3d66ea2427555d39fd506e"
        )
    ]
)
