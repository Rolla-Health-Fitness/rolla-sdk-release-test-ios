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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.51-test.362/App.xcframework.zip",
            checksum: "1155af9d6b158e74e3bb0d234935496ed59312558924edc797126c7d1540a05e"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.51-test.362/Flutter.xcframework.zip",
            checksum: "a04af35888b89759713a243c831fb240de8b5d974e9bcabafbbd94eba598d282"
        )
,
        // Flutter plugin: camera_avfoundation
        .binaryTarget(
            name: "camera_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.51-test.362/camera_avfoundation.xcframework.zip",
            checksum: "f5db87cb927d95796d8259dcc56ca3a83a0af8de98a338248aaf1e05bd104117"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.51-test.362/connectivity_plus.xcframework.zip",
            checksum: "073b210205e3ec24d8f7ccdb253c943ecf6b6b39b15e1b95bdffb8552a832d41"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.51-test.362/device_info_plus.xcframework.zip",
            checksum: "571593ce1ddb35c6fb12d39e1252191e7f29d5af17e365b22d2ec1b68df80437"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.51-test.362/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "7de68172e248e029d7d0c93311fbf870185b8e194877687efc44586b374898b0"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.51-test.362/flutter_local_notifications.xcframework.zip",
            checksum: "ea5ed032c94a7198d0a541729ef381f42075ac1dc410b19ba7d4587254dd6cbb"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.51-test.362/flutter_native_timezone_latest.xcframework.zip",
            checksum: "df3fcd3ed213090308ab5415deab4933311551dafde106a36e095d6541cae5ac"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.51-test.362/flutter_secure_storage.xcframework.zip",
            checksum: "c5518e5979486a8d3a29239705aafaaf0151aa9947b91e5324b1d3fb51b1b349"
        )
,
        // Flutter plugin: flutter_web_auth_2
        .binaryTarget(
            name: "flutter_web_auth_2",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.51-test.362/flutter_web_auth_2.xcframework.zip",
            checksum: "d425031e2a590ee4f48098a34277d6ed69177c9ea60574bcfa0cd82abfd925d0"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.51-test.362/geolocator_apple.xcframework.zip",
            checksum: "712beaa980b664bc7bdaab0a1c48c2b48340b0808f76198ca787b24beddbaedb"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.51-test.362/health.xcframework.zip",
            checksum: "8b243f30962051d7332a8bff3ab610d4b79a16591cd6e1062fa7e3d9ea2848bf"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.51-test.362/image_cropper.xcframework.zip",
            checksum: "bc62947b2c95b2315d559f6d698e7115c2bf889c0a742c4114d471d2bbcc0720"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.51-test.362/image_picker_ios.xcframework.zip",
            checksum: "ff7f6c78caaffd4e6eac3369ca6327c4c24024102bb0a2bb2b024b55374052f6"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.51-test.362/mapbox_maps_flutter.xcframework.zip",
            checksum: "e18c4e81d4254c6302afdaa16022f4063b5b6371f6d350bc1398000547dac991"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.51-test.362/MapboxCommon.xcframework.zip",
            checksum: "96397d9c108bf6db16d34cc17b2557c0c1cc7919f805999813199bd425cf789b"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.51-test.362/MapboxCoreMaps.xcframework.zip",
            checksum: "459022d347ff745ecebcebb26ea133b587647e29d01cb424dc4a144448431c97"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.51-test.362/MapboxMaps.xcframework.zip",
            checksum: "134218e956f8b5b09d395d305b18d81a7f1393d135e8e734da9d6fa0172c893e"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.51-test.362/NordicDFU.xcframework.zip",
            checksum: "1ef04147d542b2ee7f62b2b4129b1a9879caecfb87483564bdd62f46d962eaad"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.51-test.362/package_info_plus.xcframework.zip",
            checksum: "2f912f4c6ead32c33f94d44716ed115f43d5fc9a1ad56d42d187f4e047d8bd6d"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.51-test.362/path_provider_foundation.xcframework.zip",
            checksum: "cd5a76ec25988d490566a81e4507548f6ff2951058ea97f09b4bc9440de075f8"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.51-test.362/permission_handler_apple.xcframework.zip",
            checksum: "94ada577fedb63f2a70d4f19748541202fa18ce56379f06914e7b754c6f23d70"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.51-test.362/share_plus.xcframework.zip",
            checksum: "c57b9deaa26cb7b00c1cfb18c349c0fcd50cc468df4f17e40239801cb6cb4541"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.51-test.362/shared_preferences_foundation.xcframework.zip",
            checksum: "1ed7aaa83b3d2e3be1b73b91eabb1b1ee80ec96cf6a49601ae40e14c0217b4fb"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.51-test.362/sqflite_darwin.xcframework.zip",
            checksum: "6f0004084b0bcd03d8cdd8a060c6e16febf6a4f346568f2dbdf81f3216bf56a2"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.51-test.362/TOCropViewController.xcframework.zip",
            checksum: "b9a4fea2bb8bad37df8a98404bc71bad2571354350f259eb0f954745db3a73cf"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.51-test.362/Turf.xcframework.zip",
            checksum: "fff451e000942dbeb95a370aaccd65f892dde4708781c1292cfd06d8df4d9e15"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.51-test.362/url_launcher_ios.xcframework.zip",
            checksum: "e1f7fa7ed37302e7ecfdfdd837c8b087fc9637da46ead171d9e16394c4d3ef68"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.51-test.362/video_player_avfoundation.xcframework.zip",
            checksum: "5ab19538152809879b56fd8770331cf67b06b1d6bbf6e313eec46d9783ffe659"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.51-test.362/wakelock_plus.xcframework.zip",
            checksum: "c1c417b827ce57cc8d26387e034f4cb9e0f34ef3fa86aef91de58940b219f3f8"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.51-test.362/ZIPFoundation.xcframework.zip",
            checksum: "5df123a7b8795450cf79bf5a621aee746eceb6f1f701dd4e59f53e704e934bc0"
        )
    ]
)
