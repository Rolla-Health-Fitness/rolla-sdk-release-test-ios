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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.279/App.xcframework.zip",
            checksum: "3d1ba0016e3288cd3a1fcef4640cb3d533abbf06273e3d650daf58da7166bd15"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.279/Flutter.xcframework.zip",
            checksum: "714cabd2da6e4675fb5adb5f8a2373f45a4ce680cd5a8fd4b173461ef2967449"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.279/connectivity_plus.xcframework.zip",
            checksum: "5ab530fe1a3adc32d6d1170e7afb7607c5a230552c9a6c8dae4f95c921829e3f"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.279/device_info_plus.xcframework.zip",
            checksum: "4b519df575467bf0190029aae64ceddd7c644a402a02e63144e9d4b9925361ad"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.279/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "b64bb7d0ecc73bd4a960c696371ff8905390020369001b66a4b58eea84365fd7"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.279/flutter_local_notifications.xcframework.zip",
            checksum: "ab91ae04a02593477bb33a39eb194f20963717c1e5d6cff7c301e42003e0482c"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.279/flutter_native_timezone_latest.xcframework.zip",
            checksum: "e74b9e9e8f93b35b8a490a334f441cc225222f18297542cb4a886894219f6cc8"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.279/flutter_secure_storage.xcframework.zip",
            checksum: "ceeb112cdee0cf4bad461534b5f4c329ce870d9f1d9884ace948d13607dab864"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.279/geolocator_apple.xcframework.zip",
            checksum: "a34c0adbc8dd6543a778abd69fc08daf20a97fe8f6c5d7e91d27335abe504afe"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.279/health.xcframework.zip",
            checksum: "a8edfbe4dd15742d71611bd181467006050c9f173b442f4c057a6316653970b0"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.279/image_cropper.xcframework.zip",
            checksum: "1f4e91668f4b175aca024fb2bdda6d9a83064f6daacae7715a12cf835456d4d9"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.279/image_picker_ios.xcframework.zip",
            checksum: "ae8793208b7bf17e7b0eba2ecfd4a039a4dafb03d2d808740069acceeb2db0f0"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.279/mapbox_maps_flutter.xcframework.zip",
            checksum: "d626e0c489d06c47455e4f91fde5481e6576211588137f23b3df4ab952eda532"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.279/MapboxCommon.xcframework.zip",
            checksum: "9ca6135bf876be658ebb2ce723e7960f582ac44cb66583732856000007a121ec"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.279/MapboxCoreMaps.xcframework.zip",
            checksum: "ea6dda04af1b78a47719f52b9597312e5ae6f484fca922daca400679a2685045"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.279/MapboxMaps.xcframework.zip",
            checksum: "02ec8af4071fb2dbb83f86c3bbfa4715adf845149b26ca1b4e82e3a39c37b74c"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.279/NordicDFU.xcframework.zip",
            checksum: "79b68cf18f7e9079d9863e437129734ff73d168ed5d0913c20cc725aa444e786"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.279/package_info_plus.xcframework.zip",
            checksum: "31108c73320fcafedbb42b8c8b08afc2e744c566481a276a737e4713f01cd234"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.279/path_provider_foundation.xcframework.zip",
            checksum: "73deb8b0de15ea21bf6969d053bb3ad2a977ea90e18d79600eb83020b56b483e"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.279/permission_handler_apple.xcframework.zip",
            checksum: "f87ace892f038c4200ee7738162a739818e7a730a2f7e77951876e7a4cc8276c"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.279/share_plus.xcframework.zip",
            checksum: "45d585a8cb09d781f0c447cee584da0d0b35c517af2a3a16839b6c6b1bed7a29"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.279/shared_preferences_foundation.xcframework.zip",
            checksum: "cefa13efb9505bb5d1e29d6dbd69b86702a6984c05d6caa07be18e02bbf36833"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.279/sqflite_darwin.xcframework.zip",
            checksum: "d7a8e1f003e9079cab921a3110f7fa163cda608bb4079cd1eb0e4d8fe3c1b304"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.279/TOCropViewController.xcframework.zip",
            checksum: "52db48eba517663df7fa6e19c3abf9d3780ffedf26f4a434d397b3e9c59b7dcb"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.279/Turf.xcframework.zip",
            checksum: "f45dc6f8ca378c0f515eee067a18a1eed45d18aff6a8fa9ed4e8fe0858a089a8"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.279/url_launcher_ios.xcframework.zip",
            checksum: "7331ef2de9868125d7329f666325d070980bf9bc544d95e9fc6ee611b76dd8e8"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.279/video_player_avfoundation.xcframework.zip",
            checksum: "42e8c47756f8df468438e0bb5c80fd016a01f84418e7bf9126d5ab3c69fcef4f"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.279/wakelock_plus.xcframework.zip",
            checksum: "55326b4b6041b4ea706fbe2e2b8cc9a174a34d08891333fe76a5aa627f698e06"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.25-test.279/ZIPFoundation.xcframework.zip",
            checksum: "6e685c1dcb6fa5aee466a7fa8e7b10776b5fb496669b2fd4070d78df90c4f7af"
        )
    ]
)
