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
            dependencies: ["Flutter", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "health", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "FlutterPluginRegistrant",
            publicHeadersPath: "."
        ),

        // Swift wrapper API
        .target(
            name: "RollaSDK",
            dependencies: ["FlutterPluginRegistrant", "App", "Flutter", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "health", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "Sources"
        ),

        // Flutter module (Dart code compiled to native)
        .binaryTarget(
            name: "App",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.330/App.xcframework.zip",
            checksum: "5897aa44c2c9ed2d32103a11c4a098a1bf4906146a72526dba525ee502c62187"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.330/Flutter.xcframework.zip",
            checksum: "eda39ae1a3170c7cdcec9e85c7b070ccfe47d01341d001a9b8b40307ff3a1f7b"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.330/connectivity_plus.xcframework.zip",
            checksum: "3ec23908a636fb673c6206e161bbbc963f4db8a9209bbc7d86e8ff442b254d89"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.330/device_info_plus.xcframework.zip",
            checksum: "ef6657a2a76bd37e8181236ee17f5ac250050762548062cf2e9f11b4d9515235"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.330/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "16a6fa3f4eec9e180a57738dcbc10c830433ae7c895a213ed298e9fba91ff960"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.330/flutter_local_notifications.xcframework.zip",
            checksum: "f1a9e4b6cd1929a1f304c7cca33032b745a7c3cfb2f1b251c20272d6360d59f8"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.330/flutter_native_timezone_latest.xcframework.zip",
            checksum: "750f7908ebaff3cb2309aea9290ac5285ce6c95164dcf556b38cd23d093fc8d2"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.330/flutter_secure_storage.xcframework.zip",
            checksum: "8df6f811e8db6b44cd1c07e07b71646ec9c61fbf5fe2e6e0097cab2fac8448f0"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.330/geolocator_apple.xcframework.zip",
            checksum: "387ebad8c7105068ab2cb611bf0d069b662ef0ca27b2bc3d53c93070de123977"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.330/health.xcframework.zip",
            checksum: "c866a7584d95051548480481db20190384a8fcb392f66ab403da34e349de34af"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.330/image_cropper.xcframework.zip",
            checksum: "8916ba92f89c2582e529dbf6afb1d70a49e9477daafd3053c645974169674c6c"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.330/image_picker_ios.xcframework.zip",
            checksum: "63e1593b65f5269907af7468749f784d7ece11cc8870477989a7b4b87c9617bf"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.330/mapbox_maps_flutter.xcframework.zip",
            checksum: "e006d880f28c4c4790ad95b894a12bdcdefd1a4a133fc852a8a8549318fd2592"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.330/MapboxCommon.xcframework.zip",
            checksum: "b3b105c36608ef2b30138812bf1f7f9a484582a6ec30b16ee6b427deb1b94ef3"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.330/MapboxCoreMaps.xcframework.zip",
            checksum: "8c6aba73ef9b9f9927a6b22a422d28103c284c40149b15df4b8660d6f255c0d4"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.330/MapboxMaps.xcframework.zip",
            checksum: "ae90912290799abf1f69fa12bc58de282162a6fc209adc55ab4b6f254346274d"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.330/NordicDFU.xcframework.zip",
            checksum: "119e46df38d9852fe395d6b6c58e6def5111bf792cb1aa0cfba6578d74931037"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.330/package_info_plus.xcframework.zip",
            checksum: "b8672951d110cfc1742a3323acb8f8728c3672ec90fce5898033e36f1fc03482"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.330/path_provider_foundation.xcframework.zip",
            checksum: "e87a5e2499771af97cbd7be6779fd7de8ece8e155e8a88dbfa0d0a500ef7f39d"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.330/permission_handler_apple.xcframework.zip",
            checksum: "f8b6f721b3d236584f164538653136758479b093b5529b4b6dff5381b1bac55e"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.330/share_plus.xcframework.zip",
            checksum: "2e6922548459378c3619ea5798d24c2babe95df3460c7befa98092fec36743a0"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.330/shared_preferences_foundation.xcframework.zip",
            checksum: "ba88ebdbd635203104345131b06a4aa42866037dbcfa4a80e1b8b54c335157bc"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.330/sqflite_darwin.xcframework.zip",
            checksum: "cb2bdee4fef04a65d4da90bbe4d696dc447dfa8bbfc31de67d6060a1f8c944a9"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.330/TOCropViewController.xcframework.zip",
            checksum: "52cc84927c503019178e79e5416346926db28f2f9cd4d696642bf9543ad6567d"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.330/Turf.xcframework.zip",
            checksum: "7af2a86deb88b92a6284fea6ae3a6340fb0174092793fdffd5c23c5839b68538"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.330/url_launcher_ios.xcframework.zip",
            checksum: "71c914a5d738e5c10ae4c63b78f123437c0e8a041b84119ac9740b49372cce4d"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.330/video_player_avfoundation.xcframework.zip",
            checksum: "df551465d08659303472587f429a155bc58ec26f3e91fd1a1cd95fc632b9b770"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.330/wakelock_plus.xcframework.zip",
            checksum: "b92db71e963b40352b9a307e12dfd8df8d16f15671de6452574816dd5708cfe7"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.330/ZIPFoundation.xcframework.zip",
            checksum: "3c4abd4c366e1616a628cf49d428268e787c9061868a7c8bd751abedc5f90d63"
        )
    ]
)
