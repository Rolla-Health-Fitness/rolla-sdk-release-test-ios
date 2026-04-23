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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/App.xcframework.zip",
            checksum: "8cf1fa9e98772174634afb0cf76916273f0ba0bc492bd7ef776a00670f4b7c70"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/Flutter.xcframework.zip",
            checksum: "ff569f0d14c1db554f4c7504cd75598329ef5704967ccd7b064256bbec6da1c9"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/apple_health.xcframework.zip",
            checksum: "02de423d4d1b65d5d991bf0d126507e5a7d972606b2df7ca3071737a45677bd7"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/connectivity_plus.xcframework.zip",
            checksum: "76e49852bde9a6cdc4e235b8baf1f396ad968e08446081d25ad040b4b988f0e6"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/device_info_plus.xcframework.zip",
            checksum: "7adb3e0172d741c405ff104157dd2c24bafd82f4f80571641fec5a06b9c45a2c"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "0d9ff912555e334b68ceb041f59b663530dc13b6e503814209847797de8d32f7"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/flutter_local_notifications.xcframework.zip",
            checksum: "f073a856090349106a5aecf7cce163d31d7850063eb477d02189ed8d343155c7"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/flutter_native_timezone_latest.xcframework.zip",
            checksum: "b6d830c18873abe20a11410eeb4d8b9a7b44604d728eb6766def4589a7df357d"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/flutter_secure_storage.xcframework.zip",
            checksum: "3a6be8c5039c28b77e908f4a1aff532c0e2c173eb351c299d61a005166c941a0"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/geolocator_apple.xcframework.zip",
            checksum: "664854082e7a403b234e070a55b6f1fa4ac39430b3902f8feaff130112f79ba8"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/image_cropper.xcframework.zip",
            checksum: "6d2eb8986a6669540f0233470cc1ed7a386fc0f39fccefb59e883d64f73e435c"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/image_picker_ios.xcframework.zip",
            checksum: "dde16325e71af7426b1ea2247db84cd1cca1ce6d453a184b3c5ba0352b49a1e4"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/mapbox_maps_flutter.xcframework.zip",
            checksum: "15b9ae774ae1344069e8974eaae1934e97515aa8929f878d78f1b79a3bf27c34"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/MapboxCommon.xcframework.zip",
            checksum: "9756a3025ac19ee5ac1b3866b4b753f539c1072f70dc0e73c69afd59bbbb1b7e"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/MapboxCoreMaps.xcframework.zip",
            checksum: "fabd19bfb7ca7db9441356af40c9aa24481f63a0bd7f02c4e4b8ef4ccbb4c259"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/MapboxMaps.xcframework.zip",
            checksum: "9a69785c04c5437e05cc6d5fc94960b91db4197b66d075d55b38a24edeac9712"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/NordicDFU.xcframework.zip",
            checksum: "a817a4b2df2960d9345ec906eaeac9cfe7344f0a90519c9bfd504ef5e4fe3229"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/package_info_plus.xcframework.zip",
            checksum: "5907aa40ac7277d99e9dcfee90a432dcf923ad6eafb1dd577734e1a1b1fe4c4b"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/path_provider_foundation.xcframework.zip",
            checksum: "a3f72bce8d248aa440c016a493bb8d32dbac67f4f7e5e42700ad4864d7096a7c"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/permission_handler_apple.xcframework.zip",
            checksum: "05147d089632306a5538b3d5f682d13e6aa1b92a83d60103a150e4edbb03b830"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/share_plus.xcframework.zip",
            checksum: "317ad3c1f9d152b9018279acddcc1ba780fe3a2a84506d2d01fe738b9eaf8078"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/shared_preferences_foundation.xcframework.zip",
            checksum: "70bbf4d316b3ddc6ef626ba0ef9eb9766ebecef68a496c38b93bc548c8125387"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/sqflite_darwin.xcframework.zip",
            checksum: "c29b2274b570cea6e1945bbab606124e59f3e1c49de027b456c223d2c7b7bd6b"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/TOCropViewController.xcframework.zip",
            checksum: "5ca934fa9af7126942ac93f61fd9133dc870053e4a934cc197069314cfd2358f"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/Turf.xcframework.zip",
            checksum: "18264b3ca511d1719b81f031483cf02129e1732541c0f8cc0acf44e68c2a7dd8"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/url_launcher_ios.xcframework.zip",
            checksum: "1f0dd4b368aeae469cd79ba8441ce347ec42627e849ee34f9a607463a9880bf4"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/video_player_avfoundation.xcframework.zip",
            checksum: "3d32aaf0feebfebee05e47529a335315b74973b4960ebffae575c0ec11d97ccb"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/wakelock_plus.xcframework.zip",
            checksum: "c9b94a85b64537292a16c5a302a9ea47c55c89b58b4b9881baaf168b76d054b9"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.3-test/ZIPFoundation.xcframework.zip",
            checksum: "58b2ee41725199a19be0d18f05e1098cc374601daea45910c4ed432be015d963"
        )
    ]
)
