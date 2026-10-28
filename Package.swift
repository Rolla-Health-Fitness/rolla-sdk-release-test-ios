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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.59-test.370/App.xcframework.zip",
            checksum: "fb673c4e5749331b971aa289ed1d3c331b022b026f8afff56ca1b50178d45948"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.59-test.370/Flutter.xcframework.zip",
            checksum: "7d9624d583c657243a033cd6a720160b7218e87d5ae5b21054488babfc45e825"
        )
,
        // Flutter plugin: camera_avfoundation
        .binaryTarget(
            name: "camera_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.59-test.370/camera_avfoundation.xcframework.zip",
            checksum: "73468125be6cd5c199354a4c48814023729fab302cc2deddc7d265527a4947d2"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.59-test.370/connectivity_plus.xcframework.zip",
            checksum: "40ebf970d5f94604458bbdc0d2eefebbcd883c8fe387000ecb5c2cd036ebb24b"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.59-test.370/device_info_plus.xcframework.zip",
            checksum: "31d3ba38b98ab7b3cc43abe164e5e4e19cb6554036860cddfd34582836435f5c"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.59-test.370/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "1bf0cd6f9afe61c91cfd347b52084e92e6700a525c90d1df0354d994aedd615d"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.59-test.370/flutter_local_notifications.xcframework.zip",
            checksum: "6f3c9954889ecbc74a30a56db8d92b08c1885bb7cb74871ee23d4db1bfb38312"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.59-test.370/flutter_native_timezone_latest.xcframework.zip",
            checksum: "5863453d9622b70ebfa343bb551a1cacc992aeffe141fd60e53720ae54ef1a6d"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.59-test.370/flutter_secure_storage.xcframework.zip",
            checksum: "8136aebee3d7435b3750cb7bcb100999553193b3ff2eb2c4ac1e721c1dccf0f7"
        )
,
        // Flutter plugin: flutter_web_auth_2
        .binaryTarget(
            name: "flutter_web_auth_2",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.59-test.370/flutter_web_auth_2.xcframework.zip",
            checksum: "e8a823e68e28cc1218609bde4f0925340d6f5eb997e61b3b5ef9920315c0620e"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.59-test.370/geolocator_apple.xcframework.zip",
            checksum: "198ba38db93cb2402a1d72e09da0511f4bbbe21c7739337ac9c9d3ce7b490191"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.59-test.370/health.xcframework.zip",
            checksum: "36a7534535ac0bf626cc0b5543573a8238e5a4171a510a4f739de90777537c9e"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.59-test.370/image_cropper.xcframework.zip",
            checksum: "b31f732ebddc148deebc56c737f4dc2186206a1692a097da5707149a020d41bd"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.59-test.370/image_picker_ios.xcframework.zip",
            checksum: "623a8523b767995a2189c1439cf5523f3896b395f325ed81611e0eefab362561"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.59-test.370/mapbox_maps_flutter.xcframework.zip",
            checksum: "18c2f5ba40b0c2e20fafdcb8d9d26d826f8b34ebf3775988abadf5fb9b29b938"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.59-test.370/MapboxCommon.xcframework.zip",
            checksum: "bc301058f95aeda863c96ad92e4d2eaf9b17cf96dbbc9e7f247aeb49e916b44f"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.59-test.370/MapboxCoreMaps.xcframework.zip",
            checksum: "7f71aedcd4dc1f80e872b31178cc4ab4f7c5f3f098ca6ede70ab9357e341e5b2"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.59-test.370/MapboxMaps.xcframework.zip",
            checksum: "719dcd2fba084ef8c87e22bd082b5a403b0acb4da031ca3dc759d0fbb9b63325"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.59-test.370/NordicDFU.xcframework.zip",
            checksum: "67fccea39b176c96fb72a4c810f66b031cc673a8b52350f8059aec9d2ffddac5"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.59-test.370/package_info_plus.xcframework.zip",
            checksum: "2bfd5bb4c2665ebc27a082cfefc88f967d493d86af670c5be8e77c7d42ece2d3"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.59-test.370/path_provider_foundation.xcframework.zip",
            checksum: "d076a139967ed08605ca4bf55b6786b766a196509d9a8f632a0d56b683430260"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.59-test.370/permission_handler_apple.xcframework.zip",
            checksum: "07db3709fc159da70ec19b1539b9ebe4356e06615e32297e4a0d3db6c8919b96"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.59-test.370/share_plus.xcframework.zip",
            checksum: "90243a6e347dc727db7decfd198d0859ca586405fc5cb374a84c2b57b46b3218"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.59-test.370/shared_preferences_foundation.xcframework.zip",
            checksum: "f66a907b21a21eacd03fa3f4c41dc571e593e3df2bad278ecc5f1c3732b799f6"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.59-test.370/sqflite_darwin.xcframework.zip",
            checksum: "53957192d0abb354e7b85f5e537ed9e04fea21a9ab9d7af2d85b4e2ecdc08daf"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.59-test.370/TOCropViewController.xcframework.zip",
            checksum: "4fb1b46e46bb5ba2150f538242051127f92afbb8c2e78d181eeaefcb9a4d252d"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.59-test.370/Turf.xcframework.zip",
            checksum: "263347826f19fc46a23304400d85ab2ce5203e8990d204e9edee9c24fff3d6a0"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.59-test.370/url_launcher_ios.xcframework.zip",
            checksum: "b2f548dcfc456d39358ba196665e317e7d9c64db3caf356c2d0c6ea4ec6d7779"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.59-test.370/video_player_avfoundation.xcframework.zip",
            checksum: "e8834b652f186801732e1d93f350a5b5f4bace5e458d5f5065f399a4e5c73d31"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.59-test.370/wakelock_plus.xcframework.zip",
            checksum: "e58d127383348f1edec8ceb6e843576ffb4fb5bc6e06c23541fab16e2d80fa58"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.59-test.370/ZIPFoundation.xcframework.zip",
            checksum: "cfa2e7c6331d202ff5d2ec5cea552c683ec3ade03ac6db2d1208a8b5cbc0c668"
        )
    ]
)
