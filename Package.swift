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
            dependencies: ["Flutter", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "FlutterPluginRegistrant",
            publicHeadersPath: "."
        ),

        // Swift wrapper API
        .target(
            name: "RollaSDK",
            dependencies: ["FlutterPluginRegistrant", "App", "Flutter", "connectivity_plus", "device_info_plus", "flutter_blue_plus_darwin", "flutter_local_notifications", "flutter_native_timezone_latest", "flutter_secure_storage", "geolocator_apple", "image_cropper", "image_picker_ios", "mapbox_maps_flutter", "MapboxCommon", "MapboxCoreMaps", "MapboxMaps", "NordicDFU", "package_info_plus", "path_provider_foundation", "permission_handler_apple", "share_plus", "shared_preferences_foundation", "sqflite_darwin", "TOCropViewController", "Turf", "url_launcher_ios", "video_player_avfoundation", "wakelock_plus", "ZIPFoundation"],
            path: "Sources"
        ),

        // Flutter module (Dart code compiled to native)
        .binaryTarget(
            name: "App",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test/App.xcframework.zip",
            checksum: "c8325cb20453b507b3b2ebfdb83b2bbeacaf20f7d9804e1519c5d49354c2b907"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test/Flutter.xcframework.zip",
            checksum: "2c3fa4021ff054a935cb9ba363b157796a3fe7940a81cf5d6d25cb804b0ea02f"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test/connectivity_plus.xcframework.zip",
            checksum: "d6de1c7003687c626db4b5303d7c1b1dbce4e711ab7b14aeb56e2ad026a8b4c1"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test/device_info_plus.xcframework.zip",
            checksum: "de59766c21136f27e3f1bee81a26d87a73414f7c1230ccec6fb7db96f7441150"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "7dddb35cb0ea303d151192b5174362dc8d857069b186e733a88637e9ecd9954c"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test/flutter_local_notifications.xcframework.zip",
            checksum: "c6ad142c7b6cf30e6a729d00b31cecfd9f96d7ad4b0e412bb640a77491e6fa6e"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test/flutter_native_timezone_latest.xcframework.zip",
            checksum: "01df228d36e1585eedabc4c4e5d3d50e5b0d1452f32a52f6c8e7f2953fcae6d5"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test/flutter_secure_storage.xcframework.zip",
            checksum: "2994bc52e8fbc98a9e37295e9340f9d812e187e20c23e742a1a4bc42336a23b8"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test/geolocator_apple.xcframework.zip",
            checksum: "882da450d8edc7ed8b7884cd14e2fe84d2078e40580cd74d3b414f6a60e5e343"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test/image_cropper.xcframework.zip",
            checksum: "1c4f7b51053d01a0ce8164685adbcb3c7d98c8831d1fd7c8e1d5321881334064"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test/image_picker_ios.xcframework.zip",
            checksum: "d6f8414081a0910ffe7cc437de7d4ce1bea90b0cbc36ef04ce8506d81d3e6599"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test/mapbox_maps_flutter.xcframework.zip",
            checksum: "1c2240d3ae8dcd173721dbc7f96b594c14b147dff28b78c2d02dbed59809a1f2"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test/MapboxCommon.xcframework.zip",
            checksum: "f6df729f2c8c9314123cd4badbe90cea51146e5b1d63dff8ca9957a5165f3de5"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test/MapboxCoreMaps.xcframework.zip",
            checksum: "c9150713e736ac46b8ba9ef0ab1cbef066c371a3a570fdd3132f2dc5956d7782"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test/MapboxMaps.xcframework.zip",
            checksum: "5308e9d70bfc29b948e590a28a236445d5b59a50fe94f5c1e5f5a62d53ce2c65"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test/NordicDFU.xcframework.zip",
            checksum: "fb31f090e93bee84cb5252b9fce703ef179a8848f10fc2a9ec08d3345a4c8441"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test/package_info_plus.xcframework.zip",
            checksum: "be8c2d2a422529909f05fc7f7caae87c59504ef1e9d23d4700eb12738ef2c026"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test/path_provider_foundation.xcframework.zip",
            checksum: "cd815d73f720f046c085b481ffa1f013c3b25f49d49ab4c6b9b38acc22bfc7e0"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test/permission_handler_apple.xcframework.zip",
            checksum: "69fb6ba16ba2a5994a03ecbf200f37f66842752fbe83ac4a13827483fe4c82f3"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test/share_plus.xcframework.zip",
            checksum: "cd4854ab601947d5c69d5922887e408e0233e8793d3611bf236e238690f6524a"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test/shared_preferences_foundation.xcframework.zip",
            checksum: "a3dbf4f16d6c354a4396cb9bd42ebcf2c10133841eb2e0a4df2ebf31dc4c4fee"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test/sqflite_darwin.xcframework.zip",
            checksum: "d46560b8ce2c8cffc5aeb4a6651ea7355215165d995fedf3b7dc39ed20c2bf3e"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test/TOCropViewController.xcframework.zip",
            checksum: "bb59c681a78a10d19cf434b31c3ef40d5665694ae2246b50296bf94e21717579"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test/Turf.xcframework.zip",
            checksum: "da83f60d8821fb8544160e4b7263746b5414e013041db03fd0446cd9e033e24f"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test/url_launcher_ios.xcframework.zip",
            checksum: "1d356eba8ece6a7b345c0da009c194d4a6041488cddd0e93da5cfb87f06d1d26"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test/video_player_avfoundation.xcframework.zip",
            checksum: "23f7e15f40831429cb8bc4fba14aa95f1997703071811ddfeab57b3d2f2bf7f4"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test/wakelock_plus.xcframework.zip",
            checksum: "84f5eec8354b4c5fe15941b3e591c5c58eeb43c4fd9864be50086bb1e6d67fed"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test/ZIPFoundation.xcframework.zip",
            checksum: "b7f72c9667a412ff9de8ed6974d3d7066cf6a62f0b4082e492f919935772ffdd"
        )
    ]
)
