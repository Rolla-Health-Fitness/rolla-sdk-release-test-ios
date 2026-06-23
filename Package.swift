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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.271.1/App.xcframework.zip",
            checksum: "1fcd50d6412da63ce427e2273077ecdd9ef8d848abb9a2c183ad1b4edbbea55c"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.271.1/Flutter.xcframework.zip",
            checksum: "1c0a88d35f066cff5d64ee805a43f5a38119096e27a273ce4a1e24d0978974cd"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.271.1/connectivity_plus.xcframework.zip",
            checksum: "1f9bab554f16f77229c4b5853b39ec394948330853545c03207cb3432007b119"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.271.1/device_info_plus.xcframework.zip",
            checksum: "73c4b3d35b03196e1cb77cb1bec05dad3b0138d4e20d6959753ac91ef858a982"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.271.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "39625ee89463b09183de491b635ee0a7b30e887fd8a41eb22c3d4405a91ff00f"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.271.1/flutter_local_notifications.xcframework.zip",
            checksum: "a859afd545f329217609ca77ae84e40d08a151f084a377e3b1e7e398ea21a68e"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.271.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "f96eea555c84a1137a5b28067f9a7413115fb1e1e885a1b64fb3bcef599df40e"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.271.1/flutter_secure_storage.xcframework.zip",
            checksum: "8b14c9d4079d5c1cb9fa6c30354aa4df87776e93e6d87b3a4461cd7f15be77e1"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.271.1/geolocator_apple.xcframework.zip",
            checksum: "22a5d77b6d377706250f5426a2e212751d984b62161082a28df822dd28570536"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.271.1/health.xcframework.zip",
            checksum: "01613835346188304239e4b39f4ba7bf8ae1e1bba499bdee5a0359171928caec"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.271.1/image_cropper.xcframework.zip",
            checksum: "4b30121d8b1255c477ab1b31bc1477e04812fbdc6d106fba42300b209f9c592e"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.271.1/image_picker_ios.xcframework.zip",
            checksum: "6f245cfd0bc7a4d1c36d3117647c353241d9964e9debfcdb3078c5c19d65fd5a"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.271.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "969361e6a97783abd609357247adde09af582eb34f9d91ce1204fb57c2ec7451"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.271.1/MapboxCommon.xcframework.zip",
            checksum: "75ca845c5ddf2d28b387ce976ac13f0dc5fb5e49e97b35502501e7ceff84681e"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.271.1/MapboxCoreMaps.xcframework.zip",
            checksum: "fb366ecb1575d1883e9d7d9390bffd311ca9e570d620a9d77c80aefe1acc28a2"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.271.1/MapboxMaps.xcframework.zip",
            checksum: "aab3f109f776fb6ab0148c1c5c91e7ac4845383b49a128c4cd6c6aa2c0a6a476"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.271.1/NordicDFU.xcframework.zip",
            checksum: "4193f25158fa45fe7f170d5efdd9c611ac55a08aae2b0df2fdd83e8dd61d9f89"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.271.1/package_info_plus.xcframework.zip",
            checksum: "89f3f8f5328445a8e121f4b040fdbb2551589df0f8f2fdeb7df5002b21ac4ec5"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.271.1/path_provider_foundation.xcframework.zip",
            checksum: "ac26665348232ea9e9832eb6200ecd1fc405594a69baac6f90c0663e06239402"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.271.1/permission_handler_apple.xcframework.zip",
            checksum: "3f08c992f6c63da462ece85240459669f2ddf69ac8e9f7a1441e33b957bc0003"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.271.1/share_plus.xcframework.zip",
            checksum: "0282f15a5028822d7506a8712d3953b66b880dd7c441513d653dbca1fe05afb3"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.271.1/shared_preferences_foundation.xcframework.zip",
            checksum: "a90bc0c5816a519d124163c54606e2902c19d04ef31001f83416783efb5b71b5"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.271.1/sqflite_darwin.xcframework.zip",
            checksum: "ec7c2c9146003c3008c7f73d10c01f4bdc7c9db9d07c1bc0f4ec98d7e84cd4aa"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.271.1/TOCropViewController.xcframework.zip",
            checksum: "1d749705f14546d43ac72b6a149c296d7161639da6b2beae7b8d1c51ee085ad5"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.271.1/Turf.xcframework.zip",
            checksum: "c05649d37fd48a0374f380ef473334328d03d5d0e126f657fe1cf2f418719e7a"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.271.1/url_launcher_ios.xcframework.zip",
            checksum: "acd7aca88b417a07ada5a9822d468b3b7360219c7ace1249991afb64df1afdc1"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.271.1/video_player_avfoundation.xcframework.zip",
            checksum: "7d38a35ac06306af3d9606d1253313a524826e0d8d717f5493574ee978b1b666"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.271.1/wakelock_plus.xcframework.zip",
            checksum: "3429e739ae71508d02864672168fb6b0879dd7919c0dcf337482cf877be7f2f6"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.17-test.271.1/ZIPFoundation.xcframework.zip",
            checksum: "16adcf9019c178d51f39b6e3604833f90cbcf096fa805448f601cae43465913b"
        )
    ]
)
