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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.38-test.347/App.xcframework.zip",
            checksum: "3f710689e2287512331537f5e3de2f4accb42f413fd783c5fb5d15d525283f79"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.38-test.347/Flutter.xcframework.zip",
            checksum: "e4d740572678c5d8bebac352453965624877e2edcd7f8a1677f893f694f4f3cc"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.38-test.347/connectivity_plus.xcframework.zip",
            checksum: "db2690f1f1035f7a7cfe1ff85f981809a966da13ab498e6ef1327d626199337a"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.38-test.347/device_info_plus.xcframework.zip",
            checksum: "419b31ad9ab077cb530248af42b665e2619569b793abf346ebc6aa8568b87a37"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.38-test.347/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "39eb1b8fb381729d16f9e8338b5ba5ff1fb86f90fc6eaa36e4b8c40c0c5eee88"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.38-test.347/flutter_local_notifications.xcframework.zip",
            checksum: "bcbc3107224a656f1064477df109b22f0b69b75ea4e2a1df1a51a104cee498e5"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.38-test.347/flutter_native_timezone_latest.xcframework.zip",
            checksum: "bc37ca4d20a4d5f77e490b30215bcd977bf86697c531f5ad6958ccc26e2482f0"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.38-test.347/flutter_secure_storage.xcframework.zip",
            checksum: "05793ecb853f0d12289a11d6cfd8e92177ace5cb15cedcbd3bf7fd260e36dbc9"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.38-test.347/geolocator_apple.xcframework.zip",
            checksum: "693968132e62faee1f1ea69f75e4c45d398cea66b7407a8640f690ef6061ccd9"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.38-test.347/health.xcframework.zip",
            checksum: "56d0227dbea8d0bebc81d7bb13ff11350375ce47074f00df01db1b8f43bdfc2b"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.38-test.347/image_cropper.xcframework.zip",
            checksum: "40f507c5bc4ce17434300e19a139bf78bd33e32f7e4e6108ebb07ac63f6f297d"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.38-test.347/image_picker_ios.xcframework.zip",
            checksum: "170da32134170044cd8178693f4b27481441ae6e36718a4b85defa9a28a725a9"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.38-test.347/mapbox_maps_flutter.xcframework.zip",
            checksum: "534bed95df790df0dcbffb8deda848d549da74e273088bbf808ea75232218807"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.38-test.347/MapboxCommon.xcframework.zip",
            checksum: "f8bf28f1269c9845c0d376820ddb0e59ca09f8852ab13ef9b904264129674371"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.38-test.347/MapboxCoreMaps.xcframework.zip",
            checksum: "dff92e92f97de00341027167add30c8207b1ae83984d6c27b6cf74d7d1a1c3da"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.38-test.347/MapboxMaps.xcframework.zip",
            checksum: "c4fa08118b08b6061eb05a6861528cdbb8cbb6c370de9ed71a4bb2741818079b"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.38-test.347/NordicDFU.xcframework.zip",
            checksum: "9df607b0fbd7a28eab25753cf5ebcb8f2abb468fa85634ec405ebd76166ae3ed"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.38-test.347/package_info_plus.xcframework.zip",
            checksum: "1e275684c40fb38464ce4bdf125dbebabe15a7d375a2e2b538a8fcb6e6fa4b5e"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.38-test.347/path_provider_foundation.xcframework.zip",
            checksum: "57ec706d54dab1c210d49614a72392a8558c6cddb03d1f586a92a9d6add431b4"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.38-test.347/permission_handler_apple.xcframework.zip",
            checksum: "be80212ddeadb32c9f229bbdcc0c2449c1c1ced481ec3641e92052eb6ca058b2"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.38-test.347/share_plus.xcframework.zip",
            checksum: "a73a766fd7984412def1236c107a1ae6caa5123e78c56307e75eeb0c172ea528"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.38-test.347/shared_preferences_foundation.xcframework.zip",
            checksum: "7bb46995b05f423c6bcda15077fa2294da1c25d8d5c470cf3866cf4ee4f875ff"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.38-test.347/sqflite_darwin.xcframework.zip",
            checksum: "10796e857a75e4912bbb50df4c1ceb82d5b28f4fdfa9f40bcc3edb64e9197ece"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.38-test.347/TOCropViewController.xcframework.zip",
            checksum: "a48ce37af6f73459d7116ba1500b10d9b19714c4c9e6c94aaebd3dedfb9be4f0"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.38-test.347/Turf.xcframework.zip",
            checksum: "843119c81faa2572cababa520cdfc4d649398578ba133eaff1f09c2cc18e6f7b"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.38-test.347/url_launcher_ios.xcframework.zip",
            checksum: "af1e8bca39dc1d63d8c9106711f6a08b415cb058028654ff08642f46305ed6c8"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.38-test.347/video_player_avfoundation.xcframework.zip",
            checksum: "8e58fc3871d929a9977a3e5bfc4d53ac5d37bb7e245bb69a1ed2ebe0f5bf7fe6"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.38-test.347/wakelock_plus.xcframework.zip",
            checksum: "a1aef104e1ab1928a8b9a9d8c71be40c851bcfcc3afffe3c716391f2c9c99ef5"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.38-test.347/ZIPFoundation.xcframework.zip",
            checksum: "cb768d097e058e16b4cef02d5e0527a5874c41628e28dff041774334585c02a4"
        )
    ]
)
