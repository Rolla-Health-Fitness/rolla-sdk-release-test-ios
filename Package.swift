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
            dependencies: ["Flutter", "apple_health", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "health", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "FlutterPluginRegistrant",
            publicHeadersPath: "."
        ),

        // Swift wrapper API
        .target(
            name: "RollaSDK",
            dependencies: ["FlutterPluginRegistrant", "App", "Flutter", "apple_health", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "health", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "Sources"
        ),

        // Flutter module (Dart code compiled to native)
        .binaryTarget(
            name: "App",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.248.1/App.xcframework.zip",
            checksum: "d4fdfa4a4cb6aa405e7b4fb51b5b869e321de9dbc9436bb14d522dc1be3ee332"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.248.1/Flutter.xcframework.zip",
            checksum: "0a7a2d130197dc8b22012b92df18156e1d9516ae94291626acd47ca7db71a9c3"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.248.1/apple_health.xcframework.zip",
            checksum: "6f560a65ffae1b3f40121d8f3c8310f334fa5136870977ccff707abf004bf0da"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.248.1/connectivity_plus.xcframework.zip",
            checksum: "18c43789af6a5afcce6d8c01a0e594ea7b3ea2040867bdd199a2dad8bb6ab414"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.248.1/device_info_plus.xcframework.zip",
            checksum: "326812d7b51567e5e6263bbeee955ae8bcc1a23a38c7993aee37109c71f6f1cf"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.248.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "c03e36a6c648957b4990aec09d9de4889417b57f80775eb00f42b8ab36598bf0"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.248.1/flutter_local_notifications.xcframework.zip",
            checksum: "b36da96c0a96eff5825e3864266a74c511b33e18d97f0aa309082c3ea8382c6f"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.248.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "9b161a9d071c9fa92ba20c648857604a9cb03b321351c331f2e7f70177a9bd58"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.248.1/flutter_secure_storage.xcframework.zip",
            checksum: "02b21903763a29aabc391b6e1e50f293052f0946f36a778ac44fb05d55c2fcf8"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.248.1/geolocator_apple.xcframework.zip",
            checksum: "3172934cfd87ef7ef7362e1be25c04239c3a7bc9e4b30d6aed2761bad44eb1df"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.248.1/health.xcframework.zip",
            checksum: "ed19819663b1076b7f7d62849614f31150a9e916faf3a5de5f55b2a5f3087845"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.248.1/image_cropper.xcframework.zip",
            checksum: "aab393d550fcf802a1fdf1c53a98acdcc5c2c5708407ef9fc5f8b58fd3774447"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.248.1/image_picker_ios.xcframework.zip",
            checksum: "192d05691208683c0e113ba209301f7bf03e3281e1387054f4ceb0f2b0d6f79d"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.248.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "63cc02fb8881dad3f526dd9457965abb7c429cb2e9c65c8915e3593cf5997936"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.248.1/MapboxCommon.xcframework.zip",
            checksum: "e4c7b66beda5df8f61576d813394e73ffb8c08333e0eb49424563f9b83bfc08a"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.248.1/MapboxCoreMaps.xcframework.zip",
            checksum: "95fb5aaebb540662429ed896eaba9833b1016da3c267ff07af6c3ce23292c875"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.248.1/MapboxMaps.xcframework.zip",
            checksum: "3a27ad71a65b2860eee4f18ba1f16384fac7712447a06179df123957d180bdf2"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.248.1/NordicDFU.xcframework.zip",
            checksum: "cc42f8e371b0012f0901a4f7034657930823632207d6382066eef3505487ac51"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.248.1/package_info_plus.xcframework.zip",
            checksum: "e7e74a965d0d65876791633937813462238ba0fa52aa0f59e76c299fd6f76876"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.248.1/path_provider_foundation.xcframework.zip",
            checksum: "3ae9fc1bf5b20f783abe1a3a431362633dc188e87de270304a593cfbd5e05d68"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.248.1/permission_handler_apple.xcframework.zip",
            checksum: "d42f1a96f1fbe9d6bc19dee23e2180f5d855f97236deae34bcf46862143daa33"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.248.1/share_plus.xcframework.zip",
            checksum: "641ad56b38ae0e10612f026d1ae244c18268b04315547dbccc88699bb225220d"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.248.1/shared_preferences_foundation.xcframework.zip",
            checksum: "342b4349ae6fa72d438d5e2ed5726a9d73e2a390895373e13936a917430d298f"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.248.1/sqflite_darwin.xcframework.zip",
            checksum: "498de67a28aab55555993879df19055911ba5089b6ba0aae8468330841a8af6a"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.248.1/TOCropViewController.xcframework.zip",
            checksum: "7c964fce88cd40b301c81d0b6242a687aeda8e298b906ee8762f5e0989a13643"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.248.1/Turf.xcframework.zip",
            checksum: "e57524c70e5a21d6a2a02b8f498fe6f3ee843032338d82e73cf2d4ba78b88df3"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.248.1/url_launcher_ios.xcframework.zip",
            checksum: "9167da217b437c4abef57d72393a950967058d110f847a4376aaf0f7ab124689"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.248.1/video_player_avfoundation.xcframework.zip",
            checksum: "839e9fcef31e5175fa3c1d409e318ff796ae46e38ff0fdfb5ee0328a8e15582d"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.248.1/wakelock_plus.xcframework.zip",
            checksum: "5dc959da62ebcd682fea7a0093617066423caf5be7a1f2a7c2561d020e5ed721"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test.248.1/ZIPFoundation.xcframework.zip",
            checksum: "0075d8dac169ccda13144aca3fa0f3edb6c1852338171c6dc2763ebf4631a14b"
        )
    ]
)
