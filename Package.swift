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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.257.1/App.xcframework.zip",
            checksum: "a188fc05ebb0dee512efd67a9796b6f475986873b44ea5c0f805cca368605e23"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.257.1/Flutter.xcframework.zip",
            checksum: "37f111801ac3ab005fe59555b049db760b62ea881c99ab9856c4af804b65aba8"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.257.1/connectivity_plus.xcframework.zip",
            checksum: "a4153d375d4fdbfd0ca292252ec38b984e826ec4a7dee65f543be99f049628fe"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.257.1/device_info_plus.xcframework.zip",
            checksum: "bfb0f4a03a8521a3d6f5af040e224acf2fcdeddb83ec8250cacd1b63e409558e"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.257.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "36590b17252e39e28f35a683c78ed893da38a1b054045579609ff4d835eec86e"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.257.1/flutter_local_notifications.xcframework.zip",
            checksum: "89f9330184e3b1764b8854e4bd09258bb6ffb872ea92127e82a3b6daa121de8a"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.257.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "23184cc29446978b3e32e07c63ddc86e4ed3e4b8e1404c040dfc38076beb10db"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.257.1/flutter_secure_storage.xcframework.zip",
            checksum: "642acde26a14eadd07516ab0142b6df2f75ff23b28ad6958bc82fceb64fa479e"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.257.1/geolocator_apple.xcframework.zip",
            checksum: "74b24edce997e0e794de77b528a2964ed2ee6c2db26763442c4c9183fc6a5839"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.257.1/health.xcframework.zip",
            checksum: "0949a89801400b73610655ab2da40012033e4932eab9188abe500e3dc38bbe97"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.257.1/image_cropper.xcframework.zip",
            checksum: "a15fc83433649cc101159a149f5c3d07e35dfc9e314f3a7b4359ea6790ca7032"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.257.1/image_picker_ios.xcframework.zip",
            checksum: "5844fd3ac71c9c4427d9780c5e923de60ed5be379c7c2d362712e272ff1f6c91"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.257.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "072dda9ca0ee7cfa55e21809cde8465787277eabaf267108f8a71aff3569c198"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.257.1/MapboxCommon.xcframework.zip",
            checksum: "69c61c3e4dfd0da39ce1973ff8d5be5fb22bc75776a6572163939d971c74e5b4"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.257.1/MapboxCoreMaps.xcframework.zip",
            checksum: "29af51864d64903b83677d297c4d39bb23ac365e236e5128fd2eb94662b177b9"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.257.1/MapboxMaps.xcframework.zip",
            checksum: "3cfc8ef5659a76189e71d8f4180418ef068ad3e553760ca545abff9e5c2e7230"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.257.1/NordicDFU.xcframework.zip",
            checksum: "956810eee509527d8d2e050e47f5c1077e1aa318698ae5540923f70f3b152d11"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.257.1/package_info_plus.xcframework.zip",
            checksum: "5c827752d6b2c582c2b68db6a2f5b84609269b6854da727e1dfa7546d2511db7"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.257.1/path_provider_foundation.xcframework.zip",
            checksum: "35691e8caf3e3bffd19c1217eedfe1a124cdcc3f3b9855435f82cd5e9797fde7"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.257.1/permission_handler_apple.xcframework.zip",
            checksum: "63d62c7fb5fe7e81c7c3320daf982a3c7db26bf0b999cf21baf72bcca2f2a236"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.257.1/share_plus.xcframework.zip",
            checksum: "ac203008ba0dea4bbcb8bd3f2a8860c83928500cc7bd8126d551b22dd557c3f7"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.257.1/shared_preferences_foundation.xcframework.zip",
            checksum: "c80c502d765bda74d7ef4b9bef47935eb565d5f775e3ec85ffb09282e638f537"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.257.1/sqflite_darwin.xcframework.zip",
            checksum: "d16504400728b1b2f04fb62b54f5ec1d59aa9529d6dbb9e0d3de99566375cbc1"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.257.1/TOCropViewController.xcframework.zip",
            checksum: "d3a8feaf79d1aa868f92a61400980fa61e15bee9855af254ebaba48bcaa05330"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.257.1/Turf.xcframework.zip",
            checksum: "8f171a7bf34fdfd75728bd6afe7712afd46d65dbbb891edce4f93da1172031b9"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.257.1/url_launcher_ios.xcframework.zip",
            checksum: "432faffed0fbcbb6709906114135b28807330c5e0eb97eab7be406dacd3ddd36"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.257.1/video_player_avfoundation.xcframework.zip",
            checksum: "7f9743c4b632b3cc66a78444a730aab8a7f30b93591aa1e17c38b4aaa56bf5ec"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.257.1/wakelock_plus.xcframework.zip",
            checksum: "6c159d6e80b79d04611c5fcbbb8dbac37f20085ed7a8e3b67eb42eae9df01fbb"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.18-test.257.1/ZIPFoundation.xcframework.zip",
            checksum: "bbc01806ca6cab2c80267ead3fbd9591c186bc573e2f0610da1029a8136622f7"
        )
    ]
)
