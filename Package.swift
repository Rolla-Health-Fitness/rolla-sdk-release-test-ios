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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.239.1/App.xcframework.zip",
            checksum: "6b7a09118ba188394d86ade57793cde3f4e7fd7d3ab6041f25a343ea5945a856"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.239.1/Flutter.xcframework.zip",
            checksum: "c957d7e1681cfd241577976b4223a8712d6f3e18612aaf08d32fd0b7f849f0a7"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.239.1/apple_health.xcframework.zip",
            checksum: "b668e974b12b7ba61caac1135954f942ddcfb451723cca9050f202ee6724e7e6"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.239.1/connectivity_plus.xcframework.zip",
            checksum: "de9e803727a13473924c9a604ed817aa8d03b17ded846768665f28c1767aed05"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.239.1/device_info_plus.xcframework.zip",
            checksum: "1cf5e0ae718d486ac20946a540df4e1d5997dfe65d9ab71c747c7d9c935bea55"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.239.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "42c56aaffd97a2968ab46c5ba7984f7f9b3314087292f60a0e068605780c76b1"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.239.1/flutter_local_notifications.xcframework.zip",
            checksum: "e5bb239f61633c52b20a8176ce5b273401e8abcead161c3dad89d34c3f2f94a9"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.239.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "78d5b1b2e8f4e1a98e36a7f9d4d5ae58f4c63cedaff5761e8da6593e16b50b96"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.239.1/flutter_secure_storage.xcframework.zip",
            checksum: "0b737adc543e2fd890617048ca37808e5d0e844915024371fc3a3b93c79e5ba8"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.239.1/geolocator_apple.xcframework.zip",
            checksum: "a9ee7db399c110111dad0fae3fb63d278ab3a1695a8033589a666a3033536a81"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.239.1/health.xcframework.zip",
            checksum: "4f83f52ae76ddc3ddf357e8759fcd3fa2530190f0dab5d85faebb7169a447731"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.239.1/image_cropper.xcframework.zip",
            checksum: "1529cdf9f24ac32a95dc006e96332e2b5e798632af74c65b2558d3ba5b567f64"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.239.1/image_picker_ios.xcframework.zip",
            checksum: "1fedd629166ba933cbd9d644d0effdb5a6a89e89d3f5191eef44173531b3c1de"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.239.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "e9d841deb51acc99522af9309ec7288924dc0e73313da6823a8ed3d7b3b85acb"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.239.1/MapboxCommon.xcframework.zip",
            checksum: "d2a3fdbba1743cceab048075a646f6a05d9e040d3e459c91c5046357816cf0c3"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.239.1/MapboxCoreMaps.xcframework.zip",
            checksum: "319f7c491af882075a6d8c917b44f85672ab39df13ebc714bfa50546a25f90b5"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.239.1/MapboxMaps.xcframework.zip",
            checksum: "35c604281f66ed3876334a71bc4c365b9320c228ad0b5bce07eb2ae2a461d199"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.239.1/NordicDFU.xcframework.zip",
            checksum: "1848fa636fb6d7ce7fc9b86f915c090a7594c1c50867a3e1513e761aa6783fa8"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.239.1/package_info_plus.xcframework.zip",
            checksum: "cbc192bea9f58078fdc40a5762a9c49518db7c20261bb38016f280a19e77a710"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.239.1/path_provider_foundation.xcframework.zip",
            checksum: "5ac42fa3693b81f0cde3a83d5e9fee91777ddf6ed5c8dcf5adcfb9bce458665a"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.239.1/permission_handler_apple.xcframework.zip",
            checksum: "10699046627c868de8822fd81a00f174100ff9b381bd994201939c1059dde1b0"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.239.1/share_plus.xcframework.zip",
            checksum: "9fe21950b75e8b06242e0cbc32729ca3e43e9676cd9aa3a88b283534bb65959e"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.239.1/shared_preferences_foundation.xcframework.zip",
            checksum: "fe04918d9f30f6b24a1fdd6c69dfe2a525c38ab46cf6909e8a3efea9d3611145"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.239.1/sqflite_darwin.xcframework.zip",
            checksum: "2c15fa2fc53f165f07092d679aac63a15cefeecead1a2b9975b5bce1d64096d9"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.239.1/TOCropViewController.xcframework.zip",
            checksum: "97d15d1dacd6b715d54c4aaaf8ece1134aa90f3feb2d175078788e97a4a47180"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.239.1/Turf.xcframework.zip",
            checksum: "eca6c9d5f913f8c57cbff2f43c041ad3210001a71f2790fd3a9cc11fe8c62681"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.239.1/url_launcher_ios.xcframework.zip",
            checksum: "cf18e1b3b639cd5e1a65a8aa2351c71233bacc132bf1d96a289e5719593e0924"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.239.1/video_player_avfoundation.xcframework.zip",
            checksum: "ff570585a9cca8a02ef9b5bb3f627bf80d3e1fba55f6cd2b49196b6888830dd5"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.239.1/wakelock_plus.xcframework.zip",
            checksum: "a7e9f06bb2892611a1560d2e8c14be97ea77afbb96af7b0ff8c57f18619eb28e"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.239.1/ZIPFoundation.xcframework.zip",
            checksum: "2ca51c13946550cb88220432dca2cb797c76ee3db8fc9a730f2bd35690057cd2"
        )
    ]
)
