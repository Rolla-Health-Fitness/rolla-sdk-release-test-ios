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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.336/App.xcframework.zip",
            checksum: "399b5fa8aa404e9dd786963dfe4c8eaf6eda4511c84b51f2d2ba3143a457c3a0"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.336/Flutter.xcframework.zip",
            checksum: "89b3cc061add3a3eba3e9d7fa44a8a341a3f7c395ecb17b4b457cf04010bb594"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.336/connectivity_plus.xcframework.zip",
            checksum: "6274aec566bcbf6723a7755e5f59390c63c3e293787db4fb8c5d8fdf5d0be6fa"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.336/device_info_plus.xcframework.zip",
            checksum: "f1444a6475066a8a5701f36cc57afaedf1da82d9ab09e2ea4a482e64ea5cf4a1"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.336/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "b04897e7d06d2f59b30e33fe31df560782c2c9b936f995db064b6f59db87e7a7"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.336/flutter_local_notifications.xcframework.zip",
            checksum: "df4328e080fc80911b38fe38045a9138dc9c0ba1337be6e26ce3c0748e3a10be"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.336/flutter_native_timezone_latest.xcframework.zip",
            checksum: "26ebc1a48743f38340d744c6c7f8ef64a950fd02c55d0f53c4dedd52a39644e2"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.336/flutter_secure_storage.xcframework.zip",
            checksum: "e64ded6f52619485cdd30d14ecc2a5b92ba944f591615ecc58d4bfad57824973"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.336/geolocator_apple.xcframework.zip",
            checksum: "925b207e1a5483db6f04cc0bd0c970034cca9b8ea93b8d4ec8ad724cc04e6e96"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.336/health.xcframework.zip",
            checksum: "ef69b197975fea15ee62d618b98850d555f9e8258122335089d1c5e90851e5a1"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.336/image_cropper.xcframework.zip",
            checksum: "90aee4b85876967af9d15498ccafe1911b1d3f0287dbd13f2eea574b85757fc0"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.336/image_picker_ios.xcframework.zip",
            checksum: "404e077c256cc756b09ffa7d4fb41523ce4e9b91dd6077160ae7d262ca50f0c2"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.336/mapbox_maps_flutter.xcframework.zip",
            checksum: "5ed1d75636f9cd40d3028e73d6bc705d8223883ee68d483dc18a05e766632ba0"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.336/MapboxCommon.xcframework.zip",
            checksum: "dd492c37342ee39f5ecb1ddc5af0389ae262ff16b2ce8dca206c9998209f4f53"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.336/MapboxCoreMaps.xcframework.zip",
            checksum: "434829255302a2d2210648823780b3421f829da06b1faa1795c59d4c17b61a87"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.336/MapboxMaps.xcframework.zip",
            checksum: "11dd42f809a6f34639aa0ca4d7cdd0ee6f3bd6c3cf24b429d46310a111a36ff9"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.336/NordicDFU.xcframework.zip",
            checksum: "72687bbe02895ec8906e141e2ae4103c28b2db293e5704142c9b0485753c07ca"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.336/package_info_plus.xcframework.zip",
            checksum: "309f057262c86dfa02a4c1e1c65e443c9031350a6c6ab993156c5076537f036b"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.336/path_provider_foundation.xcframework.zip",
            checksum: "b64ef30fd6046b27707500302588c4501785ce34913075c8d89d4ce22b16ca8b"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.336/permission_handler_apple.xcframework.zip",
            checksum: "40842acb6c2d769f1d9cfae9ff9c2f76ec3808eb21280adab84464ce27d3305b"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.336/share_plus.xcframework.zip",
            checksum: "f88d1a48b3e64314592dec4d8e257cb5f6bdc22b499c32e1116d3e78a35a3c15"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.336/shared_preferences_foundation.xcframework.zip",
            checksum: "6f016df772f35bfe16f5138a0f21ddcdc141ab5e60bad0d42d6792ae6cf1481a"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.336/sqflite_darwin.xcframework.zip",
            checksum: "af79702e6df971703f6637f3c339de7d2f9679c4afc51a6403d13c19e8eb5303"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.336/TOCropViewController.xcframework.zip",
            checksum: "efd8a35e78f916a1730d6e24f6e7f9b4ec65920e4ecf7ddca266e2b484a07d21"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.336/Turf.xcframework.zip",
            checksum: "e4a738d480d19f4cb41dfc1e609700c947d907f4d706c14980a889ef6f110935"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.336/url_launcher_ios.xcframework.zip",
            checksum: "10904c284cf46e9026e5fae870d0ec2fbd23d2a5f423d8a9d0ff04e52010a644"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.336/video_player_avfoundation.xcframework.zip",
            checksum: "947c100ced9919df8e0ecd0d0ffb96acf27308ca81ac7c4aa31674b2ef945188"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.336/wakelock_plus.xcframework.zip",
            checksum: "676ff6f1f4c59354c53f7878f7a3ab616036b8be31b4887039ec1923ce803db8"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.336/ZIPFoundation.xcframework.zip",
            checksum: "22b1f5dcbf1d43a7fb1b8ecb552796fbfc36d58c1aa6c1509538a1e9eaa1f1ad"
        )
    ]
)
