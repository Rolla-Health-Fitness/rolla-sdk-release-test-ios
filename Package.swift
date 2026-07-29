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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.321/App.xcframework.zip",
            checksum: "76b98ee601f8bfc5ec27b78a725b09d5f80ec58ab065e35058f4134535b204d1"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.321/Flutter.xcframework.zip",
            checksum: "e37be9ec4a9ebb5c5bb33d58bd0cff521483c0246f01eea0177570e76a386fbf"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.321/connectivity_plus.xcframework.zip",
            checksum: "26f2ac77872892776e10f7651eb0920623d71a668739f712d1fb4844f1d2abc0"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.321/device_info_plus.xcframework.zip",
            checksum: "fe2bd73283c742f07810a39fbaa18d683165527a3c313b2befe44d8a8cf0b2b7"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.321/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "48a9fe9806825f17a9f6af9b401439bdfa70fd961a7814520ddc9422bfdd2188"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.321/flutter_local_notifications.xcframework.zip",
            checksum: "6ca3dd1544b69d2a8af08f878e9f24e72ea537bf6b10b1780b25d21948bf3872"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.321/flutter_native_timezone_latest.xcframework.zip",
            checksum: "a22371b3e196bc4abf110e09c9165375cac469fcdab188bd43ebcdad315fdc48"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.321/flutter_secure_storage.xcframework.zip",
            checksum: "9a2d0d6db65c31ed8486a656e787351722aeb38ac84a6eae2fcf77d1c132c05e"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.321/geolocator_apple.xcframework.zip",
            checksum: "ceae76d1ba781a092e67b0b16568434fb299891332cebf8353e725a3d8ec929a"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.321/health.xcframework.zip",
            checksum: "c8dc917116ff7322dc85ee46263a4cd4f460835d7d9602809a285de6e2cd18cc"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.321/image_cropper.xcframework.zip",
            checksum: "579863158695be9292e9145b46b05a735b79479482a5703d6559b175bfc70e0f"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.321/image_picker_ios.xcframework.zip",
            checksum: "8c5cb8bc5caf3a06f9a667b6d6faca9cabbf018b7b1200484278e1ed5231a34b"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.321/mapbox_maps_flutter.xcframework.zip",
            checksum: "04d02d6bc4ec4bfa17e89672a84850cc5161fb1534c93861a67faef8e4d7c441"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.321/MapboxCommon.xcframework.zip",
            checksum: "1199c1958afc208de4836c07d7460264feb591be13dc2715dc8777870df4ad77"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.321/MapboxCoreMaps.xcframework.zip",
            checksum: "2d23470f602ad7c2f508395d7918533d0c4c23de5b5307195e98c4a23b0b62df"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.321/MapboxMaps.xcframework.zip",
            checksum: "02b40818d47bc4aba78c081c01edfa893aa8946523f13104b00fe0c3fb691488"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.321/NordicDFU.xcframework.zip",
            checksum: "4d189744a161fda794715a89fa7db041d00d128d1bd876e88acff4b0605546bd"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.321/package_info_plus.xcframework.zip",
            checksum: "57e2d3b6a64bf46a5c03ac8a601c413e2e991767ab161893ae354570a8f16533"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.321/path_provider_foundation.xcframework.zip",
            checksum: "d7d6b9ae24b5975e302fd2e6c9d5df77a5c21cb4f0d34f7fdefda9f0c2f86fb2"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.321/permission_handler_apple.xcframework.zip",
            checksum: "12faa14ea55030309a8ba258979de90ccfeda1fe7fa0513c81b9af49cbe0307d"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.321/share_plus.xcframework.zip",
            checksum: "b1ee0837bdc3ea1644f03c52bd2009c6de5d521436231c865b60a0e363e16e73"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.321/shared_preferences_foundation.xcframework.zip",
            checksum: "fb60d3bc9e40eec80accc54132d1a75bf3152717665762983e615babe6b3a539"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.321/sqflite_darwin.xcframework.zip",
            checksum: "a2d67d218392734e1827f1e5551516b5b5e8f46a0c671a5219bcfee95a99d479"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.321/TOCropViewController.xcframework.zip",
            checksum: "eb876a6aa771965e9a1aaa026d8a3a82d1ae135d4c48a7e50827335b98602ba7"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.321/Turf.xcframework.zip",
            checksum: "45461e710142176865a632e20fc43e07b71abd0b8abd7fa53cfd29481685d7c3"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.321/url_launcher_ios.xcframework.zip",
            checksum: "f8afc98112fb715e47df441061ffbb541990d6d0eb22d7337294caa75587cca1"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.321/video_player_avfoundation.xcframework.zip",
            checksum: "46fd3b1e699460e3d45a0ea1bf5097a82c11a8d36d4c6164869a5766d94538b9"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.321/wakelock_plus.xcframework.zip",
            checksum: "89d65ab791b409298779662fb59ebcb7f5b3f91753667e1fea15a9dc27e35ece"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.20-test.321/ZIPFoundation.xcframework.zip",
            checksum: "8dfe63e42d3e53d8cd007f42cdb803d2889a46413c1e3fee84ba5c5d8d67ba59"
        )
    ]
)
