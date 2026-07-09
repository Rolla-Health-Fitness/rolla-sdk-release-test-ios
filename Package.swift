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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.288/App.xcframework.zip",
            checksum: "da4597d3df4f877288b8f197b7f83145919e3dfe0ab29f97939b2a10f0d063f0"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.288/Flutter.xcframework.zip",
            checksum: "a195a8891c1c5bd4596c55eac5d6429e8ae2b6fbaef3bef459ba25d0ff87a367"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.288/connectivity_plus.xcframework.zip",
            checksum: "19d2a09c72fca372a6b8fd767abbba594f4135905bc948cf6412c641dd2e3ebc"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.288/device_info_plus.xcframework.zip",
            checksum: "c4403abeb10ae723e4e56c6be6456bc23ad8fb3d9bceb55567962bafd311e5af"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.288/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "13466e894ebdf31fb446ffe17f0cb20983d6e2487b9f9adaf380693dfb0f1f56"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.288/flutter_local_notifications.xcframework.zip",
            checksum: "2f5044f23d3a3b3b85a2743d957aa9f81bea4a15c7fcf23c9b96da02e5ebbf32"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.288/flutter_native_timezone_latest.xcframework.zip",
            checksum: "f4b1f25f566ed2f42ee58515d3858fca89912b3014b748f8b4cd38510e163202"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.288/flutter_secure_storage.xcframework.zip",
            checksum: "4476ab7fb934624e4254d56f9313fb687b0dabd8a3481d2b890af95c86d0e268"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.288/geolocator_apple.xcframework.zip",
            checksum: "830fd33fc3403587a2f4327af1449c2bbd1aecad42022c8505204be95e8c6aa9"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.288/health.xcframework.zip",
            checksum: "eec97d7356076d4a6a183d124b4ee35e9525b6fb6ca948f53948c6a6101abd75"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.288/image_cropper.xcframework.zip",
            checksum: "0eeab9509a85fbc854751c2dd94786ec66f90b290554229ace005f3944cf8f6a"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.288/image_picker_ios.xcframework.zip",
            checksum: "1d456aeb3ba67feadbf8bd33c44c1bf26ba51a92f4e34f3315cfdf02934cb47c"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.288/mapbox_maps_flutter.xcframework.zip",
            checksum: "e714c2acb78245f154dd64c7bf447abfae5a0ef3fc1cb12ab6ac0e7fbabaec6a"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.288/MapboxCommon.xcframework.zip",
            checksum: "76ff2e703fbda12a00af3455d52f4cf8b317997834613bb05c2735ca30f45557"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.288/MapboxCoreMaps.xcframework.zip",
            checksum: "77947268c70a689a5645eb67ac99331a00dbcfcd341c100d587d48336978bac3"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.288/MapboxMaps.xcframework.zip",
            checksum: "59fc58c9748278ae1d7f6c7adc7880c1d10514c843e877dea703c5d6e3d4a859"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.288/NordicDFU.xcframework.zip",
            checksum: "e6f8d22966d707ca7142412a5951a95c871ca38e57f0f1ae8b2f366c16749e92"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.288/package_info_plus.xcframework.zip",
            checksum: "981e3d2681f0cbb8272f7e8c05e316d040247a47d9af1d7f95b4244d28d9d7e7"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.288/path_provider_foundation.xcframework.zip",
            checksum: "1f4d6ab9be1add7a6c0902d5520055d1aadc96517bd15ce861dcd3087ccb966a"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.288/permission_handler_apple.xcframework.zip",
            checksum: "279450f7e43cfb21981f6ef9b3e9b42e4c91c90b71acff5c86dc1a81bad9c9e6"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.288/share_plus.xcframework.zip",
            checksum: "599eb55109a194259015f62f49ae370fd7b21b3d6152d5ea6ea5a10519884a80"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.288/shared_preferences_foundation.xcframework.zip",
            checksum: "4c6d6b78e1bbce3497127843883f80592d6dbda853e8a6aec3519fd5f672498f"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.288/sqflite_darwin.xcframework.zip",
            checksum: "be30ee3749de887308d0b78af7dadb0f5b2cfb79a705adefc17cb7c955489767"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.288/TOCropViewController.xcframework.zip",
            checksum: "82381a5995fd00f38dee4f50d6489cc82d096fb26b7f41c116d8945a56fa7fc4"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.288/Turf.xcframework.zip",
            checksum: "a403de7110fb04ba53eec08e7179405c9ba4119ec2c5c7a62f04cf3790925962"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.288/url_launcher_ios.xcframework.zip",
            checksum: "ab22b6ca6c456149aec86d479b73eb6818da88f5fe268e45c2ce4fbfafe9606b"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.288/video_player_avfoundation.xcframework.zip",
            checksum: "31407fd15a216783dc4a40882d549cb343e9dba6174c89d5f676985f45797dd4"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.288/wakelock_plus.xcframework.zip",
            checksum: "a2c7207e82555f9861922a956a6c17ac61e9e0f2ad5c69bd0cedf56d1a71a41f"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.19-test.288/ZIPFoundation.xcframework.zip",
            checksum: "54c16b18b0f46cf8035f08c4cbdfb64768d692271244d4d408955dff7a42320d"
        )
    ]
)
