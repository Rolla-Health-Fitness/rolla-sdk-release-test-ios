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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.338/App.xcframework.zip",
            checksum: "dcc54b28f399a3df7d4a2a8e53a08a8e6aa0c106b614ea93df1777730ee9646c"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.338/Flutter.xcframework.zip",
            checksum: "6ff558f0d98261983bdbd384feda711a508ebc119c7051b14bf8bff69497832d"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.338/connectivity_plus.xcframework.zip",
            checksum: "19e69026678c4a8387835d98e6ba1ba8c78b75038b5cb1207e8fc0838b440d35"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.338/device_info_plus.xcframework.zip",
            checksum: "68848e1eee25e4e927dcde5ed6cde1b9372ecafd135f7ad388dae60e58211392"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.338/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "55d16e3d23e2fad4603009000f80202ce4cf0ac0695d3f26489740d21ad2c89a"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.338/flutter_local_notifications.xcframework.zip",
            checksum: "e69dbb3462b85e0bbf30560654b3d0f8fb97d3f0c520aaf1374bdc4cb1fe4e20"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.338/flutter_native_timezone_latest.xcframework.zip",
            checksum: "6e8869cabcd794818fbd370a86a142c04971d8ef04fa11439928197bb9e5b8c1"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.338/flutter_secure_storage.xcframework.zip",
            checksum: "287bc8d4e31601a11b00701f197595524ff8b26528e0ae98dfbe8d6dbe6dbbda"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.338/geolocator_apple.xcframework.zip",
            checksum: "6907d2eaf244ec252fb5bf88ea87f64b2b99accfe09946ad4dfbc10e6c63103b"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.338/health.xcframework.zip",
            checksum: "88712a7e7512ad0e023b7327d0d307024028d99e3e1f2a526dc3ee47775e5d3c"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.338/image_cropper.xcframework.zip",
            checksum: "ce8162e6b340a8617a4188d33994aa2f39a9da1509dd92a5a2c7deacb6dd7db8"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.338/image_picker_ios.xcframework.zip",
            checksum: "b82e5b204d2a6de97e52f88e16009725f4fba4cefa2d887a812c430189e57e3f"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.338/mapbox_maps_flutter.xcframework.zip",
            checksum: "1773cf103801052101c9ff3f78f286939b7961bb2ab2f2fd92ea04d8125652b4"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.338/MapboxCommon.xcframework.zip",
            checksum: "63c7407019783575e5f162eeb49a17a5fce46021daeab96fa0a29fc1a5ed6c97"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.338/MapboxCoreMaps.xcframework.zip",
            checksum: "002b0cf5eadbe0093633437222e6a4c7f59f68adaa679b345a8f4839c784b7ab"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.338/MapboxMaps.xcframework.zip",
            checksum: "a752d80869ef6cef69503b7a6b43632bda2805cfca6350e05e341cdcc652d4ea"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.338/NordicDFU.xcframework.zip",
            checksum: "5252e40c35dc26b5a4fe26f6ec13d444b6f45cfdeaaf1e18ac53c9630929be0c"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.338/package_info_plus.xcframework.zip",
            checksum: "9df4de0f1f6e2dad3d0f36f136c811e755b1354835b69a3f2898e5f06f6b7077"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.338/path_provider_foundation.xcframework.zip",
            checksum: "a45c9f037e447f0632e3a20c401cadeea46fe28fbaeef80b594a335c20e4dca0"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.338/permission_handler_apple.xcframework.zip",
            checksum: "b294235dfb0d377f32483f97f35f37b34088510f84356cbf079bbd4dada3e816"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.338/share_plus.xcframework.zip",
            checksum: "bca1fe6e6264650bc6a041aaaa310f33c0f60008af56bf0c79fc6f252d068b82"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.338/shared_preferences_foundation.xcframework.zip",
            checksum: "2c1ad2821e5f68212853519274136fa8db31dfcaa316cad24d5c64f7b3d144a2"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.338/sqflite_darwin.xcframework.zip",
            checksum: "7048ae48bd9ecf0f57d4c8d178ab969f5e66cc5a6f0b08918d1774a3ffd8602a"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.338/TOCropViewController.xcframework.zip",
            checksum: "0395405964586105d92d73e628a695c7a9544eb7ee87675195d76f70865eb875"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.338/Turf.xcframework.zip",
            checksum: "90ba0926122b49e7f4c9ff513ddab31cc18249bba0ed38127c65bc65693f9489"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.338/url_launcher_ios.xcframework.zip",
            checksum: "ad724c930450681b24734e90779a21141d278ddf9d864ed50f8df158aff7ea4e"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.338/video_player_avfoundation.xcframework.zip",
            checksum: "bee3b406cbf9a2798ed954caa17e6a9837cae2cda6c4b86fe60287d9bec1ae74"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.338/wakelock_plus.xcframework.zip",
            checksum: "c7848cf8af4c79e701306b8dbd9e6ded781589d84fac67041c747ebc0f4f99dd"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.27-test.338/ZIPFoundation.xcframework.zip",
            checksum: "29174815d2d3a4d452765a9977dbd8619c3aa1cb0e5177b3cf29c302e8b19284"
        )
    ]
)
