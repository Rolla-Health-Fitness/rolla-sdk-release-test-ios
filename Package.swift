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
            dependencies: ["Flutter", "apple_health", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "FlutterPluginRegistrant",
            publicHeadersPath: "."
        ),

        // Swift wrapper API
        .target(
            name: "RollaSDK",
            dependencies: ["FlutterPluginRegistrant", "App", "Flutter", "apple_health", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "Sources"
        ),

        // Flutter module (Dart code compiled to native)
        .binaryTarget(
            name: "App",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/App.xcframework.zip",
            checksum: "c1a386a0c8801988a480680b09792e02a33390a23ea3958622eb17d959117640"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/Flutter.xcframework.zip",
            checksum: "e05ed1ba9441ba6c9be7e5c02678be50c96b11b2ac8d3ce2c68afc8b82e8bf35"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/apple_health.xcframework.zip",
            checksum: "72d924bdb390d40afd83ea472ae525ed95cb511acd581b0aeed22db5a72ca786"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/connectivity_plus.xcframework.zip",
            checksum: "fd71ce2f96c3b92f135297970d70544c17aec76d06740a9025d8a1d4e971382b"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/device_info_plus.xcframework.zip",
            checksum: "1135430fb9cdd70b6bf95c34397a56eeb73b2a9b037bc74be448cc6075dfd5e8"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "7f51842274085305ee9690b91b420f4fc480dfeacb27c100909a8551f4340bb2"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/flutter_local_notifications.xcframework.zip",
            checksum: "fee7001ee53c3d70544c74a20da9a475b2e44fd054e1bcd0b99eee9028f7673f"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/flutter_native_timezone_latest.xcframework.zip",
            checksum: "5544cf18c8ac5354d4422626f3208c5a98791de363541b7f7932dcd2fde77acb"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/flutter_secure_storage.xcframework.zip",
            checksum: "eb0ac1251381862907a1f246456c817d93cb5f0e359b18b588b4029fa31e9d87"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/geolocator_apple.xcframework.zip",
            checksum: "897267907c80e06898b10258ae3d8b13ad536973fc41cbd6a29dd394e1f707c3"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/image_cropper.xcframework.zip",
            checksum: "bff0d3bf366ad0aadf2b6a06ba1734ce566572e47201d85cda7c87a79f9c1fda"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/image_picker_ios.xcframework.zip",
            checksum: "7d8fcbce3c14459904ab9eaadca880d3dc4e3c3acf545cb2a81435074ed95f28"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/mapbox_maps_flutter.xcframework.zip",
            checksum: "15d7eaf5b605d070a09358049dc6445b92141d666d0a18f869140be46829e799"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/MapboxCommon.xcframework.zip",
            checksum: "2d430d40e0e70f2e97a52d5f27b5c21bb9562e1e7d54ced8ecd3ac9c1b393a63"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/MapboxCoreMaps.xcframework.zip",
            checksum: "332247047fea7278e71f26a3e1fe847221ddc73f1dd46a8ce047b1aa1f6f2f44"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/MapboxMaps.xcframework.zip",
            checksum: "777eec02a5224aafd9ad14bedcedcaeb312322ee2d67a8d29d545e326c734844"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/NordicDFU.xcframework.zip",
            checksum: "ec9f1de0fb740868d6a8f59bfc9c61af7e62b0dd948ddd120bbe1bee24ce9f79"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/package_info_plus.xcframework.zip",
            checksum: "d91cdbc1356c1b601c7467347a6e988485fa548d92ee5692d5d738e4f7d61e89"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/path_provider_foundation.xcframework.zip",
            checksum: "c5136cb1a0ad71e18b0af89fc1d5fb9d2393346d828506020289787e3798ff90"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/permission_handler_apple.xcframework.zip",
            checksum: "d13b68e72844b00cc640353735750558fedd7a86f2c5971ac38b1d3392d1b319"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/share_plus.xcframework.zip",
            checksum: "191bd566eb58f2e1e782240f2f9f8ab5487a162d42de6497c16ffb0871a56e3e"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/shared_preferences_foundation.xcframework.zip",
            checksum: "384e1443a333d4fd0f65c571e4f347622e6dc9d9374b10c003bafe3e545aaa5f"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/sqflite_darwin.xcframework.zip",
            checksum: "fed80a93225963d09f7458ded4eb22441ef446d8e2ed59e471eae70b2ebf1c23"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/TOCropViewController.xcframework.zip",
            checksum: "d980660d4ad85dc5d715090316db149d4e2a14a3691510bdbbbfe872640013a0"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/Turf.xcframework.zip",
            checksum: "dc54a422e29299fce1e179f4345d057d6045f26ca12bdd76eff06ee207c82b9d"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/url_launcher_ios.xcframework.zip",
            checksum: "28a46db03fc8c7fc18397752b5191e3e95553b2719531a09bd410d048c7b74dd"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/video_player_avfoundation.xcframework.zip",
            checksum: "adac22db25d68bdf3e500ebda28ee884fd0e596f92d6b77f31a0371b04cdbf74"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/wakelock_plus.xcframework.zip",
            checksum: "9db0d9025483ab72e7b6a8b3f4b071ef26ffacf30157033eca6ec854ae7ed86f"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.12-test/ZIPFoundation.xcframework.zip",
            checksum: "9de77f6e97c4c01ed779b3d0b9137e9b223f5f89ca949d4abbd46b88dc42b01a"
        )
    ]
)
