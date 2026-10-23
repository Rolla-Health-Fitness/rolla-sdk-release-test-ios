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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test.361/App.xcframework.zip",
            checksum: "cb7c150717ebea304cae841ce1102310aa804d4831c1d3e8497f56178131b7fb"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test.361/Flutter.xcframework.zip",
            checksum: "5d27dabdb686883deff57d18d2207ea3abdd2419212258eba771d0609abdd170"
        )
,
        // Flutter plugin: camera_avfoundation
        .binaryTarget(
            name: "camera_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test.361/camera_avfoundation.xcframework.zip",
            checksum: "5d8847b26657292c65ef531bcfaaff81e65d0a3858f3993367c03da435f0e595"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test.361/connectivity_plus.xcframework.zip",
            checksum: "db96b9452364f4284f86c4ef60a751834637b75c633164465171d5ac6c92f03d"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test.361/device_info_plus.xcframework.zip",
            checksum: "88708fa1eade990f97602d3178964cb8a024752ba05355298de7b7d7bad65db4"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test.361/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "ef9758f2df50eac464718b3512036e2af412b2f5eae10af2a6f533bbfc8cb278"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test.361/flutter_local_notifications.xcframework.zip",
            checksum: "7ed09d76e999a8ba998592f7394e24a5e868663b87d73a44331c4c01387ffa80"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test.361/flutter_native_timezone_latest.xcframework.zip",
            checksum: "6b09c548085bb38028b17b8984f458072790711c084a1f2834c7c5a9cb193139"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test.361/flutter_secure_storage.xcframework.zip",
            checksum: "326897e00a13a9d04cbddd9679f38ad7d847dbe6fbfd7560c7918267454dd0d6"
        )
,
        // Flutter plugin: flutter_web_auth_2
        .binaryTarget(
            name: "flutter_web_auth_2",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test.361/flutter_web_auth_2.xcframework.zip",
            checksum: "64764af04e461df26c62602b9d5e35e4a1ebdeac4ce2a321849f4a46926587ff"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test.361/geolocator_apple.xcframework.zip",
            checksum: "5d9dfc5c8df89248ae75fd68c3de59bb6824d190882d4a76a556711f70bb7c9c"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test.361/health.xcframework.zip",
            checksum: "a092c0f09648365bc2e7957be29bc4e3e255ddd54ee63b5b3abc618b16139e70"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test.361/image_cropper.xcframework.zip",
            checksum: "5f7d0afb2ab92e167ef77b12f04c2e54c053777e13e770df3f5b7510783f18a2"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test.361/image_picker_ios.xcframework.zip",
            checksum: "ffb03aa45025aed28662d91b06abc2716669337504fa389a6cee14af5f103a7c"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test.361/mapbox_maps_flutter.xcframework.zip",
            checksum: "0baf546821ba9d0fd7817a833b6440117a4018871e365a17bc2f6894e7c93d78"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test.361/MapboxCommon.xcframework.zip",
            checksum: "585ed36039567f0db115b57b197954b94043eec8a3a048050a52abd777eafeb9"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test.361/MapboxCoreMaps.xcframework.zip",
            checksum: "51683b13230c33a8e020c666e404d58b1088ebe2bc7ef1b8113644256b8bdde1"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test.361/MapboxMaps.xcframework.zip",
            checksum: "82366ed806917dbcbc3fbdd290eacf2165b5026a6ae1213a9999134f6663b887"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test.361/NordicDFU.xcframework.zip",
            checksum: "0801336640dc72ddf018f7ef0194afd36dc2a297e9ed8e56164c56b7beae4c45"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test.361/package_info_plus.xcframework.zip",
            checksum: "0a06a786d005133d7f2219394526302cf5ff08d7863b195c1e0f4a2a4a745b10"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test.361/path_provider_foundation.xcframework.zip",
            checksum: "6014706863ac6510e41ee0f00d5a25a01e6af65800c6811f945c50a25b112c5a"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test.361/permission_handler_apple.xcframework.zip",
            checksum: "e2b338d3b80e8859be1d76f7c326df66745dc5fd43a2eb768fb483fc4595b51b"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test.361/share_plus.xcframework.zip",
            checksum: "61fe70deb54d323e59cbdae85a22dbe872cb4c5f3c3ef973db8a2f609351f516"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test.361/shared_preferences_foundation.xcframework.zip",
            checksum: "88db05b665d9a61b188200c33928778116fcc78535c12f12265e4aea7795fda7"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test.361/sqflite_darwin.xcframework.zip",
            checksum: "f7e2fe4e641d5f21496f8629a93e7943dce32e10efffdff93e92c6b655b702f8"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test.361/TOCropViewController.xcframework.zip",
            checksum: "a1881e4300e0d29cad4fdab8a9b52ecc054d489a10a07f510d070056acc1595c"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test.361/Turf.xcframework.zip",
            checksum: "862639ae550272c820bf1e23cfbf4e57130620cfe5d09c544399c69d7343edde"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test.361/url_launcher_ios.xcframework.zip",
            checksum: "3d73ba077c899274c72bd9de2a083527e8f483494aa2a36f4d4508cf10f0ab7e"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test.361/video_player_avfoundation.xcframework.zip",
            checksum: "bea60474e774cbac2c27269aabe789a8e84d5ee8afb0c8da92e88f6c9ddc6f01"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test.361/wakelock_plus.xcframework.zip",
            checksum: "7eba09c7560dc3bac7f7bfc193437f471abe349426ab9e659fd5bdab0ff87e1f"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.50-test.361/ZIPFoundation.xcframework.zip",
            checksum: "d4bf0f88df9904fcdd7e949cc1afd27b2279e281df6e0d1911f02b1763b27f35"
        )
    ]
)
