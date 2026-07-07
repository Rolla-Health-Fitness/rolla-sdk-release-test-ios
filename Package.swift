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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.283/App.xcframework.zip",
            checksum: "cd37464f2713d0c3e35c66d3c5470166d994150f9092422724c1f53cb5e58881"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.283/Flutter.xcframework.zip",
            checksum: "bc2932094f6f74028465c74a59ab7955bcdc2e752378935c60d8995d74e1c84b"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.283/connectivity_plus.xcframework.zip",
            checksum: "f7010a1f696ad62271533a1064223ce6657dd9b80d47e4e381f71cf4adfbe8b7"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.283/device_info_plus.xcframework.zip",
            checksum: "8c54aab44929dbde7a464bdde716967bf92ef4abc56e5d6dc76ccd7bf7c06be7"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.283/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "d5d8de137b2e17c3ae874d8462a2d513c9cfb86b420348988c17a5d98319cc21"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.283/flutter_local_notifications.xcframework.zip",
            checksum: "a6b699a373fa089ec053d06203d507771f6b56c125685d41acd3fa5c398ef6e8"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.283/flutter_native_timezone_latest.xcframework.zip",
            checksum: "c4aaa8de565df6f7bee75346097529f8448f345bf0bf6aa5139e585fda7e66cd"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.283/flutter_secure_storage.xcframework.zip",
            checksum: "6ae6e3888e339c43d9d862542650b671b636c4d046cae2ba62a0b1d9daf2cb26"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.283/geolocator_apple.xcframework.zip",
            checksum: "847073832f7aec01c6d5b169cb1077eb1c5a2335703f043303953f554a274efa"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.283/health.xcframework.zip",
            checksum: "cb66b951a91ec3629e4e82d1c96500d36d299d6de0d09d68d6c9e8d1167de4da"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.283/image_cropper.xcframework.zip",
            checksum: "99b9859a050635cca13f89cab2eb22379b05bf227c178f350a3e2deb63aeee5e"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.283/image_picker_ios.xcframework.zip",
            checksum: "d0a6121909219f05c5edb572fe4ce85788fccb43e3697695e4c0dcf39f696212"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.283/mapbox_maps_flutter.xcframework.zip",
            checksum: "bbee020c20a9b4ac78809f925bf11fc23c9e07ca9fa953f1c69a047e4188956d"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.283/MapboxCommon.xcframework.zip",
            checksum: "77c879339f11f1e273734be4e0dc1fcb12f030badbd8b37da5aeb5ee48a6590b"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.283/MapboxCoreMaps.xcframework.zip",
            checksum: "e9d2cce33ad1f182ed686b473fa9c767d8ae1a77e20a20816a9279c5a937e71a"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.283/MapboxMaps.xcframework.zip",
            checksum: "46173c1b0de79ee34651b9eeaa4f485828bfdd7ef13850a8bae900f416e8ec6f"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.283/NordicDFU.xcframework.zip",
            checksum: "d992cc73aa35a78a70cea2210de95fc57859b0f18d170735e90ac1dd4a70b56b"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.283/package_info_plus.xcframework.zip",
            checksum: "f1e73881500177561e784fb87ffdfd72baa53b01780b7dd3d8eff876121e1551"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.283/path_provider_foundation.xcframework.zip",
            checksum: "56b23b09b445d9a2237faa2e5d4eea5a13fc1dfbb005b7ab8034a40407501859"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.283/permission_handler_apple.xcframework.zip",
            checksum: "db030bb0bbc2cbd2f32fe006e75a22ae62fa52ae779be0fea725eab8484fd623"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.283/share_plus.xcframework.zip",
            checksum: "f5361b7702f123c645781fea66b16072dc0c19a38a8b837d3cdec78b8a40a5e3"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.283/shared_preferences_foundation.xcframework.zip",
            checksum: "f4c5768307253c3684abe17589c6c672631abb1205e5f6b75c95dd6aa05c730c"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.283/sqflite_darwin.xcframework.zip",
            checksum: "f98298128a578db417af1240346a847189486b4591f0e6d42aa2c5b58969283b"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.283/TOCropViewController.xcframework.zip",
            checksum: "24119c5fdac8cf00809637aeb151a82326be7d4b92fab719cf7116a308241515"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.283/Turf.xcframework.zip",
            checksum: "fe2cc104c035ca150074fc70d0722167d122d74b405e3a9a48cf1a030155c060"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.283/url_launcher_ios.xcframework.zip",
            checksum: "576df39761b288cc9abc1733ff08782d2aab0b6a87ba39ba5daabb0e1d7f95cd"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.283/video_player_avfoundation.xcframework.zip",
            checksum: "e0a2eec2721b34bcdf2b3474bf7637444932c81f92269865e78b182c6181d5d2"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.283/wakelock_plus.xcframework.zip",
            checksum: "a9a0b5955c2006a784341b4dab63568ccf761da95c842d42ece8034994db264f"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.14-test.283/ZIPFoundation.xcframework.zip",
            checksum: "f03012c0b18b729b284cbbe14a1dbedabd7ccc0ebf0df12001590ae694b4df33"
        )
    ]
)
