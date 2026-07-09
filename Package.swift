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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.287/App.xcframework.zip",
            checksum: "910ad9527b81bb7013541f0ee8651dd4eaf3e75e36a56c5115caf0ac90b05665"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.287/Flutter.xcframework.zip",
            checksum: "7b7ab2cc04a0fe63a8f4b97efaa1e043f3e86156f39f1d03559d397e62f28505"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.287/connectivity_plus.xcframework.zip",
            checksum: "f7df016e9804ef78ad05cac430f6039a1cb2bd5811d3f5921568db9b61a381a3"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.287/device_info_plus.xcframework.zip",
            checksum: "8cee33c3820c22f1baf52527c215d7632cb9f7c3e979d372ff07c08e612aca88"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.287/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "23696794aeb5885d925f1537f9341a9a2a85d189012504fc77a865d607e5734d"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.287/flutter_local_notifications.xcframework.zip",
            checksum: "349bae151a70e83fff1f2da6290749291ec03db4d790e96d7b31a2c2aad673cc"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.287/flutter_native_timezone_latest.xcframework.zip",
            checksum: "e4e45dad5b51e6cbfcd5dce1dbea34ed3daf1801b9ce75fc1f4eb825d8718bcf"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.287/flutter_secure_storage.xcframework.zip",
            checksum: "6c8e9c7fc4aa4cf3d4da7b8c855677b7ae9ecdf33684897d7c5b724ae5bad722"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.287/geolocator_apple.xcframework.zip",
            checksum: "dc067ef0e89271c4b4d31630bb0ec151e9455d7289e00e64e4b6c3a957bd9e1a"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.287/health.xcframework.zip",
            checksum: "b41984bf39ffa8678ca422698ad7b546bc291b98adc7474f9c82fd0b03c5214a"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.287/image_cropper.xcframework.zip",
            checksum: "80ea92a227a4579153c13f36dbd52e6768770a7f3e4c32552aeb2074064fe004"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.287/image_picker_ios.xcframework.zip",
            checksum: "37dee8f9d76ce413891b0351b7c6120cb2de3068629f23f931b22794e81c5ed3"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.287/mapbox_maps_flutter.xcframework.zip",
            checksum: "a47229e4af5b633a378dd1fd2c27b4a6ad36619ecabf24d61cc4f30c5837b20e"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.287/MapboxCommon.xcframework.zip",
            checksum: "8805df80f639964c0b7aa7a4220bdc6cfec9ef5bbdd2bc1a40c6ea91cb4ca5cb"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.287/MapboxCoreMaps.xcframework.zip",
            checksum: "e4437643afa4b6f95a2086b61b29eabd1f3e0e041ca120e7bb4f04e7f5244c8f"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.287/MapboxMaps.xcframework.zip",
            checksum: "08c4da8ba8a5b506212a8cc7cf10a6308166f53b49bb19a4266612ea5dedf759"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.287/NordicDFU.xcframework.zip",
            checksum: "eb0cc8a7e698d6e5ee3993a0439777827f09d8bc7b72faf2e3de325eea63e215"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.287/package_info_plus.xcframework.zip",
            checksum: "9e56df98b4b13cad12dad1a6ceccc2494a103ae16129876dbd3e275b508d179c"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.287/path_provider_foundation.xcframework.zip",
            checksum: "65a9d31b3c4da75b09f09512778e5a5555cf23223e17bb7ffff7dc70f5ca99c9"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.287/permission_handler_apple.xcframework.zip",
            checksum: "c9bd7591556a00b180a993a421ad707020dd19d8657f29e519514b944e1ace53"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.287/share_plus.xcframework.zip",
            checksum: "48fa41f83d884a6057d10e6cd67c81ddb408e0342f309cc811fd98d5f78d89d7"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.287/shared_preferences_foundation.xcframework.zip",
            checksum: "85feb5d2ed3099c7da4d306239c5c69c1f753218d915c87b023423db7d39ca90"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.287/sqflite_darwin.xcframework.zip",
            checksum: "091c82f129e6954f2df39096e3c9d21279203183daf3565af5abf60233e0b5f8"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.287/TOCropViewController.xcframework.zip",
            checksum: "e70d50ff6a437b9e1645062ed25871bbc44c6ed74c2e407eb7c41263267fd4fb"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.287/Turf.xcframework.zip",
            checksum: "b6e8c4da049b84caebddae12a6313274d4937534fce62bcbb1a808c18f52f77b"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.287/url_launcher_ios.xcframework.zip",
            checksum: "39678f9941463d486088528b82dcd9d353e18060585c58f1cb17d56b7e399108"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.287/video_player_avfoundation.xcframework.zip",
            checksum: "42611f676c1ae50e97302c8e00bd8a375568b3d0b41c0f07d33d7311fbbe7025"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.287/wakelock_plus.xcframework.zip",
            checksum: "fb6df9af5b18f085f30a329926572b7db36853431f4d4a4f5f213ffd364fb645"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.287/ZIPFoundation.xcframework.zip",
            checksum: "379db69a3857bcebaf3877c025ddbfc44f55f0e92c164364e1f2c0b991fd76ef"
        )
    ]
)
