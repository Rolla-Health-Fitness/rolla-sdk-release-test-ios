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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.270.1/App.xcframework.zip",
            checksum: "08218b0f887e57ca62dbf84209bafe7e64e06424b3123a603f2d2c01416929e2"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.270.1/Flutter.xcframework.zip",
            checksum: "0921f3bb281bc39398d01c60125d3a26c2733c52b7196d57a3d2ebdd184867ae"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.270.1/connectivity_plus.xcframework.zip",
            checksum: "f5b1dc55cdf8935eea0e0505779ce5da2a2368d2293170dda9ad17a8eab59659"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.270.1/device_info_plus.xcframework.zip",
            checksum: "fb26d5d27602d915cf1fd37a397ecf472a99ee21e407834cc6a12702644ddab9"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.270.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "0d74ac7c171ee65fa1e72b11f5cf6169ec476bf2c2be23ff3a4847e33a564b93"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.270.1/flutter_local_notifications.xcframework.zip",
            checksum: "eaf2fcfc638394dad9ebf874c70ce99cf848107c2cd926ff489034a8bfa52b06"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.270.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "ae04152c13aabc31fdf1efb2b2984bca75e485f75181cfe211b5646b4b522d6b"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.270.1/flutter_secure_storage.xcframework.zip",
            checksum: "31011dfbe11e7771d101cba8efb3ae7834b0c9cd30b666481ff4f4a2f96be79f"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.270.1/geolocator_apple.xcframework.zip",
            checksum: "70d7cab2676718e55201d32415da1a02db02b5e644cc3aa07a81350977021ac8"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.270.1/health.xcframework.zip",
            checksum: "945badf7292f6173a48ef375cfbca95d5bd3bf681abf7145fbb01e4b9e17195f"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.270.1/image_cropper.xcframework.zip",
            checksum: "c271244c1c995229c0dcce3d879559a1ec6519b5a86033afb52052a346e2a304"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.270.1/image_picker_ios.xcframework.zip",
            checksum: "ed15f911affa22ff481a2f09cd80d6b8674ea99e1253331011640735cbaaadb7"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.270.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "6032c7a80cd5496321f9278d60137bac19110c4de1ba38ef6cc862115ea00225"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.270.1/MapboxCommon.xcframework.zip",
            checksum: "6a223624a53490c2e23873ab6005c32fc281eac1618244aee894eaffbbfca803"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.270.1/MapboxCoreMaps.xcframework.zip",
            checksum: "eb1cc2088a8690dfd7dacb5a161fddb227a6bc5e3396ee30eb9acf1c8585e100"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.270.1/MapboxMaps.xcframework.zip",
            checksum: "72c660b58aaef3a1bc4159e0a1a6bcc3145a7f1bff0bdd242bb7956436f0a1de"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.270.1/NordicDFU.xcframework.zip",
            checksum: "a09b0a70ac250ca220e3e1b2f236740f6e1d0103c88988761746e4a8fcbde287"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.270.1/package_info_plus.xcframework.zip",
            checksum: "4a1045e0ef00189e6ad6bd22e835ce404b322768d9439d7ac03ee390c2011485"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.270.1/path_provider_foundation.xcframework.zip",
            checksum: "629ded5333547b5de45001563b64e67100728e601e3a83e94f43fcb2c1dad9f0"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.270.1/permission_handler_apple.xcframework.zip",
            checksum: "f69b14ae9019a312a2eb7ea310e83ca30f298ce455b864ada4a7c0e9bd318ddb"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.270.1/share_plus.xcframework.zip",
            checksum: "3e3b01299634f6011d2448be9869789f7d379b52e85a623d3c51429b2210498f"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.270.1/shared_preferences_foundation.xcframework.zip",
            checksum: "fa386910acec12dee036f12ab92c04e0e96f4ed01f9531fd73268609a2e5e20e"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.270.1/sqflite_darwin.xcframework.zip",
            checksum: "8ac2bbd4a121a938b7f08b9613db5ee47ac243d825f2f77f1be6346c4a906291"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.270.1/TOCropViewController.xcframework.zip",
            checksum: "70e1280382c3e27e5eff5a1cad410f19fb2e235ef41b0a14a4f4b6685d5bd795"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.270.1/Turf.xcframework.zip",
            checksum: "fc5bd22ae66effd1a2df70b610caf68d70e68b6e5f93ed7ad041af9de757012b"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.270.1/url_launcher_ios.xcframework.zip",
            checksum: "e18a8b789b3f22426f4ee5919cf5047d69249675fbb8a86d853a6a0fa62df09a"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.270.1/video_player_avfoundation.xcframework.zip",
            checksum: "799a4a49e3c31a212713afb7b317521634540b1ede25a4a11eceecadb50fc112"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.270.1/wakelock_plus.xcframework.zip",
            checksum: "1a701847447f09a432ba714efdb3b736b54ce0ff6859f929ca8194f8a1a7049a"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.270.1/ZIPFoundation.xcframework.zip",
            checksum: "3c92e952195b3cf06523b3a617ecd60e6bc186b1414b51e4a770ae56fa451a04"
        )
    ]
)
