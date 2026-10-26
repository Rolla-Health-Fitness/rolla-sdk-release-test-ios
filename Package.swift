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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.57-test.368/App.xcframework.zip",
            checksum: "1112307865c8bd46edcb12ae1e42e55b7f222c98fbb0081652b373f3b4e57965"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.57-test.368/Flutter.xcframework.zip",
            checksum: "9e61d7b12592cc1e4c07612387cfa76b2cdd1c298f4fc6f1a93db1926d9643c9"
        )
,
        // Flutter plugin: camera_avfoundation
        .binaryTarget(
            name: "camera_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.57-test.368/camera_avfoundation.xcframework.zip",
            checksum: "299c3b89a9a3f84ff4f133204b276003ce8003beb12a02223346c3398ed033f6"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.57-test.368/connectivity_plus.xcframework.zip",
            checksum: "3e9f541a097f4fca79f22c55e3ed53fee388b90bfcffffd362eb780113e7a597"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.57-test.368/device_info_plus.xcframework.zip",
            checksum: "81adf7ca2cde0a885d97b40ccb56b6a1acf0b6c69327db13df11077590959147"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.57-test.368/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "34b407d8c17bc6900bc5fb550c60616072186f98288e7a978c13e21fdce217cb"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.57-test.368/flutter_local_notifications.xcframework.zip",
            checksum: "9f8e50155b125b1ae70642e244ecb51a6e5be7c6610c35c93d8116c4c00491b8"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.57-test.368/flutter_native_timezone_latest.xcframework.zip",
            checksum: "8b25a81ce47b3cf276641f25d4dcc6050a7eb2cbbdaf581910122693f4be2b6b"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.57-test.368/flutter_secure_storage.xcframework.zip",
            checksum: "9c35fe1ceb4e2b30265046171e328fe87e0ce10484cc04f4e80d154da00253d4"
        )
,
        // Flutter plugin: flutter_web_auth_2
        .binaryTarget(
            name: "flutter_web_auth_2",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.57-test.368/flutter_web_auth_2.xcframework.zip",
            checksum: "c08cb4cd776f16b86f62b1b954d3280ae1927f1414ed0067cb158f15fbe72c57"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.57-test.368/geolocator_apple.xcframework.zip",
            checksum: "739dee1ce6a1433e07ccabf1d7e222d06949b2cd2bc0d6800888c1b3e8812d40"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.57-test.368/health.xcframework.zip",
            checksum: "ef5d3ae64306892f9df8c2c8d0a69aa527bb3d36e7e426b1527551dae4ef55fc"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.57-test.368/image_cropper.xcframework.zip",
            checksum: "dfb05e8d0b7a5dc907cf60f496ef97b6d99a1b5272e4bf9abd3d56fa1cda217b"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.57-test.368/image_picker_ios.xcframework.zip",
            checksum: "5812e5f7b63078e72a30aa8f02dd2d8f8ecb6120a99657f7c442576a21a46837"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.57-test.368/mapbox_maps_flutter.xcframework.zip",
            checksum: "5b400789ad655952d903203caa4c8f0e6b402d9d2ce4f896c0d9134dcaee4bb2"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.57-test.368/MapboxCommon.xcframework.zip",
            checksum: "5412dc6e5e1cb0f40edf9fcfac8f934fdd0b2f764de3cf39ebb4341e48171370"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.57-test.368/MapboxCoreMaps.xcframework.zip",
            checksum: "ea433c4b7a69ee676cbb3cd30baffc5ffba9c481921ebed42b886c20a465c903"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.57-test.368/MapboxMaps.xcframework.zip",
            checksum: "e59f9a0210cb5f1d2bb435aeefdb7733074adc917cabb93a5c5ebcddb652d6ff"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.57-test.368/NordicDFU.xcframework.zip",
            checksum: "de8d02f41336d010716e59f3ebcbfde74f5132a9541138f1c108ab9765f9923c"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.57-test.368/package_info_plus.xcframework.zip",
            checksum: "b9908dd2411f798d1802e61965afba03d369a8bffd35338b9f9be952723fe236"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.57-test.368/path_provider_foundation.xcframework.zip",
            checksum: "93e102809537de009fd166e264078d1ad5fe9c093d5f4bed2bd8556d5a29ead3"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.57-test.368/permission_handler_apple.xcframework.zip",
            checksum: "553bee59524c732b1a7254299c0b75dd490e443d8a9d01c3496e548f6d206da3"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.57-test.368/share_plus.xcframework.zip",
            checksum: "e653e38b1ff2c12fb731a56b3483f3a8272cc2cd6f5163ccbc3764a1f5e74444"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.57-test.368/shared_preferences_foundation.xcframework.zip",
            checksum: "866fb83137d9c26fd2259defba330a6831ddf891b10aaa2c308dadf8431e651b"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.57-test.368/sqflite_darwin.xcframework.zip",
            checksum: "8b6155676ba2b809000bfa4047ee76fa71cdbe236d6c2edc3667f8fa8ec056c7"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.57-test.368/TOCropViewController.xcframework.zip",
            checksum: "6b5c354b749cba39d6b0f554183aa98d5dcb66cc6f19fef9a30fff2e428e12fd"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.57-test.368/Turf.xcframework.zip",
            checksum: "d26d424c0e175b1143724d488354e49fef341159fee11087e9805626096b25c6"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.57-test.368/url_launcher_ios.xcframework.zip",
            checksum: "9e084dd0087ea0a2d89889ff48c056833693eca95dd90faf05c31a6249d77bcb"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.57-test.368/video_player_avfoundation.xcframework.zip",
            checksum: "857f4ca4db0516e0478ff52bfa10f8d54f12352197d6caaddf26bea2654a0ac6"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.57-test.368/wakelock_plus.xcframework.zip",
            checksum: "25f78d37853de4b322019408b9f271c1337453663a516c8ac8d06bf6fcfd8b07"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.57-test.368/ZIPFoundation.xcframework.zip",
            checksum: "3940ad9edc9af6d929618537e91bcf258cb2b0870b8b8e436258dff931487b7a"
        )
    ]
)
