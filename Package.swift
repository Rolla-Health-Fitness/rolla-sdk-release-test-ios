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
        .iOS(.v15)
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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.2.1-test.374/App.xcframework.zip",
            checksum: "50ad0bb0f5d179d96f5014c9f178ba2ef1bf9b05486d8da26c8f2c6f02e574ee"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.2.1-test.374/Flutter.xcframework.zip",
            checksum: "899e1ca2efe7274f414ba7c2d9bbc7821152a4c468aea2c2240d3d375273dca9"
        )
,
        // Flutter plugin: camera_avfoundation
        .binaryTarget(
            name: "camera_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.2.1-test.374/camera_avfoundation.xcframework.zip",
            checksum: "f17748f341948866eb13d7a367711e4d56b07194fb8ac44e2d0671f4e45a0298"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.2.1-test.374/connectivity_plus.xcframework.zip",
            checksum: "682e126ecd642295bc6196a5dd3b529fb187b37581e31c89d2918ee54192d4ae"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.2.1-test.374/device_info_plus.xcframework.zip",
            checksum: "88e2b1631a195e5351a830a25a116db911ea120c13bdbd6930312957989440ad"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.2.1-test.374/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "d082ec76aae677f05ef3773177ee916c566d68662916f6d9275b6e0fc95b8ce9"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.2.1-test.374/flutter_local_notifications.xcframework.zip",
            checksum: "e9432fcc2889f6d7edae2f904e19b9b8bc5c1c93992f81b512051d992740e750"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.2.1-test.374/flutter_native_timezone_latest.xcframework.zip",
            checksum: "73d51e7b0bf91ba55b96da6f1519ff2dd59c1838a2b81d6aa273722fa49067ff"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.2.1-test.374/flutter_secure_storage.xcframework.zip",
            checksum: "1639234f470980a2d5b0b0928330b395e29c49a2853cb43a73851dc6285cd842"
        )
,
        // Flutter plugin: flutter_web_auth_2
        .binaryTarget(
            name: "flutter_web_auth_2",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.2.1-test.374/flutter_web_auth_2.xcframework.zip",
            checksum: "0c3b60618a949f476184fe4028ed37e73f11b6f7b2485e59842e3918d636e2f9"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.2.1-test.374/geolocator_apple.xcframework.zip",
            checksum: "f3dbb2a7c39e5bce29c75817c504a9bf15f1c7c9a5b617e56088bc174df2f08c"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.2.1-test.374/health.xcframework.zip",
            checksum: "5e8d0f10faeb62e6b1b97112a41475b758905728d994ac511a00211ced81d9c3"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.2.1-test.374/image_cropper.xcframework.zip",
            checksum: "38c90675f9b141a7a78fc004bab3305843319b457fe2533998318c162f0bc241"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.2.1-test.374/image_picker_ios.xcframework.zip",
            checksum: "2222e4665354cde3821ec9ce8c600bd5020aa663b52c96b4f33b57fc5ba36b7b"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.2.1-test.374/mapbox_maps_flutter.xcframework.zip",
            checksum: "04c0f866044f18183eaac1ae9cfe7dfe29a051029ed3b212c7a4ae9e655cc33a"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.2.1-test.374/MapboxCommon.xcframework.zip",
            checksum: "8c8ae79313864028f3f2603604bcb859fca61ef6f6f60e396defc99dc00cc71f"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.2.1-test.374/MapboxCoreMaps.xcframework.zip",
            checksum: "d5065e6c7e2401e2fbc9736efe99bbaf0310fab96df6f455976c5648b60fc43c"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.2.1-test.374/MapboxMaps.xcframework.zip",
            checksum: "e108478000b20631d9ec5fb42a4bceb5ffd9836dbebb38e72ee14290f40d99b9"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.2.1-test.374/NordicDFU.xcframework.zip",
            checksum: "42ba81792a030d93f93dd4ddc33ffc06e30515d032de952325edcbfd9ec337bb"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.2.1-test.374/package_info_plus.xcframework.zip",
            checksum: "908de057ce93d5726da699fc3c61ce2b729118333c0c034a1bd82191a7c5d83d"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.2.1-test.374/path_provider_foundation.xcframework.zip",
            checksum: "ab6eea51fe58eeed019eae598294a44f7338fda0e06b1d1751ccebd7d06b3982"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.2.1-test.374/permission_handler_apple.xcframework.zip",
            checksum: "244f59d05f5969227effa4975b0888e66c98aec0512b6f390f0b1bb1f05ecc0f"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.2.1-test.374/share_plus.xcframework.zip",
            checksum: "f475f35dcbbd50ac637c62ff9e9b7a71dcc5fc599861eb086e3aa42e76123f33"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.2.1-test.374/shared_preferences_foundation.xcframework.zip",
            checksum: "c6996b930673ff60889d645cae0ca3f6e080183d9ba097ef9a1f840382243c06"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.2.1-test.374/sqflite_darwin.xcframework.zip",
            checksum: "a78c0d43df104fddd6c140e353473424d2b196e95bc44dbbef3ed2f20701e4ff"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.2.1-test.374/TOCropViewController.xcframework.zip",
            checksum: "bce7bf86a0f9536b13b3a34c6776f45415461ed779fb81134e4b1efc0a692a4b"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.2.1-test.374/Turf.xcframework.zip",
            checksum: "8adffa94f498a5979bcd748e0d21f694c73886d2d83148340a73d55a625a8326"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.2.1-test.374/url_launcher_ios.xcframework.zip",
            checksum: "ad62782a56ad451683204b5a7c405a6eafbb030e391305bf563782ecee95d2eb"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.2.1-test.374/video_player_avfoundation.xcframework.zip",
            checksum: "b4fb62a8e74c6510f627595f5df4d425dd2a07aaf8755250d70e00d59b08e9c0"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.2.1-test.374/wakelock_plus.xcframework.zip",
            checksum: "62580fee5b067c885a69718abcc31590d3dade9b883ee5e7204df9a5ed9fa9e1"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.2.1-test.374/ZIPFoundation.xcframework.zip",
            checksum: "30cbfbe459a162a25eeec44df15a404f1cb2323fdd52f7aaeefc7087327d3712"
        )
    ]
)
