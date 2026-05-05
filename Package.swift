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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.225.1/App.xcframework.zip",
            checksum: "8786ab25ba5a55a8f3b297f279f7825af3e2bdf2c913b1e10f5e919f63f7dd1b"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.225.1/Flutter.xcframework.zip",
            checksum: "393a72bd1078ea6772a81bb78855fa921f42863f3792caf6a3799480d44331da"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.225.1/apple_health.xcframework.zip",
            checksum: "9a8df353376fbb79927e80a33d5205f85569fb434b2a9f6592e7b19ee1325904"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.225.1/connectivity_plus.xcframework.zip",
            checksum: "69baf1f73f98ba7534df7d3886d0345d616b738dba0f6c3f4335f3a6c9c18c33"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.225.1/device_info_plus.xcframework.zip",
            checksum: "a8904f0fce40aefc9f06e07123532ddc6f5ab2bc692f52887c6eaccb91e46206"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.225.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "42c5db9b71fafb3d6b566ff309064a1135ca37b2b5a7f2c8d5d65f6620689501"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.225.1/flutter_local_notifications.xcframework.zip",
            checksum: "7f63c4b6f2dc14fabeec1d02f08ffcac8232328c0bcb1e02bebec0129f416b9f"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.225.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "d6f0500db1092d3ea1f0ef85d067cf15878283c75fd1cf9215e44956af52a0bf"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.225.1/flutter_secure_storage.xcframework.zip",
            checksum: "8ce25603645faa492d636c381cc3e6e1c636ce859dd143b3586a4bec90de41b7"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.225.1/geolocator_apple.xcframework.zip",
            checksum: "526b3339b227d8533b19929a21e661213d654eb437a8887d8f2e2aa4cb27b6ad"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.225.1/health.xcframework.zip",
            checksum: "85d33c53f59d3e7b7d2aaceb35a361cd1db538bfa7e168c5a5e56a2d4c38e11d"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.225.1/image_cropper.xcframework.zip",
            checksum: "f1e810c244b9ee19edf89afe5ca07d31a1481b38f6a112e81c6f552895c362f0"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.225.1/image_picker_ios.xcframework.zip",
            checksum: "26f01603527a0f5a0c6a6d6d0df824e7976e68491992bde3849058691354ce48"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.225.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "2790ebd40ba4645849adf228589bc2e24cc27fa4eb1cc9ffaeb85e5622fb7de7"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.225.1/MapboxCommon.xcframework.zip",
            checksum: "912c96b21a0796b904498a5dd4dd88f2ecd6b99d226bd26a960e58206c999242"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.225.1/MapboxCoreMaps.xcframework.zip",
            checksum: "9e88f93d828a01d9d3ac14cd1f21021b3dfbd557c7a5fcd7d90602f3057cacf6"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.225.1/MapboxMaps.xcframework.zip",
            checksum: "90e1454b00e66b93c0fff0996c05efb0fba8c995348058c65e4f7a0321d02803"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.225.1/NordicDFU.xcframework.zip",
            checksum: "6b280e0b1b155822a592d5b55d105227cafee39e7a9b77ecaf7bd7cf1e9d0cef"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.225.1/package_info_plus.xcframework.zip",
            checksum: "f2fa4bb00c3e9b9fa5f7f48fe1afd74889ba0c4f361ba356b6069d7b7948f34f"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.225.1/path_provider_foundation.xcframework.zip",
            checksum: "62c5e897f54f60399ebe9ee16b2e545db020bd0729d94fbceb06f9025437fe85"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.225.1/permission_handler_apple.xcframework.zip",
            checksum: "d699517a08fd51d6cb1790cc13d4ab672c38673de0a1c942524806b53cb04ef4"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.225.1/share_plus.xcframework.zip",
            checksum: "fe567b4371faee786a27189857402be028f8d8557f1c80f5613696f475cb30ee"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.225.1/shared_preferences_foundation.xcframework.zip",
            checksum: "d9c6fa80d9cce61f411d046b3e4db80e072c821d2cb65b0ea4549e0a84bbf46d"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.225.1/sqflite_darwin.xcframework.zip",
            checksum: "ebb8e9607dca76e41d644f88da10282d62e048ffa43a346b287aa96445e7674d"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.225.1/TOCropViewController.xcframework.zip",
            checksum: "91ad87237adf913e443ec781e90d98e47c858e392e3a0c5c917772f62438fa32"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.225.1/Turf.xcframework.zip",
            checksum: "983a5b962e068d0a1d257c4a15f68b22940887a8a1bd93223cce6df320e5de52"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.225.1/url_launcher_ios.xcframework.zip",
            checksum: "a6771258a07ea8e933e63a3acffd601e3cdb3719656b3c39c3e8313709aed2e6"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.225.1/video_player_avfoundation.xcframework.zip",
            checksum: "8c267be96533f2f0bd4646afec662dccdb387f10aa2888e952b23101ab5c9c61"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.225.1/wakelock_plus.xcframework.zip",
            checksum: "9d381c9a1d520f9955ddd7cf9f48e790bafefc849d8851107d6f4301c7cf3329"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.225.1/ZIPFoundation.xcframework.zip",
            checksum: "ba117b4fdb03971248a165f834d6893b5a4d7e603340290dffd6b263b7e96b1a"
        )
    ]
)
