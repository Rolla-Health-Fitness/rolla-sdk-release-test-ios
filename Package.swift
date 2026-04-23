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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/App.xcframework.zip",
            checksum: "eaf1dc855ac312fab1900c679dd3283d65240b63de677411878ab0db3e419d37"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/Flutter.xcframework.zip",
            checksum: "762437e23ae379e8af0d12a80209e823b1aa5d96b6efcfe2ae23071b699294a9"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/apple_health.xcframework.zip",
            checksum: "3380bc877570f5017164d293d3af7de0e3110c58f16aa51fe138fb3205040be5"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/connectivity_plus.xcframework.zip",
            checksum: "63460914292ce4005d3cf56e0f4f9d939a0978c1bb3a219c2032763948b6c88e"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/device_info_plus.xcframework.zip",
            checksum: "18650a9cb7944332008707b9f4fe78c43ca6b6a11cd20e13e9b4e2c7c28ec6fa"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "3c0ff8665a8ebc551a1f306d63cf97a5ebdaf59f807bc187a58a119451ce8750"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/flutter_local_notifications.xcframework.zip",
            checksum: "3f90ffffb4c480adc1ebe38d639abc350e5e4f88e7055021727457e6f2db501d"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/flutter_native_timezone_latest.xcframework.zip",
            checksum: "91562b9fcdfa454c67d0ec1a3e99269c84c15fc33013e4be22836df82cdf96ac"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/flutter_secure_storage.xcframework.zip",
            checksum: "bf028a87bb742ed47db0b047eed0b362c74e17b5683def0d48259e8ec4450dd2"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/geolocator_apple.xcframework.zip",
            checksum: "dae866d407b6656a3e03297642c99bcf44e4a6dee210f8c7185dda297e237f94"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/image_cropper.xcframework.zip",
            checksum: "0647c99f28099bde1c42f4de203715c0ee8b3f521ed35de79e06df5c8acc17a7"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/image_picker_ios.xcframework.zip",
            checksum: "fa54a0b3634bfb0ace809194ba0dbc46a8a07f3ab402e6c4494765d11fc037da"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/mapbox_maps_flutter.xcframework.zip",
            checksum: "92781c8a003a2679739709d8bad4500f9c9dceb2874c0d1826d4137c31bc2e3d"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/MapboxCommon.xcframework.zip",
            checksum: "30f56e15bc71a8652baa6e5762badf80f70695aab80ec1762dc47c30559f837d"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/MapboxCoreMaps.xcframework.zip",
            checksum: "5ee7dcbf7f6917c97fcffa0ca76c9a140f0c27e82165bb977098add4ae130468"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/MapboxMaps.xcframework.zip",
            checksum: "db74d61817f122e67b913c898ad361352d2434148c53e41b3ec80f5f11c2641d"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/NordicDFU.xcframework.zip",
            checksum: "fdd97ea7230f293806f155f9d84a40f25a76dabc844ff7cda74a78068e604281"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/package_info_plus.xcframework.zip",
            checksum: "8d080ecef13bd1e83a3ffaf9df3e1bee590efb05f7b3939d49c278942f866a97"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/path_provider_foundation.xcframework.zip",
            checksum: "d9396aa897a8628a7542ca677fd64197cde2ba6cb715976b0a6d7b52901cacfa"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/permission_handler_apple.xcframework.zip",
            checksum: "684c6a4e9664d0b33376e74b3ec24e14e570e2888faedf6eac1b7795d828b028"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/share_plus.xcframework.zip",
            checksum: "7344d30158224d4ddad1144768de7751dc2d3eb468f72cf2d1d424ba4e97e3a0"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/shared_preferences_foundation.xcframework.zip",
            checksum: "4c6165c50d514a7dbb382dc68274a9a5f732ace868ef1edf97c0602f5479e9f4"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/sqflite_darwin.xcframework.zip",
            checksum: "faecaf306e267d64519a71c75ad0c66a06be36b077aaa1cd685a07f0fb212360"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/TOCropViewController.xcframework.zip",
            checksum: "cd29ad9c734c126e7f47fd093fe2ebc46157e341319b2f049b20405159df2c6b"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/Turf.xcframework.zip",
            checksum: "e8f6f20a9d477653de269571577645e1b71b793b8f9dd52eb6967c7380399e65"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/url_launcher_ios.xcframework.zip",
            checksum: "33677ffe2acb60a055e08ac99d05ab0130e254845f2e638f0f6b4747d271b34b"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/video_player_avfoundation.xcframework.zip",
            checksum: "865483ee11dd49dd662a8dab24a2543baffb85510d1001a93584bc13a58282fd"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/wakelock_plus.xcframework.zip",
            checksum: "62314fedc86054841594c3af80bc5127a30dd6d925a585da8c1e9d4c7ca1db52"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.2-test/ZIPFoundation.xcframework.zip",
            checksum: "d80dd44919713337c4d2d9088bd276abf1462bf2592fb09afb5b45ea5b392c8f"
        )
    ]
)
