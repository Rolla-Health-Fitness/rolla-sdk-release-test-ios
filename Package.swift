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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.61-test.372/App.xcframework.zip",
            checksum: "16ca8e23abf7dd47f070a3daa3f2d58c4f04b9bf375afeac1a49c08d670992e1"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.61-test.372/Flutter.xcframework.zip",
            checksum: "792b867c7b9a5a14f2b5291040b18d023ad68fcdf501fd5d3e80e737a65bca10"
        )
,
        // Flutter plugin: camera_avfoundation
        .binaryTarget(
            name: "camera_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.61-test.372/camera_avfoundation.xcframework.zip",
            checksum: "0b27fe85fc6e1eb07474e2c06bd31d046ebf3793a37f0c5bb46d283c83957f83"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.61-test.372/connectivity_plus.xcframework.zip",
            checksum: "5a3ce05c4fb545176cfc07ff91cad43438954993d2fa326284a831a221e04f5b"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.61-test.372/device_info_plus.xcframework.zip",
            checksum: "92a243e202387e23ba3afb75c29abfd91f1052abd9334a83675a80e3a3c10884"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.61-test.372/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "325d5c6e700899eb3300943233a51c8f4181f4d26c211b1110a26da7a1eb61cf"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.61-test.372/flutter_local_notifications.xcframework.zip",
            checksum: "a25e79c0761c183c2fc931ca709484b3317cbcb22db81ae4b0e9d43ea459752a"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.61-test.372/flutter_native_timezone_latest.xcframework.zip",
            checksum: "4a29bdf7dc3b80d6efdb15afd509805d085cdedfd21ad922ad6103e0ff2ac5cc"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.61-test.372/flutter_secure_storage.xcframework.zip",
            checksum: "24a211ef31a2414b9b36133e8532cfd6467b91b9244f4d30ae1528be0802a3fd"
        )
,
        // Flutter plugin: flutter_web_auth_2
        .binaryTarget(
            name: "flutter_web_auth_2",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.61-test.372/flutter_web_auth_2.xcframework.zip",
            checksum: "11ab00b4a8d9adbdfd57c57eb8993dba2fd5ee090c205a9cf1cf7a89e1d1df0e"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.61-test.372/geolocator_apple.xcframework.zip",
            checksum: "950361e4a812c9a837c78a3138a5c62ad39b3eab6e4b5aa9b46fdce5e50613a2"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.61-test.372/health.xcframework.zip",
            checksum: "e5c3679abf0ae71c092ee85f5c95d57c2153869803fd0aaa7280604dbda18701"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.61-test.372/image_cropper.xcframework.zip",
            checksum: "022e31feb0bf3fba589b5c4a867e21b4231e5b1e6aa2e38bdc9f3d159143ebd3"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.61-test.372/image_picker_ios.xcframework.zip",
            checksum: "38e8571030f266d4831a548454ad4753f49650e326c9ab67e13732f5b126e540"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.61-test.372/mapbox_maps_flutter.xcframework.zip",
            checksum: "4c57b46f1d36f318d84d24aaa330bcbf998417af15d7c20c4c4d11f8a119e649"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.61-test.372/MapboxCommon.xcframework.zip",
            checksum: "c060d05793c6a1320d767a5c5112c47fe733f790514a3aa89029d423237a7455"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.61-test.372/MapboxCoreMaps.xcframework.zip",
            checksum: "4f3cb97fd72cdb00b91f31e79f47ff4f53114c3a6e62621051b220d59f7bf6ed"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.61-test.372/MapboxMaps.xcframework.zip",
            checksum: "ceada03552b3f5f09697207a26933c6b1a08ad7306d793c1ddc2fe7cb88e66b6"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.61-test.372/NordicDFU.xcframework.zip",
            checksum: "370b61443cecfe54995cf06b52d5607bad5786952b83c4f00f813c43437c0723"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.61-test.372/package_info_plus.xcframework.zip",
            checksum: "fa4fe97fe68d7fd353e4871a00b055777824e90ca0cde80c4c596a7a6b90136f"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.61-test.372/path_provider_foundation.xcframework.zip",
            checksum: "a50495d15c362d728045205205dd5139def33cc6b06eae2507a8721ed11b9a80"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.61-test.372/permission_handler_apple.xcframework.zip",
            checksum: "9d4d7e3221d5b77dbc2c78590465810aa4795457ecd19abff3038e4b7bec6080"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.61-test.372/share_plus.xcframework.zip",
            checksum: "5ca15d0affd17eebeabf3643b4273c1ed0a8002833c6d2e9c77ecd76d7e0a74b"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.61-test.372/shared_preferences_foundation.xcframework.zip",
            checksum: "142b7af113441cee18d6a053ed57d26766dd5b358f7d7c226828f911f1e41fc5"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.61-test.372/sqflite_darwin.xcframework.zip",
            checksum: "12dee601f03d1e45cb32e231150e2b0a33feabbe4a6e155a07727b7e861fc1d9"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.61-test.372/TOCropViewController.xcframework.zip",
            checksum: "059821e2de6dd73b4018ea137e44c5d6506771f161100b100fd0fa3677be4412"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.61-test.372/Turf.xcframework.zip",
            checksum: "dccb05ce7de41cb0947027acd50bb299315b088a49e1ae541983f144b1fd7b30"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.61-test.372/url_launcher_ios.xcframework.zip",
            checksum: "92b114341479e504d82f59bfaf79f161812eb4543c7a474922c2667a3e713790"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.61-test.372/video_player_avfoundation.xcframework.zip",
            checksum: "a7107f0f1f870ea47f99380995f65d758f9932ec943b03bd9bd52f42252778a4"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.61-test.372/wakelock_plus.xcframework.zip",
            checksum: "2ac979fac012db590a0d01aff30b3c369c72cc51bff7344c22be5c8aa0f4fe07"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.61-test.372/ZIPFoundation.xcframework.zip",
            checksum: "6e72e44ae26daee0c039b9e70c7c1f0e44dd085ffa5d0d2f7a7a220fea526858"
        )
    ]
)
