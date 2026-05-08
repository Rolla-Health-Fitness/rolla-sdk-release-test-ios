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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.231.1/App.xcframework.zip",
            checksum: "1f705c02c3a3dbf40aa47641ae3ada407c7e14ff7c755890608efb51f1dfaf8d"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.231.1/Flutter.xcframework.zip",
            checksum: "9653721733e3f64ad5ea5a85527c8e2cf4aa6e51e008710c80798e2ac39e195a"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.231.1/apple_health.xcframework.zip",
            checksum: "3df6c6b0a1b63e0456e4f2ff254eaa8be204b0645fb71dcd70ffbb76fb50cfaf"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.231.1/connectivity_plus.xcframework.zip",
            checksum: "4780a15e3d1882fc463291c2a98f2fbe5775a5b3709d53473b92300e748bae89"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.231.1/device_info_plus.xcframework.zip",
            checksum: "6fc0e94c73348065d6fd2975964b60831991876d1ac174dc9f121af55af9433d"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.231.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "5f617f01611d4c0bbdfad18c1fecb830d10674754c365ee62501d1cdd809df46"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.231.1/flutter_local_notifications.xcframework.zip",
            checksum: "7dc3e715b8eda63ecd5363c96c67b86b0d81cf205fddf7ab6d79b96af8c62fee"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.231.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "9e619aa1967e880b8aad36d449d31fd07642fc34964379fee668240b13a3a366"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.231.1/flutter_secure_storage.xcframework.zip",
            checksum: "b2b6eb7d8c18b226a63ac17bec16da2a3d6d10b4b63c57385ee4c21d5f111753"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.231.1/geolocator_apple.xcframework.zip",
            checksum: "e34af027cbbb455605c1589c8a805f48e66969794be720f8f005b2bf50155953"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.231.1/health.xcframework.zip",
            checksum: "afe5ef08031871498aec398f2542167f7689d7f549e506cc400b5c4b58e18e46"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.231.1/image_cropper.xcframework.zip",
            checksum: "d92df342df6f3aa9a9bc903b6f49d2d2feb776b5117609b9a32db3643114b896"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.231.1/image_picker_ios.xcframework.zip",
            checksum: "d88ea64b829bc4a4d5aa9cb34b07874d403c90841dc4640986f22a0c70c3d624"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.231.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "e0210202fc4bacf68fbdc55e68beef655ee89895ccb2c2dba92de7e329b032d9"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.231.1/MapboxCommon.xcframework.zip",
            checksum: "d1845d973f2abe7c3f695493a5ee68da3ccb8ed8df34e6fedc69a4dc07decfdf"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.231.1/MapboxCoreMaps.xcframework.zip",
            checksum: "39e1dbe7472c9c3bbc06218aaf1d632f8d3f1fb0efd777ebd9c49105d13c4be9"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.231.1/MapboxMaps.xcframework.zip",
            checksum: "6f57e45bee8479be062e2296c5d6597d6efb216a790c7fc20de68296187bd04f"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.231.1/NordicDFU.xcframework.zip",
            checksum: "b9cb4d8ed27893e91e9c825a6a787a27fe5ed51ccd57b28a9f02f5b831c90851"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.231.1/package_info_plus.xcframework.zip",
            checksum: "7847661b681a9abac5b82871a481a7f25b033fd09346997a3ce8d20abd6edbf0"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.231.1/path_provider_foundation.xcframework.zip",
            checksum: "f4dc4831ba726b284f376bd553417bda4b5a58c23002ebf5b40a30105ce2d949"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.231.1/permission_handler_apple.xcframework.zip",
            checksum: "111bb130e8e4e3e3b8aff66acf0c189204cfb6f90f5e0af29530a270809030a9"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.231.1/share_plus.xcframework.zip",
            checksum: "f9f2e0bb30d560fe1470b0b6d400d8544bb34ebfbc27d23cb01fca9594422c34"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.231.1/shared_preferences_foundation.xcframework.zip",
            checksum: "5b64a0211aed09e930525abbfcf5d56d05331a7a82c6ee26c0b299cf7ed60a66"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.231.1/sqflite_darwin.xcframework.zip",
            checksum: "8d117364a7a99d7f65b5e2604e14dbe2ca0e36d057f146706d64c8b37db1d698"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.231.1/TOCropViewController.xcframework.zip",
            checksum: "a826afe6eb4658bfa3b76d8bdda0838965ce765cc44bc8cffbab6542b2d90f75"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.231.1/Turf.xcframework.zip",
            checksum: "6b7ce52d5e6184cb27c20d662c294df199eb52b3844d550e6ad5ab641bf730b6"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.231.1/url_launcher_ios.xcframework.zip",
            checksum: "e0de26b0404b8df6a225b0a2b65878d052108af2cc4ee36c29f8808fb63d1c73"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.231.1/video_player_avfoundation.xcframework.zip",
            checksum: "3126b406a5c7247082b7d346ba0d24be99b9f42f4f10992e4e123a273a457d06"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.231.1/wakelock_plus.xcframework.zip",
            checksum: "b8a82070256b47204cb9ed1a50f62ff279b1d0cdeced8074b9c928dd3a7165cb"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test.231.1/ZIPFoundation.xcframework.zip",
            checksum: "fb30f90d6bfa511fa4f6e9a611719bf8f6c58eaab69c5de8335e4c6388fa1735"
        )
    ]
)
