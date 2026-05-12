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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.242.1/App.xcframework.zip",
            checksum: "a651c2e74e467f46b22ea0c374922cb04aebaedab60337a268ac1c704f95105e"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.242.1/Flutter.xcframework.zip",
            checksum: "250d9c733daa5ac10586d7ca40ade30b5962be46e1ba812c577603e2a4a36093"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.242.1/apple_health.xcframework.zip",
            checksum: "d7299543138c73f68f4bb2902544cda75d7a3baca0d5181643798f1058d5da89"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.242.1/connectivity_plus.xcframework.zip",
            checksum: "b95427162e9d48996917bad98d6c945d99459ceecfa544acafaffdb3574c4d00"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.242.1/device_info_plus.xcframework.zip",
            checksum: "8c5b7781f2a890a1c4f8b64a876ac3a25441786c63fa47b77f24934f84824ce0"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.242.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "0e106eb7a1ae7b7cf7c3884734f654d75d735d54cf9edff5223070e9c99154e1"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.242.1/flutter_local_notifications.xcframework.zip",
            checksum: "847c5b303efc71c736afb357d4c4cc9f3f2cad033c1c6835e6494346a6caef13"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.242.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "46de66e2c43e0ca398c6da1c08396909fb8234272bdde666c28bb92fe7623065"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.242.1/flutter_secure_storage.xcframework.zip",
            checksum: "24b56412f816409338565f0b65829162bceefa386d5f13d994f73446cb1f49cf"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.242.1/geolocator_apple.xcframework.zip",
            checksum: "99a66706b6caa37fb8ca710283bb10263229a75fa37d903d99bf820587bcee10"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.242.1/health.xcframework.zip",
            checksum: "17d7f9bfe65e9f8c2990d83b7bd89ea0b2f1baa4a93a58b9ff7cd83d0087c855"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.242.1/image_cropper.xcframework.zip",
            checksum: "e193b9adfccff48ed919fc47e443b088de8849e07e243a3340f682704f752163"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.242.1/image_picker_ios.xcframework.zip",
            checksum: "323a197463896e43ff9c7e40f7d0e3a603b7358d27ebbbabd62d23ef60a8ddd5"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.242.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "54afe189df81d56cf4c235128eae59bce6c58fc78a0bdc8e45a68b0fc9eba969"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.242.1/MapboxCommon.xcframework.zip",
            checksum: "c58bc4c87583905d0e7295db4ca5478bc0273b45b351c1c6d6b30ea4e08d089d"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.242.1/MapboxCoreMaps.xcframework.zip",
            checksum: "b4cc6fdcf045013776c098affa6f4819d0928ece1f87d72ea5181745bbf446d7"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.242.1/MapboxMaps.xcframework.zip",
            checksum: "46c76dbd0d01feb31407818a70edf2ef77df912f7cb84d245a37eadea5e259a3"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.242.1/NordicDFU.xcframework.zip",
            checksum: "c3fb53d6646fc4280bb96feb9ceaaa0771ac102b49bd8dcd451792424d62635a"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.242.1/package_info_plus.xcframework.zip",
            checksum: "1a6daf33094049710ff8b1138aefff40a666a907f6a0af011b309e0700c28887"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.242.1/path_provider_foundation.xcframework.zip",
            checksum: "3b7548582ccdadb6a4574d9aad50ffd8dc4b110c46b9d6105c64eab70a502f21"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.242.1/permission_handler_apple.xcframework.zip",
            checksum: "328fd6559703edd385c1a39d09872c5d374d78c5205a89b31f149901db141b36"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.242.1/share_plus.xcframework.zip",
            checksum: "c7281b536ef116a50c6059550a94c248190900e77e5a7e7a838c210ba8fd0410"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.242.1/shared_preferences_foundation.xcframework.zip",
            checksum: "cfdc8af6eb19089ec85811aebced5356c60d9b9432f0f3337422b685c55f0f54"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.242.1/sqflite_darwin.xcframework.zip",
            checksum: "b5b7c1e543bbc9795a5ddd33c7cf8580a2f2774d00d84f35eb1b47119074d844"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.242.1/TOCropViewController.xcframework.zip",
            checksum: "31c1d46216720d899eab0e6133ef854f1f0d58611c2a9a9526649f6b721c1589"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.242.1/Turf.xcframework.zip",
            checksum: "0d129136dd9ff8af6620ecb5adfc84434da0adab448a3f10fd0d219f8559e297"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.242.1/url_launcher_ios.xcframework.zip",
            checksum: "b07eadca9095ca0651d45517096dcfc7e4c41b24b74449036c850671ca1a299b"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.242.1/video_player_avfoundation.xcframework.zip",
            checksum: "e1e0261e3e9aabb51b98471866f4a6bfb4db36402c2be9992ddfa0dc2785c6a1"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.242.1/wakelock_plus.xcframework.zip",
            checksum: "249206da24a17e08e133d94ab718839628e682bd2a97c1c243282b130ffdef5c"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.11-test.242.1/ZIPFoundation.xcframework.zip",
            checksum: "eb813fafa1046970800f22357d99538ab276e39950190f61e9367eb49f353e69"
        )
    ]
)
