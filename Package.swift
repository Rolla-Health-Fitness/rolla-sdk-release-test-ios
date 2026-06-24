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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.275.1/App.xcframework.zip",
            checksum: "734825babc1efee88582b8d534d1277d2df373b5b504a3f6085c0ef7ae254406"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.275.1/Flutter.xcframework.zip",
            checksum: "4226ce5c91d162eb87bc1607c965e68491aa6c266c65fabb2eb116fa61a63dad"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.275.1/connectivity_plus.xcframework.zip",
            checksum: "47583ccfcc01e4396b6c0df8e0a94b21c8c92d72396d0939ed9d2a370e772b14"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.275.1/device_info_plus.xcframework.zip",
            checksum: "a9cb0e9a037e6ad6d4ca26783353dfb881c1a3c56ad8a8bfeeef39b90659d1e2"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.275.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "d23eae2da51dd0660bc64772917bfd002c7ab64c4a2796f2c42a3160109c3fec"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.275.1/flutter_local_notifications.xcframework.zip",
            checksum: "c1b003307b3044efcfc85d830a56112e0fe20c11c02cd02abcafc8d16109d4b8"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.275.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "76df4c3f3e31ece6f84080efa5eb3afdb4657637bcb8e3c1a1fabcad236838e4"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.275.1/flutter_secure_storage.xcframework.zip",
            checksum: "5df0e44981f0e82f1396864b77d4c31e3a1a2388f9593cf42adc958d1da10415"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.275.1/geolocator_apple.xcframework.zip",
            checksum: "f333defd04749cca1da3f58998e03b04517eeed2253b5944c331dc929935fa44"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.275.1/health.xcframework.zip",
            checksum: "d2f838ae59ec693fd552b6bf83b1d748055ebb3c772fc18be57ee32cab4006d4"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.275.1/image_cropper.xcframework.zip",
            checksum: "08eb8f1ccbb408eaa9fd5e7c16e9aca056817f3e03a1053c898aef495deca961"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.275.1/image_picker_ios.xcframework.zip",
            checksum: "4dbad9331d7e34ae6c64bd5d819d01e55228c58543ef65c1440f4e612243c3f1"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.275.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "ac78a6bd1f987bf7f3e58ec6975bc4bbd1de416525cc11993f42e9dacf1a0b24"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.275.1/MapboxCommon.xcframework.zip",
            checksum: "a3946152422c673000893440b84b134097b48b87f2bc4a8fae8fa502c167f59f"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.275.1/MapboxCoreMaps.xcframework.zip",
            checksum: "bcf936996a210319d2e5afba3a4422d5a7fb0d965ebe16ceacd9658daa2597da"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.275.1/MapboxMaps.xcframework.zip",
            checksum: "79398687959f7ffca8ad826e02be9a1469476269aab26323ee97abd62c82423c"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.275.1/NordicDFU.xcframework.zip",
            checksum: "889ec23b2424cc4bbf38cbf8a49fb0b2f6bc328b4b4da83b5902875bd60cf76e"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.275.1/package_info_plus.xcframework.zip",
            checksum: "e3a71b471096a2cb33abcc56e0cfe4125c7dd8cf52efd443bed6814bc78d5643"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.275.1/path_provider_foundation.xcframework.zip",
            checksum: "e685f3602042b628b53e7f38989acf7acb22a6f098b344fa591d1537155c7716"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.275.1/permission_handler_apple.xcframework.zip",
            checksum: "e333e7ca139ed6917c8cda1bc437d43961e5490aebc6d4628f96db02a8e3e25f"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.275.1/share_plus.xcframework.zip",
            checksum: "10fa6b44da2fc2f4f168feb7e66ddd9db5cb065e2f484b2cc019eaa34d419af1"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.275.1/shared_preferences_foundation.xcframework.zip",
            checksum: "b1c807ea654e6605965147954bb7b174b3857220dd60b976a227892f4186c000"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.275.1/sqflite_darwin.xcframework.zip",
            checksum: "d42b95159f027b50900f5b581ea2fa01edb2f819550cc402d14fd874f79036e7"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.275.1/TOCropViewController.xcframework.zip",
            checksum: "8c23b5b7ced53e71df7cd180946b979bd3fdc569e36df88c04b71389b68ea5cd"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.275.1/Turf.xcframework.zip",
            checksum: "5034cc515c3ad55e3538b1a1abda71f7215d606e9f939cd3d172590400613655"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.275.1/url_launcher_ios.xcframework.zip",
            checksum: "68ced350344711dde4435379f24d77dc0312124ee498946b1f7f08ae1675ab9b"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.275.1/video_player_avfoundation.xcframework.zip",
            checksum: "edfb450817308b42134092009a81e560db7aaa4407fb7cbf92c19a7f2f591d47"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.275.1/wakelock_plus.xcframework.zip",
            checksum: "e9f4ff3251523f15dd7e6f5bef6a2c72abb2108c10b496fbeed91e19a23a3ec1"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.21-test.275.1/ZIPFoundation.xcframework.zip",
            checksum: "7cafd015a53aa7a86503f7849985750768ea384424ccf7aed1e7cb34ed15f0af"
        )
    ]
)
