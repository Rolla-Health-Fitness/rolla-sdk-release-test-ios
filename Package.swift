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
            dependencies: ["Flutter", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "FlutterPluginRegistrant",
            publicHeadersPath: "."
        ),

        // Swift wrapper API
        .target(
            name: "RollaSDK",
            dependencies: ["FlutterPluginRegistrant", "App", "Flutter", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "Sources"
        ),

        // Flutter module (Dart code compiled to native)
        .binaryTarget(
            name: "App",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/App.xcframework.zip",
            checksum: "81ac014a9b8acdd7c7ad4290b93d2f05c7e9ddf16c490766a396864c9a03dbcb"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/Flutter.xcframework.zip",
            checksum: "7f38da5844a992c82f9b41f6e2541db42f544a777b21c284d4bc82264a4c5399"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/connectivity_plus.xcframework.zip",
            checksum: "ed21224d68c4c18b5ff826f830ec833d00d66f7c0a86dea46b2a2531ce6741bc"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/device_info_plus.xcframework.zip",
            checksum: "b2b5c64e6c622eb5654bb184402639b29929d43bb5dfff4b57d812d4d5c44fcd"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "94517fc4509e28918488d15c1ba52eff0d22bc1640d05f397d35bd4a80312d54"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/flutter_local_notifications.xcframework.zip",
            checksum: "93834d875515cbc845154c1f3e7c4badf7be72451787c3d02ba371cd8775a1a7"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/flutter_native_timezone_latest.xcframework.zip",
            checksum: "88652edc063349fbc2b81da5226f18e19b0c307caba4df612943b1e16453f984"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/flutter_secure_storage.xcframework.zip",
            checksum: "c30592c4bc0f1f9024a2b388d61d31de7df7a26730de271e646fe364fa13c4c6"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/geolocator_apple.xcframework.zip",
            checksum: "c653f9baec71fed5158d8c2b73f0174107e65bae90f2405b19e30be0169a6454"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/image_cropper.xcframework.zip",
            checksum: "015003c3ece120578b40fe74be583445117f77201db080f9984261389751e946"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/image_picker_ios.xcframework.zip",
            checksum: "8f409630b2511e52ba40766a1b0f446167af9899c836486029f3a87f0af4bcbb"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/mapbox_maps_flutter.xcframework.zip",
            checksum: "68b3b67f6fd8b5c9440426cad6346c5707e6045596145f8d91a82a94428848d2"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/MapboxCommon.xcframework.zip",
            checksum: "c569d1f7f2506a664671bc7e7d1a1ece982df3b43374719656e9c7dbfbad8aec"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/MapboxCoreMaps.xcframework.zip",
            checksum: "4e055642878414fd36763584240c6b7552636b1150b95acf15a3f0a0907d248c"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/MapboxMaps.xcframework.zip",
            checksum: "3750ad39ee35e09610d9c0b8bbed7cf9a76fbff092dc52c77a017ea7b99d756d"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/NordicDFU.xcframework.zip",
            checksum: "a1ef3e0e0e254cfc7fa43565fc86aa14051a0515e50c6fb8080dcffea2f025bb"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/package_info_plus.xcframework.zip",
            checksum: "47634ae68ab8713a304706c738cc6a538b3df4b54a0eafe7f65b42720c884a93"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/path_provider_foundation.xcframework.zip",
            checksum: "0606761b2f812ac9c29e131a0ae57afa4b6d195f09e07001ec361252b38a09b9"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/permission_handler_apple.xcframework.zip",
            checksum: "b436550de39c3600ce31fd2f3a7042900e5b73406bb7aee5761919e8cb1bf4de"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/share_plus.xcframework.zip",
            checksum: "c02c61dcb60162c54c406c82486124895adb9358f46f3f271eaacb971f466047"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/shared_preferences_foundation.xcframework.zip",
            checksum: "95fcac6398f0d3d94c849c8dbba3f9d1eb5fbcad96a4d85e20057ac8458211e9"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/sqflite_darwin.xcframework.zip",
            checksum: "b40b9b11842d71c9b3edd4977267fa8ec423995729bc5ccf070e7e75c22c42be"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/TOCropViewController.xcframework.zip",
            checksum: "2f0962631b442c4c667d8945a1fd21f523e88da1fd2e7f7936690caaf9f2c129"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/Turf.xcframework.zip",
            checksum: "4fcca48dec0ffae6a595eec92158d6ad722c3de82f0aafee5a5e055cfa8f7144"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/url_launcher_ios.xcframework.zip",
            checksum: "184b6a998bb529b8a9350bff1203dddba0b2b0504001fc0d9a74f74194545f18"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/video_player_avfoundation.xcframework.zip",
            checksum: "bc5d0cc748d85f82db68db444b9cd47a2c40f3ec816992d56a14cf9005f873c4"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/wakelock_plus.xcframework.zip",
            checksum: "7fa919f2d92fd0c950d54f0b5735484f5f06771500f4a64ac9c94a15c9682ef4"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/ZIPFoundation.xcframework.zip",
            checksum: "c17a7a7eace2983ba1a3db0b2d74a46b06e1cd1124c5667ff2626429e886a992"
        )
    ]
)
