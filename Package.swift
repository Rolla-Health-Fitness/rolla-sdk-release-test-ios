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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.295/App.xcframework.zip",
            checksum: "d6648e80e4778a390647d006c5ce10b781061679701997ad92932ef7657e667a"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.295/Flutter.xcframework.zip",
            checksum: "6c90fae829bfb98ca88c34cf859c39dde3e803a139e0e8f26a71cdc0b39e5ed1"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.295/connectivity_plus.xcframework.zip",
            checksum: "6def80ed08e69ac75a002f56d62c81fb3ea42b05f34fcc368c63e15796916110"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.295/device_info_plus.xcframework.zip",
            checksum: "dcf173bb83c2761f273718b13a64cf8c6c3cb00f381ac4198ef3c02bdd320044"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.295/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "96140f530307456d97a5582d183b9441d3e66bb1104bfaaecc6081032219833b"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.295/flutter_local_notifications.xcframework.zip",
            checksum: "8055ae9c9683df1e4275b6f0aae6fbd51bd31b8f6df8b539a918cfefd0ff3f70"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.295/flutter_native_timezone_latest.xcframework.zip",
            checksum: "50238e8cd0106afe72a5880c2ac63dcc3ea5d3ddc7ecf21110a0987e3e46c08d"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.295/flutter_secure_storage.xcframework.zip",
            checksum: "a54e6f1e261404934e117859d20042c940f197d576be4beceaacdeeb9f77648c"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.295/geolocator_apple.xcframework.zip",
            checksum: "4596e99d611d96cec42d58495d3c8a8b5ba52ea5ac3e7cfd7f3d5eb630656514"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.295/health.xcframework.zip",
            checksum: "4beb38126ac40d59a87a8917afc98e4758a56f649efe675b0722ca680db94c86"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.295/image_cropper.xcframework.zip",
            checksum: "a6c72cac8ee0976c7e5f4a9e5e55c247aa4179c9edfac7ac081137ed43b6129c"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.295/image_picker_ios.xcframework.zip",
            checksum: "a2b601c1dbd555f0a2cfd5b28a1101bba3a7345b3b805397019316d6a16908c3"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.295/mapbox_maps_flutter.xcframework.zip",
            checksum: "e70b4c25ba77f444e66c991dae548c2d900e91434e5d33c24dd24008044a2ddc"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.295/MapboxCommon.xcframework.zip",
            checksum: "7a8649ae279fc6839a6205059811d47fc3691f30307dd2a71ead8b83d28a34a1"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.295/MapboxCoreMaps.xcframework.zip",
            checksum: "e78d59664a4615956e25fdab96059b18c21bdfc41ef5232b2bc3b754fb776bb0"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.295/MapboxMaps.xcframework.zip",
            checksum: "882aa87597496b4ed0ec15f9b39f3ba27b449eeed81f22782947841126ffce6e"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.295/NordicDFU.xcframework.zip",
            checksum: "255d25657f550688c9f5c2738bc6f3d6d3004046d22aacb07b5db32b00f85c12"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.295/package_info_plus.xcframework.zip",
            checksum: "4175144db1dd11a34d84b1096750f8347e0e2330c57a97eb0b8b8b1e439453f8"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.295/path_provider_foundation.xcframework.zip",
            checksum: "4628d456264181e4c83acf0192056d5bd8a50e4efa2bcff03ec606baca6a6b82"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.295/permission_handler_apple.xcframework.zip",
            checksum: "4748c733fafafd400c18082d147b92897cf2dc2e5e194852986af9ad8098cc03"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.295/share_plus.xcframework.zip",
            checksum: "d47cb4f1702720f87fc2fed6c8fa31147fb91d608aae3588713e6a8a729ffd2c"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.295/shared_preferences_foundation.xcframework.zip",
            checksum: "5dfbb3853be22b8c75b53c4702738cfb98498206824ac50ec4ea52268c2e6177"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.295/sqflite_darwin.xcframework.zip",
            checksum: "e2d651913519d8d2c5b3fa6035c783ca3c324d571f9e9b2fa5d2dc8dabf31046"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.295/TOCropViewController.xcframework.zip",
            checksum: "3b355b2661edc3d8f461101d1c894916e5ee13bad2b1c3f38be91034e5bbabf2"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.295/Turf.xcframework.zip",
            checksum: "79b33aeed87daf6b10ad5f0d5ce9757f907d2b98d9e165b6fdae38d36c460079"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.295/url_launcher_ios.xcframework.zip",
            checksum: "8e8e09251df930937534331f4877470d8fbec8826b6aeaceefa73a06ed371546"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.295/video_player_avfoundation.xcframework.zip",
            checksum: "f83852da291f679f3685029252ac2829f2c632dea687c383d9ad378eea5fa062"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.295/wakelock_plus.xcframework.zip",
            checksum: "053e2b89037d23b04ab0cf8502536369ae2a24486aa84c27313c1332af917dbc"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.13-test.295/ZIPFoundation.xcframework.zip",
            checksum: "5a2a10d7e3c4b3ba17a6778425f684fe577fd5d524511c1cc7939e89bd82656a"
        )
    ]
)
