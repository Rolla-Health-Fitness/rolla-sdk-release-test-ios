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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test.233.1/App.xcframework.zip",
            checksum: "bc0c6a59887657bbec41840870c397f9b0bd7e338c4de7d2c838fae2d2b59063"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test.233.1/Flutter.xcframework.zip",
            checksum: "e016fe9f19404154e50240606aead90bd5bbc5170791bbf0b7ce572e63613821"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test.233.1/apple_health.xcframework.zip",
            checksum: "40d62ad9885f92751a0dd192e9ec1b07247ce8c95961c8e863267136b03eae1b"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test.233.1/connectivity_plus.xcframework.zip",
            checksum: "634dcca3c79a7057ff45e97a2ef342f10c6447e580b6f6e4e7b3f6f483f936f4"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test.233.1/device_info_plus.xcframework.zip",
            checksum: "9785c59ebf63de580263059f45a3dabf58314f2d4a321fe46b287d5f13519531"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test.233.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "4d0a34c9705bc944c043dceb00b6ca0eb19904ba183e4fa35b26c023d8bd68c4"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test.233.1/flutter_local_notifications.xcframework.zip",
            checksum: "299f686a3328e70f79cca8e8f4dcb32d027acb02339fe6a3ce054820b38b6fd6"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test.233.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "4d9e880e5f48a19dace4063fb3a64d65cf925e6aec7610fa90c9ae2cd13a4ffd"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test.233.1/flutter_secure_storage.xcframework.zip",
            checksum: "f75618b14d4ac8e45c2eab3581ee7317a8a9b42c9ff562e30df47024f845e3e8"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test.233.1/geolocator_apple.xcframework.zip",
            checksum: "887181a054d875b40ab2419beaf85c019864fb168ef98ab596ad6cae94bc87ea"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test.233.1/health.xcframework.zip",
            checksum: "86b829ce84f32676167a2a606152252feb5eee867b75361309e3f9010d399171"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test.233.1/image_cropper.xcframework.zip",
            checksum: "97e47d13aeb77eec6eaa626c3d171051ad2ed52bdb16160dc06c119951bf3ae8"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test.233.1/image_picker_ios.xcframework.zip",
            checksum: "7dd120bdee329102207b723bab5c9c3ba690dde7b1ddebb9c097871264fa2829"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test.233.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "082297ce561d30f4b85ca7f0bb2a68c630fc80ceffc89479f1c7c72b783f479b"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test.233.1/MapboxCommon.xcframework.zip",
            checksum: "dd52062fbc605468a7a83ff248e9751c5749b0c2df24f18abfd0c05f1ae47709"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test.233.1/MapboxCoreMaps.xcframework.zip",
            checksum: "ec80ba0565ff028b0592609bc7030e756c75e05d247056f40181810f2cfbebd0"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test.233.1/MapboxMaps.xcframework.zip",
            checksum: "917b8efc872d71e5379fc30f32d1a736680a1d636e6f4f39581298c93e5298a6"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test.233.1/NordicDFU.xcframework.zip",
            checksum: "92854b9d6adca606672123705ea231c176e33df8944aa9e1391a4b8fc278f06f"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test.233.1/package_info_plus.xcframework.zip",
            checksum: "b1cc89e5863911f629674cd4c4278006c024ff9c770e8d9fdabeacff4e7102dc"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test.233.1/path_provider_foundation.xcframework.zip",
            checksum: "5f0f6d704dc34630bceec16696f8b4e96dc7b31ab66a33e88d6361ebb12c9280"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test.233.1/permission_handler_apple.xcframework.zip",
            checksum: "3018ba2875c4f510ba015931a2837c4cd376477ff6753e746e77c73707b4dc1e"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test.233.1/share_plus.xcframework.zip",
            checksum: "019f985d498303e9b3e97d1ce60cc1e79ef2d000c1e706a7736a4772a11c0acd"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test.233.1/shared_preferences_foundation.xcframework.zip",
            checksum: "fd9b3d6b76baa9c0806168113dae0dd692e0c674a56aa7ca08357c8e59a723e9"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test.233.1/sqflite_darwin.xcframework.zip",
            checksum: "128394674974577b598ce687ec36a3734c09d089941f1c9b5a14394014539b3a"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test.233.1/TOCropViewController.xcframework.zip",
            checksum: "e2b1a4d38132fb2f01a8696bdd03112d9b68135ef0412d4522c2fc6e3a092dca"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test.233.1/Turf.xcframework.zip",
            checksum: "129efc84e37724476ce9f927c6079add406c2c70d720246c3f471953e7976d90"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test.233.1/url_launcher_ios.xcframework.zip",
            checksum: "e18871d180072ca6d18836de534090525e6fac75e6708929cb1497eb37179eff"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test.233.1/video_player_avfoundation.xcframework.zip",
            checksum: "b0fe5ffd0848af97048493d2224d6c1553e7c91ec9bfc729ba5e024cc13d7584"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test.233.1/wakelock_plus.xcframework.zip",
            checksum: "6ca52f34c2228dd327c1fba49790769f2f128954f0459bb7f0ce44d15007ae50"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.8-test.233.1/ZIPFoundation.xcframework.zip",
            checksum: "ec01151dd8028027f3d9632a4e8010cb04abd1a9869a12ae48b87543f3ea3f78"
        )
    ]
)
