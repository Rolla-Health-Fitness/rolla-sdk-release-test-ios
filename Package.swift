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
            dependencies: ["Flutter", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "FlutterPluginRegistrant",
            publicHeadersPath: "."
        ),

        // Swift wrapper API
        .target(
            name: "RollaSDK",
            dependencies: ["FlutterPluginRegistrant", "App", "Flutter", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "Sources"
        ),

        // Flutter module (Dart code compiled to native)
        .binaryTarget(
            name: "App",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/App.xcframework.zip",
            checksum: "694cc76e8ec2e0e87a7affd5c94735401a37e4e01a75d7ad400d6991d84d0437"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/Flutter.xcframework.zip",
            checksum: "8aa632d5b2513253a90f0315a9a17ea435224f0a8184e0e43184038bb792d9fe"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/connectivity_plus.xcframework.zip",
            checksum: "a4ead0b0531bfb0b78b28eb006b325916bfdffe2ef062881644b219e5084e6e9"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/device_info_plus.xcframework.zip",
            checksum: "7ece5a6d042311fcc8bd05674883a326d29fcd21405ecda17dd96a83d9f6f8d3"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "fc7e98e9b581b99ccf38a270c675a91a05c2c85636c32a250bae4866af7b810f"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/flutter_local_notifications.xcframework.zip",
            checksum: "8f7b83b46b05ff8ed3367da2f6d0b72938a018f53aac5e11b5e6927f76df757d"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/flutter_native_timezone_latest.xcframework.zip",
            checksum: "80f0f34eaf2b1406d6a08423c885380bf4a3fcb084aca41750d2e5fe1813805e"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/flutter_secure_storage.xcframework.zip",
            checksum: "67b79aa54a4e2c7d327cc54ac25c227b75e057068a0a003abb21546d15291a2b"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/geolocator_apple.xcframework.zip",
            checksum: "0f497cc7a422303eb20daa23610b4154d2634468cad82450ced89d9b635afeeb"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/image_cropper.xcframework.zip",
            checksum: "27602361554112a4eceae1dda1420b905568cac4a698b64a189b6dc46f0a8b5e"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/image_picker_ios.xcframework.zip",
            checksum: "b7f30363ae70f3b1e22b519a94dbeeb95c8b5a86188634a86752c22fb95b560b"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/mapbox_maps_flutter.xcframework.zip",
            checksum: "c8eeb6a0717437d9fbb181accc0651588a72abf9c94ab835789aae91afb55e4e"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/MapboxCommon.xcframework.zip",
            checksum: "d848b22867b8d686cd4810a820a3d7b73d88f21f59ad9ceb0b782db26559b11d"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/MapboxCoreMaps.xcframework.zip",
            checksum: "43aa1c047a453e169c9c058d80b6c14c718d968d8b1acbc2054e5cd1e71426b4"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/MapboxMaps.xcframework.zip",
            checksum: "69404f093f2b0b1a99a08bd454623bd6d34c7e0c18620d51b3dbd765a382a177"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/NordicDFU.xcframework.zip",
            checksum: "0e54afa7b6299b95f8f76734ddd20260f04c465c3b0b9ed034ed6eaa03d8160d"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/package_info_plus.xcframework.zip",
            checksum: "d41aa16f439f76e3805d88d700ad4fca34b98e68957e8c76d4c04649e56a657f"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/path_provider_foundation.xcframework.zip",
            checksum: "17bd7288a1514b2ff6dfe980e8dd99e94c6a5d587272a0eb83b3daaad990bade"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/permission_handler_apple.xcframework.zip",
            checksum: "b5221658caa40b78153cb3c5ec0f02335df81af79fdc9c7fcc02e0601630229d"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/share_plus.xcframework.zip",
            checksum: "d6495306a100f9bfff6ca0d1b5cb48e1213eba27f104a6955c8e8fb741af2150"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/shared_preferences_foundation.xcframework.zip",
            checksum: "a618ed3f605c84f71bd2d950fa4b3477d4d7761d0bac8b5660627e12c78d6b17"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/sqflite_darwin.xcframework.zip",
            checksum: "1dc2a36f833acf2cf980c2926c69cfef7f37bbe95ab1d1f249da0b00ba709df8"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/TOCropViewController.xcframework.zip",
            checksum: "ba1cf7588cad75a57a4b81850e288e927f0effbf547ecc0338cb127dfb516167"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/Turf.xcframework.zip",
            checksum: "b187b48267fbd6dd1a1ee015d74ab45cad251bdcd1f873b1d6c4bc883f6984cc"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/url_launcher_ios.xcframework.zip",
            checksum: "48fd0fbd4540d647b26b253899e9828c3098cb016dff8e7b127ea32d880ea6fe"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/video_player_avfoundation.xcframework.zip",
            checksum: "b3bf365b68ac2063cb06e3a6ab325fcf14bf822ef98c028bbb381a3e5faa77ed"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/wakelock_plus.xcframework.zip",
            checksum: "942b04c72f5f3b27e8c284695dc856e580e635b8310c315bb7768300e29708f3"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/ZIPFoundation.xcframework.zip",
            checksum: "295aed27aa3ede7b6cd95a839fed9842ab031992138bf4c916aa551f0e538398"
        )
    ]
)
