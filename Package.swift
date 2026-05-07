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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.229.1/App.xcframework.zip",
            checksum: "04ddb9d9516b3f23ac9fb94f8a2bb3f0faeb4dc132fef3b2e68e23222a4171a7"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.229.1/Flutter.xcframework.zip",
            checksum: "aa13bc717dbbfaf7388e2e754e9b8ddbd890886e1e88cca4f2b4f0e827b4fbc4"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.229.1/apple_health.xcframework.zip",
            checksum: "6302b3a9eedd51fdcec246e4dde514cf24f33795cd4b03edf5eec6c05735b71c"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.229.1/connectivity_plus.xcframework.zip",
            checksum: "321963c6b99a1720970262bdf4810fbc7a669c7e8f8d922d7c9287bfe685abf0"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.229.1/device_info_plus.xcframework.zip",
            checksum: "c4b36cd42444db1713c5ac6df74cb3999b875dc42dd597cae86cdf63aa30681b"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.229.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "17b0dde3ec31df4c4a67cf62e43015e94f54a447f1f7fdc03b1f3a7abb9ef32f"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.229.1/flutter_local_notifications.xcframework.zip",
            checksum: "a2c587d5673e24d7ba46a26bb59be1178a2463dbe23be0ebbecf2229117fe1d2"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.229.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "43206d4b9c9eccc5f013c0d25a2ebb27c4e9c31ad4d4f6a2012366c787e9833d"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.229.1/flutter_secure_storage.xcframework.zip",
            checksum: "56bbe3862d1284359af14031315d3b78de8405d73b218a15bc58dfd1e4b570d0"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.229.1/geolocator_apple.xcframework.zip",
            checksum: "9ab30311e8daf1b456d919ba76a1020ccd51a0b5c03900734c249693f2de5d82"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.229.1/health.xcframework.zip",
            checksum: "692d39e70d8857fa4d26af0f50acc9b87532e76c68be6db7d21335dd3cd07a29"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.229.1/image_cropper.xcframework.zip",
            checksum: "6216760fd625a32888144e8d4fe5b0598c21f92df37a412ee39d904b34d195fe"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.229.1/image_picker_ios.xcframework.zip",
            checksum: "fe201185bb862345b5f21ffb248e7559992c205218cc0c2ca98fa72344477e90"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.229.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "0982add91625f8b8c8c455fed0b1b424cb330b6ac914e5546dae186b8e6a592a"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.229.1/MapboxCommon.xcframework.zip",
            checksum: "6c8309506ef193e7472fe3b23a0d8942a497def4815f44ac55aa213f5272a74b"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.229.1/MapboxCoreMaps.xcframework.zip",
            checksum: "dffd194a8e400f6d1fcb7db551a2775d7d8189bd1f55ba01ffcc1d465e817821"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.229.1/MapboxMaps.xcframework.zip",
            checksum: "889309baa86033bc3dd16b3479d88962241fa9f6d285c426216b67efade41613"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.229.1/NordicDFU.xcframework.zip",
            checksum: "4634ee3021dd4c9e07979fce80ca0f60e9b7186a9a7ba16aac4d9b0489db53b1"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.229.1/package_info_plus.xcframework.zip",
            checksum: "47c58f4f932ba8b545c0c52826435523f12167301be46426784c239f1ba861e8"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.229.1/path_provider_foundation.xcframework.zip",
            checksum: "dde62834f5b56cd061d06b15562dd72e9fe1ffd87d531b330e0d2b275c1db10d"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.229.1/permission_handler_apple.xcframework.zip",
            checksum: "a665a9a9fe84b2562d8e8896834dd188fa051c0babba9a643adf2d736ebd53ae"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.229.1/share_plus.xcframework.zip",
            checksum: "d67086ceb7cfede9ec38770fab4564bcf3bf953643b636399b3af3e4099153ff"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.229.1/shared_preferences_foundation.xcframework.zip",
            checksum: "dc964cb146abf9925c3b444c137fda7e273fddbcac95d639f6ae575fecac8571"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.229.1/sqflite_darwin.xcframework.zip",
            checksum: "be98daf27830f34b4c4c85b6f0f80822f7cf0d08e3b55a0c904b5e67949a5532"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.229.1/TOCropViewController.xcframework.zip",
            checksum: "6a0b1bd10d8ad076aac4db9c021df70104e48f2eb1ff2f3ad09018e799a92bf1"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.229.1/Turf.xcframework.zip",
            checksum: "e3de6175033ca46613a8fab7325557b1a3fdfd1299c78dddd34ee3e74a824c8a"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.229.1/url_launcher_ios.xcframework.zip",
            checksum: "f9c33cc7e9b9923265fc9da435ed3ec9d311c3d6a56104a574a792648e105470"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.229.1/video_player_avfoundation.xcframework.zip",
            checksum: "d5143b2178538e3516eaeda4c938606c990ba156a792338ab5b12e2f6f17b8ec"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.229.1/wakelock_plus.xcframework.zip",
            checksum: "c3356e1c1d9e7bc519768052dff0df3e9fbe3f03d6f7de11673b5d08da269b36"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.229.1/ZIPFoundation.xcframework.zip",
            checksum: "13e4a8f0ade188f3a6ed710fc31907eeb4935d72af08eb79b43582ddb04678a6"
        )
    ]
)
