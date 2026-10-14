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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.47-test.358/App.xcframework.zip",
            checksum: "3a650136960f761afd20442f59e975a53fa23d2053dab8b57201a9187323b116"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.47-test.358/Flutter.xcframework.zip",
            checksum: "d43eb9a8ae9690d24edb296fa15e4318a8b973b62ea7dfca2d91b1975b73f15b"
        )
,
        // Flutter plugin: camera_avfoundation
        .binaryTarget(
            name: "camera_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.47-test.358/camera_avfoundation.xcframework.zip",
            checksum: "ea898991053d26424994ee40ba58b9b4a404487f7eda075d74760b6e292a24cc"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.47-test.358/connectivity_plus.xcframework.zip",
            checksum: "1a9077bde6ad2a2b1882a1ac74c3a6827926fe0bd704d5e8fd80a4972a2d73ff"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.47-test.358/device_info_plus.xcframework.zip",
            checksum: "44e12df483cf9273c1c041f2a2baee406e2d76d4de29dd801898951789cc21e4"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.47-test.358/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "5e8d9f66116a837ba050f486b6ed216aaf99d2b0412a90b6bc1fd97dfa5b1b33"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.47-test.358/flutter_local_notifications.xcframework.zip",
            checksum: "3288403f8b629957d4b38e0bb27bd8835ae3fd8aafbc543bb774b72209e0b2bd"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.47-test.358/flutter_native_timezone_latest.xcframework.zip",
            checksum: "5e00c1db6c9bb3201e21bc101706b85235620dd0e91ee99330a3d139441f1370"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.47-test.358/flutter_secure_storage.xcframework.zip",
            checksum: "dab813fe3261c62915f48e8faa939f1b5e497e455de59f447e7e712e60e9ab6e"
        )
,
        // Flutter plugin: flutter_web_auth_2
        .binaryTarget(
            name: "flutter_web_auth_2",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.47-test.358/flutter_web_auth_2.xcframework.zip",
            checksum: "5bfeddaead0b050b8c3358489ba4d72e6027fea120bf158c1d0a32e82da43deb"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.47-test.358/geolocator_apple.xcframework.zip",
            checksum: "99721155c2442b3b425e0012af44e6c2381ae389a8274385baddc70b2ccf527b"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.47-test.358/health.xcframework.zip",
            checksum: "918e7e0c3219f252dc3684dadc607ef2ae34e5f1fd15df5dc29ae2d1889eb2a4"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.47-test.358/image_cropper.xcframework.zip",
            checksum: "48469fca8a429a652674fb1c9cf13422c40e2860c253d5bcf88cee87c90ee3d6"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.47-test.358/image_picker_ios.xcframework.zip",
            checksum: "b23cf7c4a4176a9aa8e2f555a0b3a5e1362a087c3bbe4fab8e26152708f61a41"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.47-test.358/mapbox_maps_flutter.xcframework.zip",
            checksum: "7feadf1783f57663e528501cb1ef80dc0583d60b33ee4fa78bedc53d01afdb9f"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.47-test.358/MapboxCommon.xcframework.zip",
            checksum: "38ac18b593ffe0b6f565219afc35e50f649dd9ed7ce8a95ff2d3e23e160450e5"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.47-test.358/MapboxCoreMaps.xcframework.zip",
            checksum: "18cb2ed5261e26cc48b529dbd049fbb8f8b8f7c3e0ea592da133414111edf068"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.47-test.358/MapboxMaps.xcframework.zip",
            checksum: "6a3b4ce2919417a5a9bdb532067d0cebdae571d50dd871a83709ce40ec75a19b"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.47-test.358/NordicDFU.xcframework.zip",
            checksum: "03a7012ff8e76fba9f786fbb0985e1534a8b69a6a9bcba7aeca7f9b403753fc3"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.47-test.358/package_info_plus.xcframework.zip",
            checksum: "3e16225dd5b8152a5d51f22188a7d7f1566d4effca5ee66930e8f60c0912f748"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.47-test.358/path_provider_foundation.xcframework.zip",
            checksum: "ff183589a6be447a9c086c348779a2cd8c288dc0263dca990d1c39a4912c393a"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.47-test.358/permission_handler_apple.xcframework.zip",
            checksum: "345a5bbe7032c60121a5c7a719f8b12a161851058cc5f15c6f4fc706981c2b8c"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.47-test.358/share_plus.xcframework.zip",
            checksum: "5d4b2434b218aa4738a242300358d877abf0e9dbffd113b6cb39136ece9307ab"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.47-test.358/shared_preferences_foundation.xcframework.zip",
            checksum: "3391f75a96ef1dda9e8deafb475b0c84cbc5d56cb119125e7b8a2904cd0ef8ac"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.47-test.358/sqflite_darwin.xcframework.zip",
            checksum: "5bedb203b5d2def15e0494b5347387771cf595b412958ad541f538ab38198a36"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.47-test.358/TOCropViewController.xcframework.zip",
            checksum: "8fb1f0cad0ecef5f43a5c7a8e412e3555754d532ea2cd065d8419a3515506e80"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.47-test.358/Turf.xcframework.zip",
            checksum: "4ea1828f092c4f1fcd48382c0485234a3745723149f17da9098b023d7cfc55a9"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.47-test.358/url_launcher_ios.xcframework.zip",
            checksum: "440aa4ac1b9b07d8b4ff7165422582e8577515b319eb58d944dd42298e95fa20"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.47-test.358/video_player_avfoundation.xcframework.zip",
            checksum: "8b2ed9f0a9c52eb96d7f91b4b9d726798141930d739562cc49c25745d0e1cf2e"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.47-test.358/wakelock_plus.xcframework.zip",
            checksum: "5a4daa68ede41fbdf9b285b1c8c4c37bf6c7c8e3ffe5b71a9482d4b070a25715"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.47-test.358/ZIPFoundation.xcframework.zip",
            checksum: "e86eb81e2914458987b9f18b633d8f1149b369239b8f53722e4fcb8927c34cbf"
        )
    ]
)
