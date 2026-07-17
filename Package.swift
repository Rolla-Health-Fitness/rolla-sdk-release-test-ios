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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.305/App.xcframework.zip",
            checksum: "94ed95763b318af5d5ae7e0075a51ae0bfd3a7fece359c2f9015608af7c32d41"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.305/Flutter.xcframework.zip",
            checksum: "8693bf4dac2fb1c99894a9c28dee0e47814aad47ec2bf40e813e481c22eb12fc"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.305/connectivity_plus.xcframework.zip",
            checksum: "640a029cdbf2bad233af6a25725611432b01c82024349a4c67bc6d16651caf74"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.305/device_info_plus.xcframework.zip",
            checksum: "9f5c191ce4290f08358e81ad01fd923191abc5ddfd667cd5d04551a288ffc77d"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.305/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "dabe201fe767d100e290edf6580a515cfbdaca7c90fbadd81eb94c0f02992099"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.305/flutter_local_notifications.xcframework.zip",
            checksum: "c08d8f2c565332dbaf0ca4a8b62133779491e35cfc6b104806edc111d1060e7d"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.305/flutter_native_timezone_latest.xcframework.zip",
            checksum: "99b386c5846f509cac54df3c63707066deeafa038418abb11768668645a6615d"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.305/flutter_secure_storage.xcframework.zip",
            checksum: "1baa01d8809047860ce6a6039180ddeadb1847701d83f6d9c07cfdba5da295dc"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.305/geolocator_apple.xcframework.zip",
            checksum: "390236fd4f06a226e6513f40899272320d6b327197da77561788d6ed7520cb41"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.305/health.xcframework.zip",
            checksum: "21d73fc7cc2b41401c102abb079db80f3619e98b96655c2f91b42656ecae74f8"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.305/image_cropper.xcframework.zip",
            checksum: "90e8bd85bd24b5cf814fe5b89e1c603246ba6e97e1b12227d16118fa2187a35a"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.305/image_picker_ios.xcframework.zip",
            checksum: "01e2da197a41cd55744fa5276950d8063ac5bd55d00d78c0e9965304a3d1a652"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.305/mapbox_maps_flutter.xcframework.zip",
            checksum: "49b7c9eaec906612f2c2ec76969968d7c16fe68c4ae6c8e0bba5a903d04301cc"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.305/MapboxCommon.xcframework.zip",
            checksum: "872044178d7aec111db8c0511d3b429a77cbbe60fea7271f5af4a8471ee155d8"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.305/MapboxCoreMaps.xcframework.zip",
            checksum: "5dc70ef7a58b1fa6c14686eab2799fe43fd0559e98c583dbf901f8025d94b6b1"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.305/MapboxMaps.xcframework.zip",
            checksum: "5b4570c3700063d10409e5fb62558d1df2c1faab4d7ab54fc833cab9ebf54673"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.305/NordicDFU.xcframework.zip",
            checksum: "77760f6a134c2cfd121cc5f27abd9da7474ed6211f30d33b12b6d0a73931fae0"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.305/package_info_plus.xcframework.zip",
            checksum: "c2fefc83801198010a570d709228c5c0d8c747a58b098fc34fdad613b0adf4d2"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.305/path_provider_foundation.xcframework.zip",
            checksum: "7b1f10efa07da940f8d0bf4c6596dadbbe9cc4670c5b57544bc423ca2a4fd2b1"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.305/permission_handler_apple.xcframework.zip",
            checksum: "7425b1a719c4bad896de784f940a6a82ddebbdd3fafe83f52651b123aecdef72"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.305/share_plus.xcframework.zip",
            checksum: "b3ae4edb3a5d89081ae4b800dbd5c18e463e6767503ebf911e2e822eb796061f"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.305/shared_preferences_foundation.xcframework.zip",
            checksum: "e9ddd25cbf77e7cf811faf2e3c6d1665da5d443595326b527ee650884c649e49"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.305/sqflite_darwin.xcframework.zip",
            checksum: "de19aab13dc9495fcc4c7e7b7ddec644a695b205663909cbabf579a1943bcfd9"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.305/TOCropViewController.xcframework.zip",
            checksum: "db368501cc1c32726c0e4266d174605dfa4df694078fd1d2e2e2624db5f568f6"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.305/Turf.xcframework.zip",
            checksum: "a022643d784e3fb5a5490e1aafef33bcdf4f418bcd3e601a7dcf25fa27bacbf9"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.305/url_launcher_ios.xcframework.zip",
            checksum: "b3e2b0bdf80896000ede21501fb3f9ad14c9341bf3a7610c405dce4b2a22c6d2"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.305/video_player_avfoundation.xcframework.zip",
            checksum: "6964f77611a9fda135b3370c98e2f2ea920d2ae8ca16e93a75dd8bc0e2b57c65"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.305/wakelock_plus.xcframework.zip",
            checksum: "d76720333d0e57be5267f469ee82914333faeeef2ef6a52b5052cf9878682c5c"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.22-test.305/ZIPFoundation.xcframework.zip",
            checksum: "546f678e436894b1b8bd27b4cf0629eac479b5b84e84cd315b61286f6fb680b8"
        )
    ]
)
