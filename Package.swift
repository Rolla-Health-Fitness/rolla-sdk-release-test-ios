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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.32-test.341/App.xcframework.zip",
            checksum: "eeadf3af091a79fa02786d9bf12fd5f83da6853670f9c88a3b49aea391bc9ede"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.32-test.341/Flutter.xcframework.zip",
            checksum: "028c411d36c7d903e888e74ee6040176ce6e12a4ec2d70477b670dbaa410ebfc"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.32-test.341/connectivity_plus.xcframework.zip",
            checksum: "665f6a4a8ba00804156ba2cab85670e03bd200d72b6f423e81f4177d477ea1c0"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.32-test.341/device_info_plus.xcframework.zip",
            checksum: "2003114bb0c116197686d3ba33ecead359846789e71b8f41f3acca7e540478e1"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.32-test.341/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "81c9f5a44aafb56f985939004ec808814ee0dedcf5f70d1ff9626520fb6bfae3"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.32-test.341/flutter_local_notifications.xcframework.zip",
            checksum: "1d08b3339647db3d3325cdf5f6784b7ba24f7557b7ac1365432f0c12ac9a3afc"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.32-test.341/flutter_native_timezone_latest.xcframework.zip",
            checksum: "a42311551d7aacd59cae47d3f3fbe6160303367d7481b1f789c5fd8594fe02a2"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.32-test.341/flutter_secure_storage.xcframework.zip",
            checksum: "7b5af292889cb3541bf65f1c23c27faec453ef63a0eb20f063492251e72e48a5"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.32-test.341/geolocator_apple.xcframework.zip",
            checksum: "ba71567b70b604a047da2d0a416e50c9ca6f88f577af52534d21f375fdd0a553"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.32-test.341/health.xcframework.zip",
            checksum: "916eea2a0f242812d9bd58cd948b44f68e54b7201be56309fd72055f62ad6baa"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.32-test.341/image_cropper.xcframework.zip",
            checksum: "12f95f1d12e500c2cc8d76e7f1a2a9bd057cb130dac477e6dccbed9f5a949966"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.32-test.341/image_picker_ios.xcframework.zip",
            checksum: "7f5bc8ee327b3d4843ece7156a0128b5675b11664c2b1306c3f63c7e6fc524d1"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.32-test.341/mapbox_maps_flutter.xcframework.zip",
            checksum: "3bad509ad18b4df9002860b92dce302ce0ac39a93276fb2747ae5b24d4fa97c8"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.32-test.341/MapboxCommon.xcframework.zip",
            checksum: "7a978c85aad09d529249f550fa92c88b25369865a64f713b391a444566f2d49e"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.32-test.341/MapboxCoreMaps.xcframework.zip",
            checksum: "e86585994b2148c47db457611e4f2579e0c648b1d1d95434735b8a5254117b36"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.32-test.341/MapboxMaps.xcframework.zip",
            checksum: "80835ac1b1ef1f95843b0151d60c434bf25c55fcc4aed8ae5880b625494dc86a"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.32-test.341/NordicDFU.xcframework.zip",
            checksum: "fbcd10b92eb92011fad741f30607c6772927ff320e8b7d0d331e844089ecadcd"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.32-test.341/package_info_plus.xcframework.zip",
            checksum: "a509cd003cb0215c190e409ef4a7a28537fd316ba2d41c98021408627fd6a719"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.32-test.341/path_provider_foundation.xcframework.zip",
            checksum: "2786910229d5bfbda47eb97587380024fb55199b5366085c8b7123de3a234b9e"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.32-test.341/permission_handler_apple.xcframework.zip",
            checksum: "3d24c8d75511a0c0b0363f20a4b4dd2740cad7ea2f42d42861386c60318ac2fc"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.32-test.341/share_plus.xcframework.zip",
            checksum: "092af47f97e3b868ce78489adb21d41746ad3e8be15cfcf94adc3579374167f9"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.32-test.341/shared_preferences_foundation.xcframework.zip",
            checksum: "f23f9459cc3576981f6fb4c7c21294f60f07bc18fcc02a90a57151df1a5a822a"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.32-test.341/sqflite_darwin.xcframework.zip",
            checksum: "97b0bb2416b550e58e1aed14784f6020881f434689ea3e6862172fb14a56d1e0"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.32-test.341/TOCropViewController.xcframework.zip",
            checksum: "5001db5169a580d3231829e80d57ad187c82863b6cba0edc44bd7587b91beb8b"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.32-test.341/Turf.xcframework.zip",
            checksum: "a952b01b451de0531eea81f5a06d1fd3f9a8678530640590468f87640dcb0d5f"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.32-test.341/url_launcher_ios.xcframework.zip",
            checksum: "022e4fd9e05ac59299e849f9463e24354f64ad29929b3437d3f371634b2173e2"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.32-test.341/video_player_avfoundation.xcframework.zip",
            checksum: "1cb687fe66d4470112ac3fa68268fa410376b68a0616cde85e33598081555ce5"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.32-test.341/wakelock_plus.xcframework.zip",
            checksum: "f9600a46da1cf7b368056ea9d1ff12c6779a1060b873296797c046616de0ba53"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.32-test.341/ZIPFoundation.xcframework.zip",
            checksum: "482f8da4c5ad885b2b57db7102b64eeed707a5372b45fdf36bc4b18a5dd88971"
        )
    ]
)
