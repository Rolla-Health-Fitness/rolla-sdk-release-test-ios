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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.264.1/App.xcframework.zip",
            checksum: "c83da23b265b244ee6393ab9a9e8062fcd83b1a38c54f8cf9eac8f3dc23ce634"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.264.1/Flutter.xcframework.zip",
            checksum: "57577c14927c15e8d6c8f9eb6fb59c9e3632103fbef41159f57b1b7d739dc364"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.264.1/connectivity_plus.xcframework.zip",
            checksum: "fe9231b198a54a8678230965733e1c1e752b5747f7c51925932be5f0419f3e91"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.264.1/device_info_plus.xcframework.zip",
            checksum: "d3c83e01ab303927a1504b81a0bb5f2735b702dde4a9310c78cc4a3256e94a97"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.264.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "c6c78e5bf8ac3c07dd7513acefe38bf12a0b5dc24d20a05bffb14a13262408fe"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.264.1/flutter_local_notifications.xcframework.zip",
            checksum: "5dc654818dc83818b68db7c488076b6f428777c57c362f29156cbf5934a1d5df"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.264.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "6e9c75324b24f5d26b761d1efe9e0bb12d454def5436cffd17fa6bb3a5566f66"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.264.1/flutter_secure_storage.xcframework.zip",
            checksum: "cb7224928a9f3a4248eaa688016812c724518915fc3a8cf6f38f67b4fe7b9e8c"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.264.1/geolocator_apple.xcframework.zip",
            checksum: "9370f97d9506971bcbdb8eb218bceb53f18a4f1536033d7d34143821eeae42a6"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.264.1/health.xcframework.zip",
            checksum: "45d98ea1b96fb558ed7b175edc216112997730878b3bb8999c9781cf9bf5036c"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.264.1/image_cropper.xcframework.zip",
            checksum: "ba315a05feb7db05e4aedc54393645573bedf9bd81f982f15c289b4b6f5a45e7"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.264.1/image_picker_ios.xcframework.zip",
            checksum: "8b77604b37742e5f2dd20b1269c399525d92631d1082cc4057e4ca6935300a55"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.264.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "9677ce08fd779633642e8a8184eb440021e18a4d7357ba34c0d8dc6d4e800bdd"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.264.1/MapboxCommon.xcframework.zip",
            checksum: "0731b89a61f4251f6f2d42dd2968906fbad1e81a7c5770f3917e4c08a5fbb35c"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.264.1/MapboxCoreMaps.xcframework.zip",
            checksum: "d9c938082c07b74c2b645a21752fb0b283c68a27f4da6f454b560ac7a9666664"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.264.1/MapboxMaps.xcframework.zip",
            checksum: "89b368ff88e9398d48b8ea473ac14b711918d1403863c325664829b95b62fdb2"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.264.1/NordicDFU.xcframework.zip",
            checksum: "1814b11ec58b947395ff1cc1b5c07306ab22a188d37d2ab9cd46d9c9ef22928c"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.264.1/package_info_plus.xcframework.zip",
            checksum: "19569140c32647b516fc9d9d6b3632f21c42d44fd1fa16840626460e77825067"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.264.1/path_provider_foundation.xcframework.zip",
            checksum: "f09c0134db5bd40f6cf94d51d41d537bc43c053ad926df12856fece7e6b09d1f"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.264.1/permission_handler_apple.xcframework.zip",
            checksum: "8b86f86073edbb887b3a692d748ff9a6d70600732261c651c96317ab8ea38b4e"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.264.1/share_plus.xcframework.zip",
            checksum: "8463457da970cc588becd3fd1b20f946b990e9b85ef0cc2b8101d8e562bd5a11"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.264.1/shared_preferences_foundation.xcframework.zip",
            checksum: "884bea8309b0dfcdbbd7810adb96b1cf96d2cddea3bd0b27436cdd35c5baf18a"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.264.1/sqflite_darwin.xcframework.zip",
            checksum: "ec95b0edff56b200c861fd77b762a8798178d8373a01ea31e5de259370036727"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.264.1/TOCropViewController.xcframework.zip",
            checksum: "b36b292328c5a64afdf38078edb7a93f163c1672f6da70220ba6f2a61242bf47"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.264.1/Turf.xcframework.zip",
            checksum: "9533ea9d3c084184e6ee2e1eb33996784d629ab63ca2faf865e1175747d1b722"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.264.1/url_launcher_ios.xcframework.zip",
            checksum: "5413a9f93f7bba01527ad3608b74751cbb1ca62b0cd8a7e4546810ae25ff15b9"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.264.1/video_player_avfoundation.xcframework.zip",
            checksum: "c8b8ecc46ca5e825e6492b48b058b6e9f6f221ec30e9f849a55e74d9ec0632bd"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.264.1/wakelock_plus.xcframework.zip",
            checksum: "38aa8e053a54367389fdfaa2632d40706b705d3223f3c683be21dfcf03c80572"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.16-test.264.1/ZIPFoundation.xcframework.zip",
            checksum: "f7f57b39164e6844306a0468ffbc4be833b69debc8ba76edc8e98727fb3b3890"
        )
    ]
)
