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
            dependencies: ["Flutter", "apple_health", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "FlutterPluginRegistrant",
            publicHeadersPath: "."
        ),

        // Swift wrapper API
        .target(
            name: "RollaSDK",
            dependencies: ["FlutterPluginRegistrant", "App", "Flutter", "apple_health", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "Sources"
        ),

        // Flutter module (Dart code compiled to native)
        .binaryTarget(
            name: "App",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test/App.xcframework.zip",
            checksum: "eb63b1d19210816e4ca7d01540d9cc3f546b64602246696175dd5d5197a11cdd"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test/Flutter.xcframework.zip",
            checksum: "2861eb04e19d3721064451d74ec8d0d60cac29f5e453b95b47eab54df13cfa7a"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test/apple_health.xcframework.zip",
            checksum: "d40ddff719a30efb7113d7141eaeeea549633692aad65f2d585d271a58483155"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test/connectivity_plus.xcframework.zip",
            checksum: "6f73ea4d975874d50a05b5f7a9971a0e859e5a9d5ef8893f1fcc9850341ee2bc"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test/device_info_plus.xcframework.zip",
            checksum: "5cdd0322288ae376c125f217431c2bac25817b927dd22d2bf74ad69b5be89be2"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "b4cdfa92700e78a608abd7b66aa4e744da61fb4b2b2660783529899c591703ea"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test/flutter_local_notifications.xcframework.zip",
            checksum: "6d3a9b972f1fbaf89b099c720aec2bbfd74c34bf1e09fa36fd78c088880bec83"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test/flutter_native_timezone_latest.xcframework.zip",
            checksum: "94275b1d13ca0eba32bc73f5584b387aa7c93db9995d0ef9569baba808f07f21"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test/flutter_secure_storage.xcframework.zip",
            checksum: "ce2ac19bf4becdbd2ec4915793109f271c6b8a38dcfd52309c9e9ac71b506751"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test/geolocator_apple.xcframework.zip",
            checksum: "6ebf129272ce11d2441653552c766a4c63d2b1e6736c7b9e997e035cd4a0ba40"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test/image_cropper.xcframework.zip",
            checksum: "b0594afacadc20f055c72c5aac643d0d62e2e8f55467ab468dc7014ffa902310"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test/image_picker_ios.xcframework.zip",
            checksum: "2623d83fd65844dc961a57043b32d3a2b4350b768a5fd89d0ad53a91dcb9abe8"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test/mapbox_maps_flutter.xcframework.zip",
            checksum: "4543e0e4c4f7901a53aba6a341b32f619733723b172110cecf9aff7ecd9a0841"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test/MapboxCommon.xcframework.zip",
            checksum: "80548ba63207d8160b294ca84a984ed12534e77f0bd64e5e2d77fe46d5f1af4d"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test/MapboxCoreMaps.xcframework.zip",
            checksum: "c44303b97f58616184ec08bc2887b23be6ffbb7ab1b7cee9e5a2111b12198fb0"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test/MapboxMaps.xcframework.zip",
            checksum: "4aeecb1324a10b7405d1e165e9801fd24b5f4c8b41051be9a6027c275c21324d"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test/NordicDFU.xcframework.zip",
            checksum: "fe959f02e75d1564ab44702b8aa44fb8f0f01a3a3bd2aa652ccafbcd2274dba6"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test/package_info_plus.xcframework.zip",
            checksum: "1fea0719acb8d8a1d7831ce59cdd148bab816f6eb383c085880770f1ca8840aa"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test/path_provider_foundation.xcframework.zip",
            checksum: "af2da85565dc136d56f34044307cbf39b999316f87ef9e798c64e75948e2f55c"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test/permission_handler_apple.xcframework.zip",
            checksum: "7af14ca82c7f36dd0aa6439350491464c9604a7888e603d25ef3db2bde20894e"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test/share_plus.xcframework.zip",
            checksum: "86d7397cbf721bdf9f2eb8f718db4fa6aae479cff08c9280e0d45902d92da64e"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test/shared_preferences_foundation.xcframework.zip",
            checksum: "b1fa29f9fc1bd8b06fb67ca6b4697c0113d7afce2229a7dbcd134c8b66f914e3"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test/sqflite_darwin.xcframework.zip",
            checksum: "ac3738f44660502db92fa71a5fba800835b97d6f9ad43bbff904427bdb94ce80"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test/TOCropViewController.xcframework.zip",
            checksum: "1d27f15ef52568c2bca36c9c72d3483a3570dda811f166aa2e3880221c1a01be"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test/Turf.xcframework.zip",
            checksum: "19fe0cdb382158fbc1a8ee5f73dc2ea55e36d4e805c0d63bae629d2fce3166fd"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test/url_launcher_ios.xcframework.zip",
            checksum: "5ed27bd93c8958c677e87f632afaa078686927a3196f8116600b86b16ab6c719"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test/video_player_avfoundation.xcframework.zip",
            checksum: "8f3cce2fb0235823e61f35c5d6048628a8b3b7544bdc432fd05369f52fd8b21e"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test/wakelock_plus.xcframework.zip",
            checksum: "24dd4684caa2c4c1476c7059bc0d17d055d237cb38020caa074810174f07338b"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test/ZIPFoundation.xcframework.zip",
            checksum: "e0418bb48a9aee853ae5a72f2030a4a6c470af1eb5636ee0b47182f059c570d7"
        )
    ]
)
