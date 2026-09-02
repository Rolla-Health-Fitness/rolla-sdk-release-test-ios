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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.39-test.349/App.xcframework.zip",
            checksum: "81abb9459795fd92099b1d0176e7051958b37b2a306b7405effcd9f4e2d10598"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.39-test.349/Flutter.xcframework.zip",
            checksum: "161f5008f5e5b5bc69c26888ccb5f7874d691f77e3c3de996f6462b49cba4b9e"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.39-test.349/connectivity_plus.xcframework.zip",
            checksum: "3461084268be2693599fdb069cdcf85309305eeb9ed4ea9376758a03898e373f"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.39-test.349/device_info_plus.xcframework.zip",
            checksum: "d699e17133cd5068813132f2fa004a1734c6587872b1c6210412e0356aa90161"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.39-test.349/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "dfc55d0e716d49ad2dca3d244384fff9237d355554c9be72258131c7eca67aa4"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.39-test.349/flutter_local_notifications.xcframework.zip",
            checksum: "87ef02aa01d5c6d2db1f322218dfb4b25765527121b6ceceac2343e4ea4b467d"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.39-test.349/flutter_native_timezone_latest.xcframework.zip",
            checksum: "c8efa2ca25579dccd99ec1f8fd258a6846146f3f2fc23dcd9907a5c7e9dcd66f"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.39-test.349/flutter_secure_storage.xcframework.zip",
            checksum: "b1cb883321da2589928ee92fe8ed81610b85f05523d06430565d7269dce78039"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.39-test.349/geolocator_apple.xcframework.zip",
            checksum: "7a0f33a93dc50d20372af3a48c501687a2fb4d9ca77f1dda914f89c0ffde40b1"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.39-test.349/health.xcframework.zip",
            checksum: "fe29569bf9823389ec05a57ebcb0cd0879467179c6a719c760e7e0bd532e6ef4"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.39-test.349/image_cropper.xcframework.zip",
            checksum: "748c226f35e69c1bb520f1af6db5f0c697344c51a4dd7e01083bc86e46e5a315"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.39-test.349/image_picker_ios.xcframework.zip",
            checksum: "3a5bf4ab18b798a348dd420a148ee6b1a7e647380d82722088cc9e47cba9f3e3"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.39-test.349/mapbox_maps_flutter.xcframework.zip",
            checksum: "2df35b94292997686e56b45239786f1be6068d2ad81e22b223bfb948652fb457"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.39-test.349/MapboxCommon.xcframework.zip",
            checksum: "ca6953d3660d993372dfe14fff7ecc64e64e6c531b43bf04dff9e4ccf4f270cd"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.39-test.349/MapboxCoreMaps.xcframework.zip",
            checksum: "c65c8ac9f0e48e69f3dffc919544600d52083c463fe4f19fa1a92dc96d132c59"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.39-test.349/MapboxMaps.xcframework.zip",
            checksum: "bb368af1565b9b3193a2d652061aa04118eab93f474536d4680a95cd6136f240"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.39-test.349/NordicDFU.xcframework.zip",
            checksum: "cd9d826e15be4edbf5501cc9861b7713cfa5880ccedaa06ca0211f60f49ad824"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.39-test.349/package_info_plus.xcframework.zip",
            checksum: "97ee46d3b79c8c9d04551ee7491652a5e791a1e74f6d831cfa0d5f32ee42ddbb"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.39-test.349/path_provider_foundation.xcframework.zip",
            checksum: "1948e6749d8de3b903b0316838e427bb222aa32f477ce5a886976f52a290658f"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.39-test.349/permission_handler_apple.xcframework.zip",
            checksum: "0637033055e43b62d6a6fd8250892da8c38255e3246e400a2842a591b39cc2ad"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.39-test.349/share_plus.xcframework.zip",
            checksum: "d5c7cd761aa09a8b280570b553acc4864e194440f50301dc81cb63e7c54162d2"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.39-test.349/shared_preferences_foundation.xcframework.zip",
            checksum: "cc1e5301f37ca42c5c973593338bb70beb613e195c077ac41bab837f69c3e428"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.39-test.349/sqflite_darwin.xcframework.zip",
            checksum: "11d4f3ee9421446880279196e980ebb95ea3efbdd45f28b4a32f2d4c844af716"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.39-test.349/TOCropViewController.xcframework.zip",
            checksum: "4a8a42c9df62b03d0b75d80d977460a5bf2cb073af5f20da1fb85437fa4b8142"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.39-test.349/Turf.xcframework.zip",
            checksum: "44e308d307ea873c97dcebd8cc57ab734fc3d23f9b300fc6dddddceabc8b7340"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.39-test.349/url_launcher_ios.xcframework.zip",
            checksum: "2aea26951b00e258bbf5b332301da869ab80f3a4fdddfa02fded737f29e08826"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.39-test.349/video_player_avfoundation.xcframework.zip",
            checksum: "06516e05eb7902180fd7f221302314d68958ee6f8f355a42296a9aa255115d0a"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.39-test.349/wakelock_plus.xcframework.zip",
            checksum: "10cce76b880766850da49b2f7206e9a7207bd4b7fbc8ef7bcd75c74862b94845"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.39-test.349/ZIPFoundation.xcframework.zip",
            checksum: "d4e5e2e48053bda80ace9e5ecde608c9db194a646ca891284fb4428d9db91fbb"
        )
    ]
)
