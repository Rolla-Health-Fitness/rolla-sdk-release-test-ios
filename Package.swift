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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.44-test.355/App.xcframework.zip",
            checksum: "628df9de9536d48b95429523e20688c393b585dd916fe940f4afccef86dcf855"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.44-test.355/Flutter.xcframework.zip",
            checksum: "93e4de29ae155ca4015c69c56bba4b9d97c68f95acc73cbb58ea992a2e3d6c42"
        )
,
        // Flutter plugin: camera_avfoundation
        .binaryTarget(
            name: "camera_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.44-test.355/camera_avfoundation.xcframework.zip",
            checksum: "2054383f3195a779487835cfa8de572cb76bd85647df5c382f3b52d498ab83c3"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.44-test.355/connectivity_plus.xcframework.zip",
            checksum: "8284079b1cc7597b37ac5641cd568d9760f458e983edbc02f260d7d82dad2d80"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.44-test.355/device_info_plus.xcframework.zip",
            checksum: "23c1adacfeffdbb933ff9f0b71b96d4592e28887ea83c847fb64a9397827cb92"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.44-test.355/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "4e62ccaacfa958423dd6e364e10c802b3b75d960dc1bc4ff6d8bb4dc9b327fb3"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.44-test.355/flutter_local_notifications.xcframework.zip",
            checksum: "b2754835530d4ab6f02da42e494604e7ecefa0f73aff16363b20473c370d8ed1"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.44-test.355/flutter_native_timezone_latest.xcframework.zip",
            checksum: "a63ea51ac86c0147c5e93f278be857b18b53958e17217a0e91618a47b7ff2a9b"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.44-test.355/flutter_secure_storage.xcframework.zip",
            checksum: "0bf97e3de8863bf21870e9ede79a9971f651f1770affab162a34e86e8af493e1"
        )
,
        // Flutter plugin: flutter_web_auth_2
        .binaryTarget(
            name: "flutter_web_auth_2",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.44-test.355/flutter_web_auth_2.xcframework.zip",
            checksum: "14f42d234ea4048758b06c1016b1e7b7261e63c608b4d509bb245943e3674a61"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.44-test.355/geolocator_apple.xcframework.zip",
            checksum: "07bf8623fcc3f8dc826382826c4484d3d87b1f0cc70b7ac024f792afedaf5e46"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.44-test.355/health.xcframework.zip",
            checksum: "a4806da88016ec64d67c499152ba628bbde99a1609211f477720c5680bfbc4ad"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.44-test.355/image_cropper.xcframework.zip",
            checksum: "c89c69225fe8fc4bee8d5b163cea3e45d778b45265c08acb4ae5708574355645"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.44-test.355/image_picker_ios.xcframework.zip",
            checksum: "fd05d0d8b8297fd3c03fb6b6f08832ef0a5832b828a22c7cbb3dd83769a7b319"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.44-test.355/mapbox_maps_flutter.xcframework.zip",
            checksum: "59a0f6cf66a683dab4b926f77e20c899d462b9becac9028fae871af57b571b85"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.44-test.355/MapboxCommon.xcframework.zip",
            checksum: "fc88747784a243063487ae2e14be0ef171c06108084454957db5c730861e4a5d"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.44-test.355/MapboxCoreMaps.xcframework.zip",
            checksum: "1ff54fbff1df9be2237c19f519fed1640a8008d0ad00ecb93f66738852561434"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.44-test.355/MapboxMaps.xcframework.zip",
            checksum: "bcdc9755a884d3ea17da328447f6a51cbfdcbe7f86209e766a79222a21761852"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.44-test.355/NordicDFU.xcframework.zip",
            checksum: "c163c5f7d31690d0e241feb63ef2551bb70eaf566fb84cb1168ebc45f204e070"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.44-test.355/package_info_plus.xcframework.zip",
            checksum: "52ae6f8694c2f45e756b244587ac44b95dcfcff9da75fc9910add465092adf41"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.44-test.355/path_provider_foundation.xcframework.zip",
            checksum: "eb8b90628b9ff559a8cc882aaf4e5e8ae9770371f744ee213f33904d41f849f3"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.44-test.355/permission_handler_apple.xcframework.zip",
            checksum: "24e5089c02ba18309581b73fe471f035940c67e5fcb48d9bf73cc2f69e355bca"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.44-test.355/share_plus.xcframework.zip",
            checksum: "17e77cf190eab871a11d95647bdcb76a158328c9eed7015a2cf09bf4da2f1523"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.44-test.355/shared_preferences_foundation.xcframework.zip",
            checksum: "b0d0abaa3a97a78dda7deaba84120717c47532ae01c96b12656a6aba1b1c6621"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.44-test.355/sqflite_darwin.xcframework.zip",
            checksum: "2cef7081741fff846bb4c1e417a7e2f25a8a37193f807cf2076435939ef5b7cb"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.44-test.355/TOCropViewController.xcframework.zip",
            checksum: "56535b7370a9f523aad0b32a5bfb21266a55f0da59e07212145585e2aa1b8af9"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.44-test.355/Turf.xcframework.zip",
            checksum: "ec5bb28c914a33d90aabeed2c816523288c81b0d45cd63a1acf7b133118cb253"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.44-test.355/url_launcher_ios.xcframework.zip",
            checksum: "71e15bd2197b6aa9763d89fe11f8e72685b04d8325b2dca6f371eb3cc69d7089"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.44-test.355/video_player_avfoundation.xcframework.zip",
            checksum: "958aa4ae1eeefa5a4449ab5cc407e6c34a0556f149abb218e14832ecab9459b6"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.44-test.355/wakelock_plus.xcframework.zip",
            checksum: "90b9c00555a3cc2f13ce767fa5d018e024625b6b16218cfa21d8a4f5c94a13c1"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.44-test.355/ZIPFoundation.xcframework.zip",
            checksum: "92929bef3a5f90886a3e6caec30350857f9484ba7188920f600a4c979f1aba81"
        )
    ]
)
