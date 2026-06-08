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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.253.1/App.xcframework.zip",
            checksum: "41aa106f8273068783b631aa0576b596d8a9bc29b194e8b8382e1c9bcf427c33"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.253.1/Flutter.xcframework.zip",
            checksum: "89fc113f151a575719ee10d2991256a9a7086b3587be43219ed542617884d508"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.253.1/apple_health.xcframework.zip",
            checksum: "c9c6475f7bb43c63bceea80d713e29726cc4765be7f25581bc993af6e8da5058"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.253.1/connectivity_plus.xcframework.zip",
            checksum: "f071be75abdcfe0e49390701440a3fc8e9a6e2d32930ca812e217f6e159ec1a6"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.253.1/device_info_plus.xcframework.zip",
            checksum: "08e4f7ff53316664f30a9e03fcdc4f99ef095004e73a9e4a8fe32da2ef432e18"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.253.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "a9096023fb7a8965013fc452573a8e5d8729bd5e295a0837bde0ec0fee75cff0"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.253.1/flutter_local_notifications.xcframework.zip",
            checksum: "3beb23addbfcb766d62122080ef376885be63d111f626c78b1038b0e00e3fe6a"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.253.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "515cf49c1dbaf43dc80380f617797a2807fa74cd212cff49629c3f7cd57c18c2"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.253.1/flutter_secure_storage.xcframework.zip",
            checksum: "2ed0519f4b71fe8c11a9cddeb6018341023ee9d7bf4337ad2e6ce3d7da5acc38"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.253.1/geolocator_apple.xcframework.zip",
            checksum: "fdebf793600de0234c35208f65077c498f7be2aabe70b92a73f5158777ff709c"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.253.1/health.xcframework.zip",
            checksum: "e93f34419235a677b353eb64ce53b0f9ddf66235b1721c7b5cfa3f1f18f73d20"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.253.1/image_cropper.xcframework.zip",
            checksum: "91d494162f6bdb829ad12d05814a45d09e520f7caf345f0f425fa56781eae747"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.253.1/image_picker_ios.xcframework.zip",
            checksum: "42f1ef924c47d44053f13ccb842248bd3ce29c684868400ec2fb1ae3243267ac"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.253.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "31914ebd243eb455292511d606d9960310279fe055bc08db2fd1b42336cba874"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.253.1/MapboxCommon.xcframework.zip",
            checksum: "16394ac9e8960354ef3f0ab87d314edbacce43f5c520c94eca26cc327c6f83b8"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.253.1/MapboxCoreMaps.xcframework.zip",
            checksum: "df6a6ec380d3ae4453e064ea89882f5ef0575e02645092afe0801015c1052d70"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.253.1/MapboxMaps.xcframework.zip",
            checksum: "913e85c2c7a7f80be9721910ae17db536da92b932f9703906a31538d0e757c7b"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.253.1/NordicDFU.xcframework.zip",
            checksum: "fb5ff1adc897694041bb69375f31a753d8831825562fe5c57372a0c7afb6e451"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.253.1/package_info_plus.xcframework.zip",
            checksum: "c654629fa3f6cdfbf7883950bd0a842afa8fc4166cf36a42c6af9b166f033545"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.253.1/path_provider_foundation.xcframework.zip",
            checksum: "ac1a99b88a08c68883686d5e256968c71104d5e6cc23e13d070b78853efe43fb"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.253.1/permission_handler_apple.xcframework.zip",
            checksum: "606ea73c29dd8b86564d28e27b3b23b085b7882c8e8f8f5252f4c11aa6b1c886"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.253.1/share_plus.xcframework.zip",
            checksum: "2e88c2e5d432887f77e54a5a7dee246d6caffb69ad4a046b97c4e7ecf7150c0e"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.253.1/shared_preferences_foundation.xcframework.zip",
            checksum: "64f1c6bd24f679af9b7b09f82b5e5fb5ec2c646c4620505e0bc112f1bfc1516c"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.253.1/sqflite_darwin.xcframework.zip",
            checksum: "401f0c909c324f0ec38dc1a052244b55e8dd257c3df222fed5f1b4c797dec9ad"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.253.1/TOCropViewController.xcframework.zip",
            checksum: "60aced426abd6b4ebae93d50fe4e97d021dcc6e6b9ac804ae92a42b0c866a755"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.253.1/Turf.xcframework.zip",
            checksum: "9c29a88f853c33fc4fc5e5f715c57acf7a49f77b7948ce2634dd5ad4cfc92840"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.253.1/url_launcher_ios.xcframework.zip",
            checksum: "330abff0d70c89f92e0af99d37366a7905e1fa0474fff860e49a30b70e667c4e"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.253.1/video_player_avfoundation.xcframework.zip",
            checksum: "d875e7ef70a12d728bee650daa572705cbfdca73d58b56bc0a83748ff1609b8d"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.253.1/wakelock_plus.xcframework.zip",
            checksum: "69330233f388eb89e460e1b77d764e4545312613ee565285677abf8af6883a6a"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.4-test.253.1/ZIPFoundation.xcframework.zip",
            checksum: "e9abc3695d1ab5581ff264a0df94f736b18e2ee74f375e335b288791a83133e2"
        )
    ]
)
