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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.37-test.346/App.xcframework.zip",
            checksum: "2eba59c03f645844cd58f373d5bba2168ea9460ca11af61364936c1c04274297"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.37-test.346/Flutter.xcframework.zip",
            checksum: "56c26a0768edfe6b2499899057db3234791736b8787b2998c938c774e8e8e8b6"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.37-test.346/connectivity_plus.xcframework.zip",
            checksum: "5592f912649036f14bbaaa4c73094a68e168a24c60f60e0f9d7da04a69da58f9"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.37-test.346/device_info_plus.xcframework.zip",
            checksum: "d6b82326a06a3cda477e56761fdf9f90621782060ce7f1d2c6ac137136854741"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.37-test.346/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "8586c7d7d92a40870c49a9dcae71d3b4b46276426a197ae6180b5149a42d304c"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.37-test.346/flutter_local_notifications.xcframework.zip",
            checksum: "6fbe6f9aae9981f2fa0314c9288c5ab2f681416e337d0ec3199b8ccb34ede079"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.37-test.346/flutter_native_timezone_latest.xcframework.zip",
            checksum: "fa65dbc0897c4c7c9ae41d760c73fdf75898fe3ceb285152291929191d99c427"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.37-test.346/flutter_secure_storage.xcframework.zip",
            checksum: "9fd104d8599f2a8267d3fdba3456d405685d92226bf6fb5844954e386f32cb1a"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.37-test.346/geolocator_apple.xcframework.zip",
            checksum: "fa44dab33c220dc4989218a4152e1e3054cdfba959e0d355c737e373db15da44"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.37-test.346/health.xcframework.zip",
            checksum: "8eb35816143fa42d33bd047fe076e29fa052c49afefeacecf50b00e0d1501780"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.37-test.346/image_cropper.xcframework.zip",
            checksum: "34de7f2b3866b0a69036e8356c783f4f41b54c17c68bc22b8a91a7c63b3e19b3"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.37-test.346/image_picker_ios.xcframework.zip",
            checksum: "ddbbbb03b872a35b22773ffb3842be3c610eb328d2d81f0688b4191304be0af8"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.37-test.346/mapbox_maps_flutter.xcframework.zip",
            checksum: "0d2a94b73619e4b4cea502361a7a22870c64f454addab49fde58238d8788d69d"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.37-test.346/MapboxCommon.xcframework.zip",
            checksum: "3fad7b88b056805e3038b475222829aabb35f9a0cf27500c32e0f0f034f22959"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.37-test.346/MapboxCoreMaps.xcframework.zip",
            checksum: "57238969323291d3f025ab194c4c97a98cc6ddc783ca04453d9c1d6ba4571b7a"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.37-test.346/MapboxMaps.xcframework.zip",
            checksum: "c78964cea66710a872170fe1e8fe5182d305c596681f0246cd7eb8163f3b33b2"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.37-test.346/NordicDFU.xcframework.zip",
            checksum: "2099b4d172b017cf2335bb532f401615e3d85e4ebd6d8472f09a9a533bf7b647"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.37-test.346/package_info_plus.xcframework.zip",
            checksum: "822c7b69078e654090d1543f187b2858c84613387be7c29c9efcbe43d80b2189"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.37-test.346/path_provider_foundation.xcframework.zip",
            checksum: "9a874b8fa68c50e9c000225d2d3b9f8bb54b1dbf241acf10a92394a2aac34d19"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.37-test.346/permission_handler_apple.xcframework.zip",
            checksum: "aa1fddd3a872d7e4121f985aa72fa3830e68b8d7f7be5cd6e0e147080829b156"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.37-test.346/share_plus.xcframework.zip",
            checksum: "969117f702fedf781f0ee25a838e0b44f18cbe2a5cda5b7cf235f6100f8a0d69"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.37-test.346/shared_preferences_foundation.xcframework.zip",
            checksum: "b8f36b0e5dfa795dfddcf19d618e828776263b3fa4286819aca6fd8fbfa22054"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.37-test.346/sqflite_darwin.xcframework.zip",
            checksum: "c70f0bb9570e3ed7db8ea14eb4139867b86bfb0b664b56b40bf3eecee12516d9"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.37-test.346/TOCropViewController.xcframework.zip",
            checksum: "22f57c48e3b6050bd4d09cf10d1ab36d47623697cf72b0cc908e4c335252f072"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.37-test.346/Turf.xcframework.zip",
            checksum: "f235ced2a9db7f541fc5d5b1a438120f3a245c4a0fb1acd997c45ce9c1b3c7fb"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.37-test.346/url_launcher_ios.xcframework.zip",
            checksum: "a9cc1eea084e6e124541524798d2a21100f0ab69962426757e896b5871954624"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.37-test.346/video_player_avfoundation.xcframework.zip",
            checksum: "859914992010ae2e1cd66db8a2c36196c32d5c929aa1db1e99c80802e86576d7"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.37-test.346/wakelock_plus.xcframework.zip",
            checksum: "ffdb43a52ddccbcb4e96ab1105734f23bc3ad2b00e1c082379988f741ee1fe6b"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.37-test.346/ZIPFoundation.xcframework.zip",
            checksum: "30bb19c03798fab78e06ce28640336818a2021eb02825f3df3dfd76ccb1c8604"
        )
    ]
)
