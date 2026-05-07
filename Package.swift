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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.230.1/App.xcframework.zip",
            checksum: "590d6e56e2a9f2879cac047c292aca308cae628fc25db50c86407e73537527ba"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.230.1/Flutter.xcframework.zip",
            checksum: "e4e46f0480cc40366dc967a10c152431fc1c38a8b07acc5bbcc0a2210ff57ad2"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.230.1/apple_health.xcframework.zip",
            checksum: "f72d2f0b8566bd658388f818a35af3300ec32bc7e28ed1f051f03b75bc51042d"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.230.1/connectivity_plus.xcframework.zip",
            checksum: "9570bd4b99d1dc296fadc6eb6f9ac365d2a4345f285c66fcd0bb9c8b9678fc1e"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.230.1/device_info_plus.xcframework.zip",
            checksum: "51072caa14d24b54c516eb472a33059fbaa98600a4738489f203fc77976cedd8"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.230.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "63f8399912a471331d1baf2852f59b5e5fa50db8ec48617bb646513b57c22b8a"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.230.1/flutter_local_notifications.xcframework.zip",
            checksum: "397b4d8b2168a26d2d18cc780bad3bead8d4e3c51ab0e255e29fd50aea5cfd18"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.230.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "cdaf6125efb435bffde220a89d18392e29c39304e2d8e1f82224f74f819201c7"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.230.1/flutter_secure_storage.xcframework.zip",
            checksum: "9b4e61c6203a00b4e78a121206415caf0e57d47b4b1b63d1986f78209a611f6c"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.230.1/geolocator_apple.xcframework.zip",
            checksum: "0ba734a7b66b96d420e1f81fe5269fa5f44421808fc21298cf60b9056ae89813"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.230.1/health.xcframework.zip",
            checksum: "b2269a73992b1b858bfd2a90c7f108bc413b37f30f5b6a731fb86a0b2e20a27d"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.230.1/image_cropper.xcframework.zip",
            checksum: "19f3dbad3aa48cf343aad5fe977931864e72beef95fb5254bfcfc58c25282984"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.230.1/image_picker_ios.xcframework.zip",
            checksum: "19bb72e52c8c9d88239bbb53f52171789c95ec66a83ac12d44ac1fd7edfec835"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.230.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "a30db482512df4a458f8c5a60834c377e7adca8c65a60ca4bfa11300cbe432b2"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.230.1/MapboxCommon.xcframework.zip",
            checksum: "88e614c92e99099805b6414673ad27702bab42b4068b047542ff73d15cc9fe05"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.230.1/MapboxCoreMaps.xcframework.zip",
            checksum: "903402a2204a8826fc0a83fee0e008be1b6811ef3d45c006517a3b139741c2f9"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.230.1/MapboxMaps.xcframework.zip",
            checksum: "7fa621d394092d93a942cc4213b36815fb5a6d3988e42dcfa4cc303c18f4f19a"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.230.1/NordicDFU.xcframework.zip",
            checksum: "afde518de6ee71253c126a552a3c0d0ca52220541c4583b70ee6352e361c2d0d"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.230.1/package_info_plus.xcframework.zip",
            checksum: "535f88aa2a2553fb6d362b5a6308cabc8c9bce4041b669b681197518f464e00c"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.230.1/path_provider_foundation.xcframework.zip",
            checksum: "fa19a2ceebb4c3aaa016746c1ec27adb600f6f3b330bca6f2090725ac892eb87"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.230.1/permission_handler_apple.xcframework.zip",
            checksum: "d86f27a1218d5368eef5e5806f800d2e0c7895ffeeea2b76198ad53e29888d8e"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.230.1/share_plus.xcframework.zip",
            checksum: "b85ed57b863dc06d1f865315eefbbfacbaf4be066ae34e19737ec3761a52f3fe"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.230.1/shared_preferences_foundation.xcframework.zip",
            checksum: "711f573de25f51d3a22bbd190926daebb79ccc7e44c241bf402268350a959ee7"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.230.1/sqflite_darwin.xcframework.zip",
            checksum: "e8409ee55c023680a3dd9d188018c98339ad7470c593934e6f0e6b8c6969a553"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.230.1/TOCropViewController.xcframework.zip",
            checksum: "2d7c7120542b617d5c24d453a66385d9d1820c6e99d919ab59979b7c739e5df6"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.230.1/Turf.xcframework.zip",
            checksum: "8e4b36f8db785695048b9533b3a18d495b94651d8951ba2c36378cd043438122"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.230.1/url_launcher_ios.xcframework.zip",
            checksum: "b7cdc02e9f1d503df76af21ca50bddb62e903eb99dd8f8777664f4a3072b7d1a"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.230.1/video_player_avfoundation.xcframework.zip",
            checksum: "748356f8411f6451dce80a69b75ef62bd8f010b6dd3a2e4d4aedc95770a3874a"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.230.1/wakelock_plus.xcframework.zip",
            checksum: "beb64f585330f6dcef761421e195cd2da4374aaf526853743a68c734f6966a38"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.5-test.230.1/ZIPFoundation.xcframework.zip",
            checksum: "158dd2adbb13072c7dfb7cecb41ca1ce6de48824c06a2b9f491702bd56f226cc"
        )
    ]
)
