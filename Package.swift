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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.263.1/App.xcframework.zip",
            checksum: "89d0c7b2ce3e31da35f320f31886cee163d9a432f8ff3553dd6179ef6ee7c228"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.263.1/Flutter.xcframework.zip",
            checksum: "dcc6d6ecf9a690c21957f913d350e5ca43afc2cca6727447142d627835c2879e"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.263.1/connectivity_plus.xcframework.zip",
            checksum: "ae9183a3e03920ff2abe7672f77da55348eff59ad77ad8ea4a71c0491dc1e490"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.263.1/device_info_plus.xcframework.zip",
            checksum: "35d62bba5b9ac792d3c6566658389292169a52c28654af426b4d70e5f71027e6"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.263.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "167a0933cdf7a67df188491028c969f77ae1c4e349d01565c98e890d4a483cf6"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.263.1/flutter_local_notifications.xcframework.zip",
            checksum: "415fe0997662520f31cff97fca4f0111b5aea6c724e0a58f560c325714914817"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.263.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "9ebaa62563186810b034bcebdbdc44b47a171d153f0e3b0e27e528141829fde5"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.263.1/flutter_secure_storage.xcframework.zip",
            checksum: "16e4fc1584c24a0317878607344c4c1583722ce0b8fa64396f39cfe7edf16b4c"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.263.1/geolocator_apple.xcframework.zip",
            checksum: "5a62fc199ce0bf44f037a06117388c18aeabb23b8cf8de2ab324f4cb0dce348c"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.263.1/health.xcframework.zip",
            checksum: "0851fb5a2f5a0e6e67dd3e8b9215d69b96d7198e9f01639c1d3a4a10990d256c"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.263.1/image_cropper.xcframework.zip",
            checksum: "275ea948ebe2a20d0bb34cd6eb180f6e124c05045bfa0b521ecba7d7479dc73a"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.263.1/image_picker_ios.xcframework.zip",
            checksum: "e358ec426c472ccfeeeaebe3a8bd95bd2b94214fa1032a05ae2cd369618f783d"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.263.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "4f3bec139f5f06a795ec16f5a79ecd1d5a1fa74f4180e72218dc553e4a3848d0"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.263.1/MapboxCommon.xcframework.zip",
            checksum: "33f774ecd682ab5b831162757cadd5419910975df7c23a9bdff7c687f62cebe7"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.263.1/MapboxCoreMaps.xcframework.zip",
            checksum: "a0dc44ea73fbc8b2baae6046c668491497659adf86cc029e9dbffa8c5948a657"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.263.1/MapboxMaps.xcframework.zip",
            checksum: "36343bbba90d796627ed447285724dea58ba867bd7f9a99011c68f223fafb083"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.263.1/NordicDFU.xcframework.zip",
            checksum: "c1223d98758dd2f3896921b88f8d0728d1f76361227d588feb77703e649eb9f3"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.263.1/package_info_plus.xcframework.zip",
            checksum: "095997d97e9a22a782fb492e02b63627ea560087071b0b8f62cccfd8ca501601"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.263.1/path_provider_foundation.xcframework.zip",
            checksum: "b1d96b4923646765c4e0761081bb32df7db90f48ab4c21c88df9f6fdcddd3bb6"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.263.1/permission_handler_apple.xcframework.zip",
            checksum: "c0d3e4aa29da55b3b214df7d2fd1fe457af481771985536e63376fcf18a11584"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.263.1/share_plus.xcframework.zip",
            checksum: "3fcb32317587c12e92c5a938c55ea945e1d76968b5385039ea162f8b85c2a645"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.263.1/shared_preferences_foundation.xcframework.zip",
            checksum: "7b69e15478080579f121f26db10e4534b19737f4e70a97469ec460c68ed25ffe"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.263.1/sqflite_darwin.xcframework.zip",
            checksum: "8f222ff485343935514986b13b153d45d53b03e1c1889dedade113d586b1440a"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.263.1/TOCropViewController.xcframework.zip",
            checksum: "6aa98305855ba4c7a9bac5e0172c80d4e8f52d49650645aab8772d592bbb4aed"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.263.1/Turf.xcframework.zip",
            checksum: "d413474ef7fe124c7e2bb6a8f60410c8f2327188a63f945971f332999a0b375d"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.263.1/url_launcher_ios.xcframework.zip",
            checksum: "123fbaf99edf616d443f1a34ace4d9027fe7adf76c80850b056a6c1483238592"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.263.1/video_player_avfoundation.xcframework.zip",
            checksum: "604aa755c3a6b2bf2a528b0967e0b4292a50a19bb9a43b4782a16a769438b507"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.263.1/wakelock_plus.xcframework.zip",
            checksum: "6a9834f8a8299125b0567809ba8b511015e86b37535e124dd1a3b50451241b56"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.15-test.263.1/ZIPFoundation.xcframework.zip",
            checksum: "d626f8235d82c15d270f379e28e11cadd1df211d59501232b6be47022feb5ef3"
        )
    ]
)
