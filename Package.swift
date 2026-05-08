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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test.234.1/App.xcframework.zip",
            checksum: "07c3e0cd54c5505856b7c38c8764b31c70f7d7b0bb8af742fc43b9f33bbc1aa8"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test.234.1/Flutter.xcframework.zip",
            checksum: "c69afb91007d7ed074d7deb0c2566d8a536584cbfc4f5b2175023e9cc6bfc871"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test.234.1/apple_health.xcframework.zip",
            checksum: "50d5b33874de8f0d40172acf86e354c24156cda37bfe8317e9b8114b22346c3b"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test.234.1/connectivity_plus.xcframework.zip",
            checksum: "ea867bb56b92f83087abea1cac269b760b68f0abfcd8ca81fec69782160de19c"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test.234.1/device_info_plus.xcframework.zip",
            checksum: "0787fede50e8375d5017fb261032285482603c15505f96f935b41ff56f686b1c"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test.234.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "ab96cd310ecffd031104fb8b292d0414aa3fe66751b2d04a1d775b529a2a8eb9"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test.234.1/flutter_local_notifications.xcframework.zip",
            checksum: "df1fbea0c38f613ef05e2eb56cdf7062e8aa37192982273b0b44c201ea4c90f1"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test.234.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "ca1d3c46697126475fd78c9eb11cf0999177ac6fe10f47fad5c790cd6e2bb864"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test.234.1/flutter_secure_storage.xcframework.zip",
            checksum: "27db8e96bd9dd1f0bee4ab32b2db408be1a829fa4cea3e4f869373bb91ee228d"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test.234.1/geolocator_apple.xcframework.zip",
            checksum: "979634498ac6b297eb28b100f5039a27490bff9cd28fb0a39afc33d3ce6c003c"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test.234.1/health.xcframework.zip",
            checksum: "93e5661d575e9009fa55c6f1fd4eff9f8866ad68299aaca4f2a7380976405f15"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test.234.1/image_cropper.xcframework.zip",
            checksum: "552445ad2638985d33543d1122c43ca41dfea3c5c2bdf1e619f273b60cc4bc55"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test.234.1/image_picker_ios.xcframework.zip",
            checksum: "19fb8ae896e7734a093f83b4a80d37284a22f1d37d86c449bfa5133614f3fea9"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test.234.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "3ed503c1fa11443a301a9b0c323a07737ce63e2d1d0a845f2abd99f86abe543e"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test.234.1/MapboxCommon.xcframework.zip",
            checksum: "cc3e8b764b4e6a5008e4b64fe6e4018c29597ea79435c77d6a5d3ef4f5618d20"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test.234.1/MapboxCoreMaps.xcframework.zip",
            checksum: "35734b75c409d42341d2ed4693db7952862fe8c499073d786ffc73f46ecb90d4"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test.234.1/MapboxMaps.xcframework.zip",
            checksum: "790b58b82958e22040ae7ab38a52b71632f36cf744bad7b311526346bd423b9f"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test.234.1/NordicDFU.xcframework.zip",
            checksum: "64e466d6222e562508c38fa48159178180b71e4df54e629b19f9c4b7cdf89853"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test.234.1/package_info_plus.xcframework.zip",
            checksum: "9836e97350e4f737db30be97a14937cf8ecc0c030a6ee0df4f77c6772c67ce4f"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test.234.1/path_provider_foundation.xcframework.zip",
            checksum: "a786e0a6b2efcb83d3f1c94f827d5fb369ad111b8626cda7abd2aef48baa18ab"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test.234.1/permission_handler_apple.xcframework.zip",
            checksum: "636f7e53363ae026c1b57120dbd9b6656d528e25e65fe4fcbc3ad63b4bebf6a9"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test.234.1/share_plus.xcframework.zip",
            checksum: "ed0c58629d6057bc342f13bf3b112140b6b551427a778618dcf571506ff444fb"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test.234.1/shared_preferences_foundation.xcframework.zip",
            checksum: "dd561a3454b80ecfb6d85794f7b9f01b6219abffbc3b515f88082955df2a42ce"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test.234.1/sqflite_darwin.xcframework.zip",
            checksum: "32f152fb4141073074543ce39ea2807c72a3c84b0927be689a9a23e9e5b06bf8"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test.234.1/TOCropViewController.xcframework.zip",
            checksum: "32e3faaa4217c9e6c1028fbcf00b9c9bdd8257a7788d657c1b8654bcc32171e7"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test.234.1/Turf.xcframework.zip",
            checksum: "e63b236cfc47cd0c92ef9cc5c50ea34f87a7b8001d4454ae10917b4ed6c385b0"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test.234.1/url_launcher_ios.xcframework.zip",
            checksum: "77c303609b7765314da903e67b3dd3a8f14b81ea402baf58f3fa301144fdc49b"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test.234.1/video_player_avfoundation.xcframework.zip",
            checksum: "d764bb075c0971ba03cbde3a190cbefe2bcc75ec17c253bddd9d9945b40d636c"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test.234.1/wakelock_plus.xcframework.zip",
            checksum: "d92818a51f1cd3a7f8893fa5ce37e115c904bbd87ba5ed245055b539b3b2e57b"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.9-test.234.1/ZIPFoundation.xcframework.zip",
            checksum: "62bd3839f9b6444463e5454ab64ff3052c85bbc6c610f417f520a812242d5f31"
        )
    ]
)
