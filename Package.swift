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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/App.xcframework.zip",
            checksum: "5af57ebdcee007139cbf8518bf0005cde80fdcb322e1652b9ba92b165b4f3c2f"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/Flutter.xcframework.zip",
            checksum: "7d4be1e24f95ab2f121c2633684c9bb35a0c7bd2529ec087d0e4e7641dfdec5e"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/apple_health.xcframework.zip",
            checksum: "a36735e8422f65580308cf759b8ddf2786ea9bdf8a3e8d46661189bf4111b8ba"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/connectivity_plus.xcframework.zip",
            checksum: "0a42bded8cdb491f9c107fda4c99acab14dc9d978d9cfddcb2dda981a036c5b2"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/device_info_plus.xcframework.zip",
            checksum: "6b3d75a38680f104cf8f5bf348ab35c7b0374b2858f5acb066c6da196084796d"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "963eb47fbd941dd25278705efff77bff53267c74cf4b81d42b47829d579196d2"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/flutter_local_notifications.xcframework.zip",
            checksum: "ea6786809f7a31e8e915fabae9a293581dcf2eb8af39b472b0710d40b9335367"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/flutter_native_timezone_latest.xcframework.zip",
            checksum: "2b7f5d182c45d6a9a1d2f8fee476dc5aa2fdf4e558f71bcfa2b8139bfef2694c"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/flutter_secure_storage.xcframework.zip",
            checksum: "1b15ce8227ed922f29924fd73ad65fbe6033c69dbf95e16324f20cd6982975f1"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/geolocator_apple.xcframework.zip",
            checksum: "8ccd2f09a442dd62fe1dc713ec6f9140a191eeeaa33adaa7ee38ddf4ed02c3c0"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/image_cropper.xcframework.zip",
            checksum: "84c60c6d9a19828dac4f560a3e9fe1954d08e04c7a299c32cb31a03ef7ced714"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/image_picker_ios.xcframework.zip",
            checksum: "d1182a9845ce28e5a7741d4666903d508c6db65976adad5a655c22d7357e8d93"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/mapbox_maps_flutter.xcframework.zip",
            checksum: "156d697236dff5f3be45aa17ba4ab6f9da8db198dd8c3d10009bf26236d68ba1"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/MapboxCommon.xcframework.zip",
            checksum: "f969d139abd02e8a9c73e7ebc84182f28f3f49fe848e111a2484d76ba02cde23"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/MapboxCoreMaps.xcframework.zip",
            checksum: "3e5c461015da97c23d952697e98376b4946cdb293b92adfca0d8210a05f18610"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/MapboxMaps.xcframework.zip",
            checksum: "04f4038b77b238c3c71be1c54b8374ab87a4511c7f9ff43b7cff6dc48a32cd84"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/NordicDFU.xcframework.zip",
            checksum: "e85617da469a8802f4993377f3e450bc92253c0fe22a9d8b092047a8ae53280d"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/package_info_plus.xcframework.zip",
            checksum: "c67277fe702fe53b05aaac8956fb2e156d4ca08757f02efb54d3d5fc630cc075"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/path_provider_foundation.xcframework.zip",
            checksum: "86f458d8f29df85f8a5adf6a48fd951b3e64263e8c239de96de652f73727e716"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/permission_handler_apple.xcframework.zip",
            checksum: "6c71474385d854f2c840781a9f80dc8c517184c9885dfbce2a335647de7f7de3"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/share_plus.xcframework.zip",
            checksum: "4a5e05cc846e7d6c03dc4f63aa038103a0c0dce93b52310b8d2ac5b32908924f"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/shared_preferences_foundation.xcframework.zip",
            checksum: "57408027b81aa2fab3f3598325a9c5bc7f8280658b95b64df40b0916b9284a1f"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/sqflite_darwin.xcframework.zip",
            checksum: "6fb70f6062a4285a75015a32c2bd99707fb839fca9171e262fb8944d5008f17a"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/TOCropViewController.xcframework.zip",
            checksum: "8cf4b75fcc6715db9affa11638871530e1449840cb731bc265cf9c35229a7b18"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/Turf.xcframework.zip",
            checksum: "044fe71491e58b526c878a694c71767da6b46757a126fc84c01235c89cddcc21"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/url_launcher_ios.xcframework.zip",
            checksum: "5a008b500640fd216ae755c27eb32de68a2bf98bee29b8a3dfd6d895fb4408fa"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/video_player_avfoundation.xcframework.zip",
            checksum: "b7c61f98769909035b1a8bd991b67e7d629ec80a6be7d1cc81309877d6537f98"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/wakelock_plus.xcframework.zip",
            checksum: "8c3bf16321d7d7d090b6e7ad3fe680ec337876d2c786beeac3287b64df2bf22f"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.0-test/ZIPFoundation.xcframework.zip",
            checksum: "7ee14aea772196e6a77fd7404fb5488445ff06387c4ddaee668e5c7fe13a4c7d"
        )
    ]
)
