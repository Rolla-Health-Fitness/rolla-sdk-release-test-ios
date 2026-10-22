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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.49-test.360/App.xcframework.zip",
            checksum: "2b554f34f5c83d0523271e475055a612dcda04e7d355b9d70274a94d9c01cdcd"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.49-test.360/Flutter.xcframework.zip",
            checksum: "2d21b08999abbfcc9fc555f80e7a96cca79f7327396c090173a7932b08f20a02"
        )
,
        // Flutter plugin: camera_avfoundation
        .binaryTarget(
            name: "camera_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.49-test.360/camera_avfoundation.xcframework.zip",
            checksum: "f2203c2df800a2c6669c87b1814dea1d4eb481dc9d342054aa2a8daf28c55f99"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.49-test.360/connectivity_plus.xcframework.zip",
            checksum: "a3fe6b71c85689f121b9dc54147a4b5ecce90ffd64e445f61c278722f11b18ea"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.49-test.360/device_info_plus.xcframework.zip",
            checksum: "7514b6f9dd2824b8abc9fd44d896de680cab50bfa7512131c1d6fa925d6e29b8"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.49-test.360/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "1a05d41a059032f22fe566dee9b3aabc1805f87a494717f7bf90ffcf8923409c"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.49-test.360/flutter_local_notifications.xcframework.zip",
            checksum: "492e3808e30116ebb8fad7b10d90de4bd38cdd3f75fbff3b523213f42e88f948"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.49-test.360/flutter_native_timezone_latest.xcframework.zip",
            checksum: "8170ed64ba1689685b35e435c1a1c8c0ec5dae76a37429529f23dbb689c304ec"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.49-test.360/flutter_secure_storage.xcframework.zip",
            checksum: "27cc14d25e8f08277d7f5b49e1c6cb9849b6572fb0c7360ee47c09d1a1d42428"
        )
,
        // Flutter plugin: flutter_web_auth_2
        .binaryTarget(
            name: "flutter_web_auth_2",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.49-test.360/flutter_web_auth_2.xcframework.zip",
            checksum: "0f44de81a0c4dfb691a160502d874f1b7943f321342f927063b2dc35ecab1174"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.49-test.360/geolocator_apple.xcframework.zip",
            checksum: "22f934c005e9b05cb5ecc1e3db0ca8d9d1b97c3dc6d4531d953139f342dcf1cf"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.49-test.360/health.xcframework.zip",
            checksum: "66d9084b724d1270a6e42023db200c83a03891d288d3b0a34149b6f6a014d7ab"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.49-test.360/image_cropper.xcframework.zip",
            checksum: "b309b42e9a2b2c712f2feef9fc879a21c534cc608002b925e83daa4af0118924"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.49-test.360/image_picker_ios.xcframework.zip",
            checksum: "529d4197e22fda838aa66dfacf94167bbf756b74ae327158995c04148e800235"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.49-test.360/mapbox_maps_flutter.xcframework.zip",
            checksum: "b71fcfb5adc256f3c4faea8c1c4101901ccf561d15f39738bfbcd523cd9caf88"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.49-test.360/MapboxCommon.xcframework.zip",
            checksum: "ec77c1a0af74190fa1363d43ae0d5eb790d25b264071247e430b3d0d22fc0170"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.49-test.360/MapboxCoreMaps.xcframework.zip",
            checksum: "54689df5dcbc764b0bbb4f8e4365a84ae71bb4f4ac92739b7d65691579730b97"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.49-test.360/MapboxMaps.xcframework.zip",
            checksum: "a4581af1f0ef06644ec4983c76dc9d0a199e32ed2b6def6c475f24fa271a1f3d"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.49-test.360/NordicDFU.xcframework.zip",
            checksum: "2a4c589e07b1a2654934992d70ced91863781f6c612a373166be191f005b1393"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.49-test.360/package_info_plus.xcframework.zip",
            checksum: "a3028ff07dd217d32e0310b6bcf495bfa7e7e1c478f86e93973c4f1765b2adca"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.49-test.360/path_provider_foundation.xcframework.zip",
            checksum: "f523e5d046a0f6ecec255cd9188399b222f8fd0c3d73bf046d1f24a8b222763d"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.49-test.360/permission_handler_apple.xcframework.zip",
            checksum: "f2bfab6d255410b7c8f3ed20a3fb1d6691eb26d25bd83c629f1cdd2722393759"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.49-test.360/share_plus.xcframework.zip",
            checksum: "df01d571df9e77b74a158a87d0e3cee7a410a03529ad37cab33ec337ff14ebe8"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.49-test.360/shared_preferences_foundation.xcframework.zip",
            checksum: "48544a2c87672ceb5eeef25d08c7ffafa0f31276f9e44f85160d661ca2f5e51b"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.49-test.360/sqflite_darwin.xcframework.zip",
            checksum: "384b8cc8dcd364a896698f7a2d608517c04911adab71c1fa30d42df17782f412"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.49-test.360/TOCropViewController.xcframework.zip",
            checksum: "94525f9d9c7c59eb0d55392d85ecc2e2d1f407b80f98a4ca5b628239ad7fdd78"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.49-test.360/Turf.xcframework.zip",
            checksum: "25a4e6f925a2d9c549bc4102465483ad36c772a56713296a87ac124f39c9d4b1"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.49-test.360/url_launcher_ios.xcframework.zip",
            checksum: "7a28c4ea89c9f4f94db244050cca167673385729dbac2fb673944b4c3cc692da"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.49-test.360/video_player_avfoundation.xcframework.zip",
            checksum: "657238c7bfc94a37481ac5e7dd1078a1af3efd180cb30138a2b0da0ff8caeb15"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.49-test.360/wakelock_plus.xcframework.zip",
            checksum: "ad0a1d44ef3dd16007d3b056526f1ed12e9041a2df36ec4ca68976df7a8f6fac"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.49-test.360/ZIPFoundation.xcframework.zip",
            checksum: "70c544e5c2d08136c214b2582ae23ad0ff301b4442befcad9ef5f2056ed23294"
        )
    ]
)
