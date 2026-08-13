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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.335/App.xcframework.zip",
            checksum: "368f3e0fba373651e139fac12229f00696f12b15dfb28d9ad9313aa9721fe6cb"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.335/Flutter.xcframework.zip",
            checksum: "c397fe7066b855282e585c73eeba7397a62a518f07de4825c43c53cbf2a8cde4"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.335/connectivity_plus.xcframework.zip",
            checksum: "85447a18bb53722f0f98b7a5ade782d3520c907de2408173c98d51677e555872"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.335/device_info_plus.xcframework.zip",
            checksum: "3529be2f81d91bcd3ca30e1912c0b8cec2bfaaf7faf332da7de6c9729d0cdc35"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.335/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "a2f6a3bb9642ea0858178e3c4ab8c2804f1645dc193403ae324145e34e480cbe"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.335/flutter_local_notifications.xcframework.zip",
            checksum: "500a103bc7b396c2bcd70ed85ab77724efcb23f1b9ad2997133c25f21fedc050"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.335/flutter_native_timezone_latest.xcframework.zip",
            checksum: "db4917c028c2ae8f2b29983f6b6cfc344add8504aab439790333d1054c118b5a"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.335/flutter_secure_storage.xcframework.zip",
            checksum: "59b4b317d5670368719aa771f07d8368ce66f9d4db508c5e3d8940a6beffed72"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.335/geolocator_apple.xcframework.zip",
            checksum: "a79835f4e608dc38e3eeb508ddfd1bd3c21d29faaade2651842d5e231e9cfe09"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.335/health.xcframework.zip",
            checksum: "4193f1ec16069c6b5ffb000003885a416e5e67e4e83e4a1ca47857976faa5310"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.335/image_cropper.xcframework.zip",
            checksum: "47693b8b1324f5be303444ea73af7bb50fe54614238394291c1c0cfad2a05d6c"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.335/image_picker_ios.xcframework.zip",
            checksum: "33918d73ba3fce295f5474a4449952be21d608f261e65922e94d86b7d93dfdd4"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.335/mapbox_maps_flutter.xcframework.zip",
            checksum: "e39cc3b5bcd5c393f66c6946c6918491480728540be230948b51ee209be41b26"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.335/MapboxCommon.xcframework.zip",
            checksum: "2b02e0ea12f52031762f2286168d184c70e2273ee888d97f1d917d1a0ba4c7b6"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.335/MapboxCoreMaps.xcframework.zip",
            checksum: "bd989bbd89e8edbc4f2cfd5b4a7b9bfbf32b8d6067c622429b88b2a184f26725"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.335/MapboxMaps.xcframework.zip",
            checksum: "513fd371eda668ded74a790fc47ed1c746b1999291847a7fb9544a7de857f0f3"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.335/NordicDFU.xcframework.zip",
            checksum: "0ff2d19580102f774a61eb0a0a8e7cdd4f954ccf26e6a2a8391cdbdf43a7585b"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.335/package_info_plus.xcframework.zip",
            checksum: "3c45598dbc9693d15a42f4122c4784bd9bac9d0d4f48c7f1bd4d4318b956434c"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.335/path_provider_foundation.xcframework.zip",
            checksum: "f781ff1eabb4922f0127f11d06555a223140b53a1614a9f0e9e13495b300cbb8"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.335/permission_handler_apple.xcframework.zip",
            checksum: "db9803634cc3508d909a86f3c6af610357fe47e60c027c1bbd1b4acbd4cb96af"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.335/share_plus.xcframework.zip",
            checksum: "04ea9adce698c3979772392e6107dc43ceeb32fe26a7d57c853e583764181bb2"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.335/shared_preferences_foundation.xcframework.zip",
            checksum: "5c943a5ce433e3a6ad5598a3320661135ab8fdb27c98149cdb9f1f518ee53650"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.335/sqflite_darwin.xcframework.zip",
            checksum: "acc2f0fa818e203b1116cb01ccd76c52f1f0698e2d0fdeca72040dcad31fa036"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.335/TOCropViewController.xcframework.zip",
            checksum: "6cebdf872a9cb2c0f75945ac44d7872385fc0e639976654cfbac436241709a04"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.335/Turf.xcframework.zip",
            checksum: "2950a2a23b8794d2561f37ba95b1f9d24e6e0fb09c9477ccb1800d29f00087be"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.335/url_launcher_ios.xcframework.zip",
            checksum: "b8ca8b03fd56d3bd35254658c7c7bec43234695c8781feb4802af0e2ad9f27fa"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.335/video_player_avfoundation.xcframework.zip",
            checksum: "dcb1041bd064ad1edf88f68064f92b3265bbd872696d78bea684d54948787e64"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.335/wakelock_plus.xcframework.zip",
            checksum: "fb4b8aaaff44d24e931e21126756900d0a41e9f77e2be03d89a183e327d8711b"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.24-test.335/ZIPFoundation.xcframework.zip",
            checksum: "fde5cf025a773df04e30a85e080ecea02b47d5cd64379deabea337a4139fe3bc"
        )
    ]
)
