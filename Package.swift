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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/App.xcframework.zip",
            checksum: "3b025392a45a135cf7e5822bbe2a99c11b58fa227daea8a04f95187509969651"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/Flutter.xcframework.zip",
            checksum: "db63e9ed67db88703ee98e95b0fcdbd2579b23a594220d2e9878dcf23492fab5"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/apple_health.xcframework.zip",
            checksum: "9eb82fcbe7ff5fee83005729b25632e045bff691374ef124125a003426a04983"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/connectivity_plus.xcframework.zip",
            checksum: "082821bf9897cb33481e3cda077a312db1271e83ecf77c04d1af364dc8c0243e"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/device_info_plus.xcframework.zip",
            checksum: "c6dcc3ca073b5e9701a2a4f8466360afdc4b48a5e6eaa6ee5eca58efc630ffb3"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "8290817565a60b2e1fadb06a938242f65aed2f1d2f7635ed5bb779ed96e3ff30"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/flutter_local_notifications.xcframework.zip",
            checksum: "460e188100da5602e4a4a028c56c44d3552d2154edeccfd34c28f59ae4a7d7af"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/flutter_native_timezone_latest.xcframework.zip",
            checksum: "fcaffef62c340fb6d5ec64406c7e24bc6baafdeb731d0945b0525da14d0cc78e"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/flutter_secure_storage.xcframework.zip",
            checksum: "b785493861508a50cdb875cb4c4adb7407349aab4aa3f02173bc44d037fb1f00"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/geolocator_apple.xcframework.zip",
            checksum: "59f216bb542e23297e3fa3e7ffe68810228aee34c1f8c283d9db4ecc489a647e"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/image_cropper.xcframework.zip",
            checksum: "b8f57efff0dc861590dc092dcfb3c452d33c480ac56759fd070f527fc56198b3"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/image_picker_ios.xcframework.zip",
            checksum: "ade3296d575a629088df18a4ca33d55d0d6af3ca799aab9c0ae0d3469e17afd9"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/mapbox_maps_flutter.xcframework.zip",
            checksum: "90ca0555af645f01a983364250cec7581097eed2686cc4616d346cf8ea079e39"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/MapboxCommon.xcframework.zip",
            checksum: "1d5c736a10c79a18d32e46aa8b8ea85efe7d68a6a528f7890cbeee74cf3ec2df"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/MapboxCoreMaps.xcframework.zip",
            checksum: "72ff41c4912d0c60b10d61c78f16baa55393046fcc00921f636a00c709e81cbc"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/MapboxMaps.xcframework.zip",
            checksum: "e711d8bde242d6e24a4f61b6f34748bb4e288d3d0f0213ea2e957fb6497c2d0c"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/NordicDFU.xcframework.zip",
            checksum: "d04e4d1af66aa7d4b2275bdd442b3a617a5f7e04e394a09e5269707593a438d3"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/package_info_plus.xcframework.zip",
            checksum: "24770762498c468a13f486df2e1c323e45ed01c0aa485d19ff5fb1eda78b0ce7"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/path_provider_foundation.xcframework.zip",
            checksum: "87055013edf381f5175356824c9040c7572a171a1ebd163382c990a1ac1bc83d"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/permission_handler_apple.xcframework.zip",
            checksum: "1d2453aece7807c17eb4c7e4d9e9bb0cd4936cd98f9f762965ddc1fc78e3bf73"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/share_plus.xcframework.zip",
            checksum: "0ae6d85d884e09a2a59018c3f6cefcf7e6884d9385f574d01de15d117f37bd07"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/shared_preferences_foundation.xcframework.zip",
            checksum: "e7d32f838809860c57f79e01eaa91401f444bf0b57486ca88ee7ddcaef353fab"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/sqflite_darwin.xcframework.zip",
            checksum: "a321040e3c7d7a44e3cddec197cdb7b55bf41e0d91e61df698a29f4b3c0dbf3c"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/TOCropViewController.xcframework.zip",
            checksum: "59f1878a70e3ac1b0b22805ac780628bc18a409454bbf53ee3b889f653ed7600"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/Turf.xcframework.zip",
            checksum: "49c7a3bc3515de425e827bc02b0b42336e5a1f4364574832bd7b38a3f98809c6"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/url_launcher_ios.xcframework.zip",
            checksum: "63422bfb7429117411e227a47ea536b8a385becd711a0f8ef6f9496cdbd496dc"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/video_player_avfoundation.xcframework.zip",
            checksum: "e3da83f0649bd89530b0242067281cf548e6956b3b0b96a4ad652cfc9b77c0f8"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/wakelock_plus.xcframework.zip",
            checksum: "3b4229609cbc5631acbe3f8f086906e61b8bf8646b12b77dcd98635ad95abfa7"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test/ZIPFoundation.xcframework.zip",
            checksum: "9066ef4d01f1593265c66664b3f298ab4d223a6433c6c03d31398c7e7fc2d9d6"
        )
    ]
)
