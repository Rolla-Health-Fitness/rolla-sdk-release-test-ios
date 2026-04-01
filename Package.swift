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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test/App.xcframework.zip",
            checksum: "d474ee6c6c2a17433f64ea8a150ca3a6caa4bb4b41194ea9c598291fbd62cbc9"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test/Flutter.xcframework.zip",
            checksum: "eb8d1d95b9232a48546bc9cadae0188b7f4f82dbd54b7ee6f083ae21071484d9"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test/apple_health.xcframework.zip",
            checksum: "b759a980a4efdb26fb2223e4522ffdb6a9fba0f86d3b08f7ff430c3da3ecc39b"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test/connectivity_plus.xcframework.zip",
            checksum: "dd99ed3cc1ecc529dd0aadd8cf0f0ef91571a7e580cac97096222df39e83a5c7"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test/device_info_plus.xcframework.zip",
            checksum: "636b735af84be01c940095d2b55267c4273d0168de83ed77c25fd5587ee24dbf"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "e179b86ece2b0404931ad85c8b3db836509e4881591f78fe74bda1ef4caa5cd9"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test/flutter_local_notifications.xcframework.zip",
            checksum: "c9a652aaae195a88b57fbb5e8905beb3de68e0de0d6cabaa5e49591c1e32415d"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test/flutter_native_timezone_latest.xcframework.zip",
            checksum: "bf22b80cf3bd501e4c0eab295f542aadcd2ae9d4075eaf154957b41483f500af"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test/flutter_secure_storage.xcframework.zip",
            checksum: "1ee776379b1c928d657e58aaeec50ed9afd99861141fbcc170d33050dabbe5b0"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test/geolocator_apple.xcframework.zip",
            checksum: "57c25c1f4c36274ac4c50a4397f9177fb27c3237def43899fafc2851c1ac1b11"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test/image_cropper.xcframework.zip",
            checksum: "b7aeb619b58c3d21688b69576b217d3e3a385806a3e75ff53171c40971496445"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test/image_picker_ios.xcframework.zip",
            checksum: "9a02aedc2e4bde821cc6aa1f00478d60474d549af4828387eda7832ecd18d5e6"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test/mapbox_maps_flutter.xcframework.zip",
            checksum: "cd7fdfeb5d5b26c36102609a05430dc150397ffa76aa07d8d4ce4440f733529e"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test/MapboxCommon.xcframework.zip",
            checksum: "4847e4a04801067d7b173b03962833638ee279edcc0803b127714d6ad8bd326d"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test/MapboxCoreMaps.xcframework.zip",
            checksum: "3b5f320f5a0aacd8b62a9d14628f03b1f59a6d17b7572932c050bba95f658b14"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test/MapboxMaps.xcframework.zip",
            checksum: "ccef616e750c7e980861c7c54a5f01760424b3bc53280e94f4b529168cf7ad2d"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test/NordicDFU.xcframework.zip",
            checksum: "7ed208ba94c8b815bd768e88b668f3570ee441c95edfc290a318e6574e4643b8"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test/package_info_plus.xcframework.zip",
            checksum: "50dea4d33504a0c61769c0b4f8ffc4eb17ec9c8ab50d8adac8772800eaa2a332"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test/path_provider_foundation.xcframework.zip",
            checksum: "11db787b0d7e55b4045bfe175f1520f8956c734bde5b18601b0551516efdcec4"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test/permission_handler_apple.xcframework.zip",
            checksum: "b25c2a8d0d00cac4f91528221d73c683ffccb8f52298561d0a066f838e48f0aa"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test/share_plus.xcframework.zip",
            checksum: "c02877c44d3a6097c4428e668dbce99db65d92a294c275e4d5a9b719683bbc5b"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test/shared_preferences_foundation.xcframework.zip",
            checksum: "9f71a2e454997036d648651a40b8a65c10e1061ee7a8fd56075b776e3371bfda"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test/sqflite_darwin.xcframework.zip",
            checksum: "6c14626440bdd72252e99625ec0c25695c9e150016fb16875f5741c73ed00ce8"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test/TOCropViewController.xcframework.zip",
            checksum: "a83631ca76770110436a8adf3d8671f9a10258780d952c31d12f2af46dd2ba2b"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test/Turf.xcframework.zip",
            checksum: "7ee69331d5fdc6cc71f9b035a6f670cc0a7c052f21ab50f497bf5e6588edd09e"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test/url_launcher_ios.xcframework.zip",
            checksum: "af5caa7a66ed90b3a2cf066bb41772ef997d231a122ee4fbb7bdd631b65e111c"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test/video_player_avfoundation.xcframework.zip",
            checksum: "f700f58bff2dd2f7c3a98e3846c1c87d420d801df2a62ff2d2ab2fa44d4be995"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test/wakelock_plus.xcframework.zip",
            checksum: "2719390003c444d669c75b8f6b0b484a8fbc2c2b817d4113b1991c10cbb5d669"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test/ZIPFoundation.xcframework.zip",
            checksum: "6dfdf6d512d8905f3017268c8708d3f896af8d6e3f455df6b2501e77bb85d996"
        )
    ]
)
