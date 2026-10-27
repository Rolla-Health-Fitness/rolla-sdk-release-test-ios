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
            dependencies: ["Flutter", "camera_avfoundation", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "flutter_web_auth_2", "geolocator_apple", "health", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "FlutterPluginRegistrant",
            publicHeadersPath: "."
        ),

        // Swift wrapper API
        .target(
            name: "RollaSDK",
            dependencies: ["FlutterPluginRegistrant", "App", "Flutter", "camera_avfoundation", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "flutter_web_auth_2", "geolocator_apple", "health", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "Sources"
        ),

        // Flutter module (Dart code compiled to native)
        .binaryTarget(
            name: "App",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.58-test.369/App.xcframework.zip",
            checksum: "aba05a3632a4e7cf9344bcbeebdd13141cfeee67c8d8e141c265246a72ecd476"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.58-test.369/Flutter.xcframework.zip",
            checksum: "1f8ce10f6a97be141504d74a8d94ce7d5cdb974c2eef28adf45b2d17921eea8e"
        )
,
        // Flutter plugin: camera_avfoundation
        .binaryTarget(
            name: "camera_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.58-test.369/camera_avfoundation.xcframework.zip",
            checksum: "b59b3f2230b836301ad9e3a6c30b4d05e7fab8906015da62bb89f3fc87ffaecb"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.58-test.369/connectivity_plus.xcframework.zip",
            checksum: "45a0691349e5d864b249d6c763709abd48d7b329c3c66696bb7f8dad0c43a4ed"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.58-test.369/device_info_plus.xcframework.zip",
            checksum: "b7efdbdc712589c442d03edab45b832a0b114994b45a2eaa4925cf4422850b32"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.58-test.369/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "60bcfff880c67e617c3a2215ee711e4472ee90230f379dab3f6b4a46249a5081"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.58-test.369/flutter_local_notifications.xcframework.zip",
            checksum: "d09c35de3f891a7cec269c51ca6981ce24db52220b94cd50bfa99efaa9511792"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.58-test.369/flutter_native_timezone_latest.xcframework.zip",
            checksum: "f2530e205cecb5284850b167ea5a12c9d5e65f6b3313cdb24e94de57baafe324"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.58-test.369/flutter_secure_storage.xcframework.zip",
            checksum: "43401f1d085f8e18f07802a427ea49a86cedb6828495b4573ab4b00631c2938e"
        )
,
        // Flutter plugin: flutter_web_auth_2
        .binaryTarget(
            name: "flutter_web_auth_2",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.58-test.369/flutter_web_auth_2.xcframework.zip",
            checksum: "5a851ecfcda2b82c18b3246606539ce9cd4bb4529cfcd6951ceb1167308ff94f"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.58-test.369/geolocator_apple.xcframework.zip",
            checksum: "a59b7d1589ebcf3b9b5970fd01758abac4a9f9440b5ab6658b15b31f1e1ac4a4"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.58-test.369/health.xcframework.zip",
            checksum: "79fbf08bf1c3f798d25cde25b75df7cebdda1a96d82463d36755c84718c78829"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.58-test.369/image_cropper.xcframework.zip",
            checksum: "77176d0456660c35cd1c811864785a61c2684b67147b3d640429e0a32b4284cf"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.58-test.369/image_picker_ios.xcframework.zip",
            checksum: "a68302eabaa9ceb1abb1c3ab2b28f45b9f2f2da25b52ac6b61ceaed21e320f13"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.58-test.369/mapbox_maps_flutter.xcframework.zip",
            checksum: "36ff858be8b0eeeec2a30daba1659783bee29260cb7d3905fac14b0d518e08fa"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.58-test.369/MapboxCommon.xcframework.zip",
            checksum: "915c00bec64c4b6532161c2b19be17e0d5ab714da4db1e04c7da0cd6ca4ccbf0"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.58-test.369/MapboxCoreMaps.xcframework.zip",
            checksum: "751469c6e6b592a5dfc51791c1ee16c72ee583f6bcd99b3eee2f1098dd85d05e"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.58-test.369/MapboxMaps.xcframework.zip",
            checksum: "21a326264873f04a4f76fab3d27a3b11966805efb41b3c729ab785ab25746c80"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.58-test.369/NordicDFU.xcframework.zip",
            checksum: "521c955f9bdf72a515a43ae9de7ededdb60309a1d87e99c200461f03853a9688"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.58-test.369/package_info_plus.xcframework.zip",
            checksum: "7406a48a708f16ac6770985b67334e7f979f07400ba654df4185b05828932990"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.58-test.369/path_provider_foundation.xcframework.zip",
            checksum: "148f8f8cdcfa8834ae839a2d1cf1b3c636ce1a947eff231c9906c05b85eb8f7e"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.58-test.369/permission_handler_apple.xcframework.zip",
            checksum: "9634b81878b876d50f885317cd205084eb1b7130caf0bdbc1d374dc5699dec50"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.58-test.369/share_plus.xcframework.zip",
            checksum: "5a285c2604da5df1dc8a347278dc8573bc9f370921ced6330f4d2c52aa1d350e"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.58-test.369/shared_preferences_foundation.xcframework.zip",
            checksum: "1a0e5b6bcf633342ee840658e29b494d1f44cc137e9dfcc31e4d4fe6ab816c21"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.58-test.369/sqflite_darwin.xcframework.zip",
            checksum: "703102b9369226e40ddbba367f7844fd97c8f9733eb47d036b9607752a059947"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.58-test.369/TOCropViewController.xcframework.zip",
            checksum: "6677fdf41843d042c160724c52933c2ec6c7a42d3740487cf304116acc627ddb"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.58-test.369/Turf.xcframework.zip",
            checksum: "044645dfd28dcdfed1bb80bca040784983febf1ca95cf8e9c587ec3ce7714f63"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.58-test.369/url_launcher_ios.xcframework.zip",
            checksum: "9bce88ec5e5abc47a84166595965f2825a3f3864bd11fb3c807ccb83901b538c"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.58-test.369/video_player_avfoundation.xcframework.zip",
            checksum: "129b1ae0b0391d74e15815f55210851e7777689bb49699d8eb8afdedc3c162a4"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.58-test.369/wakelock_plus.xcframework.zip",
            checksum: "5eb24f41a69a8b958253b87490e7a54c72d0cf95f2d778dbd9cfd4e40aac3b03"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.58-test.369/ZIPFoundation.xcframework.zip",
            checksum: "634adc2c850831c3df186dabb70dc83760df4e3b359c24b54862c9b206425949"
        )
    ]
)
