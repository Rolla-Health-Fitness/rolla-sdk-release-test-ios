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
            dependencies: ["Flutter", "apple_health", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "FlutterPluginRegistrant",
            publicHeadersPath: "."
        ),

        // Swift wrapper API
        .target(
            name: "RollaSDK",
            dependencies: ["FlutterPluginRegistrant", "App", "Flutter", "apple_health", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "Sources"
        ),

        // Flutter module (Dart code compiled to native)
        .binaryTarget(
            name: "App",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/App.xcframework.zip",
            checksum: "7857fb8ec7a727875a7b844653465b2cb404d3198e6c378060059af2cd78f017"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/Flutter.xcframework.zip",
            checksum: "fa55559f5c4e489a16ba8bafa041854dda75ebd6ef752b621de08b3e743a47c6"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/apple_health.xcframework.zip",
            checksum: "1c6842d1bf4d9de2deaebebc6631a4107c76ddaf7e2e27729980d81abc9edfbb"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/connectivity_plus.xcframework.zip",
            checksum: "2d2d1a4fc0033d07eb3f8c4d8c1d96c217597f680ea45207d81f8635c9a5b06a"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/device_info_plus.xcframework.zip",
            checksum: "877d3d0748121a0bd8e8814f2c1e02d90fc3f821c33c30c648fe8ac4d8bf4fe9"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "6e3868ae7c7a6ceb07da2fde41a49623f3afa11ce95bd886cb448ef253959d7a"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/flutter_local_notifications.xcframework.zip",
            checksum: "83ef1b7b19847fad59eee66b6053678faf119c044cbf62d0f0554cc802c91abc"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/flutter_native_timezone_latest.xcframework.zip",
            checksum: "83445020418b5d5d9ef16384d033476aa0a740c24bf4b45e8a23c4279a0d0a8f"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/flutter_secure_storage.xcframework.zip",
            checksum: "d95a4adf1d2089f631c96c5a1437c52c371b218769da1256b89ce736ddd5e5d6"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/geolocator_apple.xcframework.zip",
            checksum: "9d103c15cd300969b5b739450ab291d648d10835a26a7f13562d9b2b0185a2d7"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/image_cropper.xcframework.zip",
            checksum: "1c540bea12990e20157c205c5134280ab72709f7f0edcc354e35d1fedfd303d1"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/image_picker_ios.xcframework.zip",
            checksum: "4a50f6b2b116315d412c3d7f2ec04e149b27b5691979a09632a5a78e62063d63"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/mapbox_maps_flutter.xcframework.zip",
            checksum: "77a2f349bc0c33ddaa95fbfc3d0703bfbb12dac5b4803fdc8f2d5b4144af3b93"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/MapboxCommon.xcframework.zip",
            checksum: "ac20667587c3765a72fbe56b050fdb5ee9e93ad8102c5343dceb8873dc871285"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/MapboxCoreMaps.xcframework.zip",
            checksum: "75296a9be8f3dd00f9b4a994b1d6cf08df3eb4dc20804da89d05ff5ee3ae30b1"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/MapboxMaps.xcframework.zip",
            checksum: "427c55bc8e56811308d3d6267b128ff0e3277c43a08b7bb19bfb37e3e1078c79"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/NordicDFU.xcframework.zip",
            checksum: "76b3b495dd8290791fcd7aab06a5b6d2b444fd5e44010be1841cfd08cc243fa4"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/package_info_plus.xcframework.zip",
            checksum: "13ac35dfbc98212000b61b7da73a377fcbade73a3f5d8352492d003a95fd84b4"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/path_provider_foundation.xcframework.zip",
            checksum: "64720341acce7c1e08ef255b7c32ce25b156681878abc41d91efc09bbe04cf0c"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/permission_handler_apple.xcframework.zip",
            checksum: "7c3779bfbe40594d26cefa72227e8ea3fde092f7a5bc8c8c4a5f6e85be85033f"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/share_plus.xcframework.zip",
            checksum: "c68f8248b4f0eb369d4acd5da67976acbdb7bb65ce0eba9301a0fdb214a508b3"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/shared_preferences_foundation.xcframework.zip",
            checksum: "4929ed908e8ef9c598eed6b128d38ee07618377a986c34f4d13329c3d6053097"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/sqflite_darwin.xcframework.zip",
            checksum: "549a3ba9737810469df8581bcb1b16f2005168621a2f595c3ed6a81b4bd86477"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/TOCropViewController.xcframework.zip",
            checksum: "bbfb893f417065cd904290d586902dc7a1fd7b4438d8473932da4021d01910b5"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/Turf.xcframework.zip",
            checksum: "8896978e5ee230c65449d3c3a36a9c3d594891134ec4b771b936ad2d8d476ac5"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/url_launcher_ios.xcframework.zip",
            checksum: "13b3d2fe8038833b2bfffc7d4bc8c40c3027c70889214157cf23954e1439e589"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/video_player_avfoundation.xcframework.zip",
            checksum: "19d464956f97a2cbdf07ebec65b1b54a027640cdcefb83d45023169302a7647a"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/wakelock_plus.xcframework.zip",
            checksum: "2f151414e31393322dc176676259120185802b6d46cf04f47ebcb5b643b3294b"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test/ZIPFoundation.xcframework.zip",
            checksum: "eb9180ab44cdbd7d9fac885194a3a8be7c402007d1ea02c4269b0f6d18830b7f"
        )
    ]
)
