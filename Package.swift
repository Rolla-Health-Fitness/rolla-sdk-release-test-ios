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
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.250.1/App.xcframework.zip",
            checksum: "f65a2155925fdca544421219b29bfd24805e96807ffd8751e1e39fdb7240ab5b"
        ),

        // Flutter engine runtime
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.250.1/Flutter.xcframework.zip",
            checksum: "112f9271d8a10faa0e66aed1cd12a91fdfb40aea849da72575606279f635b816"
        )
,
        // Flutter plugin: apple_health
        .binaryTarget(
            name: "apple_health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.250.1/apple_health.xcframework.zip",
            checksum: "caddd6b72d04c266f9a3bd9f5a1fcfa1cc3a815f6ea6c62bb220c2b1f192a0fe"
        )
,
        // Flutter plugin: connectivity_plus
        .binaryTarget(
            name: "connectivity_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.250.1/connectivity_plus.xcframework.zip",
            checksum: "7fe186dff620ea3a4e47ec5ba79ba4f97fb03f3146c451955b79ae8a88713b2e"
        )
,
        // Flutter plugin: device_info_plus
        .binaryTarget(
            name: "device_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.250.1/device_info_plus.xcframework.zip",
            checksum: "9f3c90b4c34579171c8b0a85bc36252d203a277d172f77a9efde33dfd359ee44"
        )
,
        // Flutter plugin: flutter_blue_plus_darwin
        .binaryTarget(
            name: "flutter_blue_plus_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.250.1/flutter_blue_plus_darwin.xcframework.zip",
            checksum: "a3c34635882c305362a6629e1197bf0f0ae601d31d8357af7177ff375478ca64"
        )
,
        // Flutter plugin: flutter_local_notifications
        .binaryTarget(
            name: "flutter_local_notifications",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.250.1/flutter_local_notifications.xcframework.zip",
            checksum: "0b51428ffafe862a87e8dae98cdb74febd89984f99d3d53fac7e98764a89c60d"
        )
,
        // Flutter plugin: flutter_native_timezone_latest
        .binaryTarget(
            name: "flutter_native_timezone_latest",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.250.1/flutter_native_timezone_latest.xcframework.zip",
            checksum: "626ec3c8819edb8e08c6b8c2c5101be3a3cf288df46546a337a3632d01d97d79"
        )
,
        // Flutter plugin: flutter_secure_storage
        .binaryTarget(
            name: "flutter_secure_storage",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.250.1/flutter_secure_storage.xcframework.zip",
            checksum: "4247486305b1d0f38b6686f85284658141bf07eda6ccb7f5fce244c183f3490f"
        )
,
        // Flutter plugin: geolocator_apple
        .binaryTarget(
            name: "geolocator_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.250.1/geolocator_apple.xcframework.zip",
            checksum: "b2109a0023c1ca21f8f31f5198f340d0657af426ccd654ebeeb35f025ccc1d6c"
        )
,
        // Flutter plugin: health
        .binaryTarget(
            name: "health",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.250.1/health.xcframework.zip",
            checksum: "a93799a0dbe6f79e53718e4707e360312cc09c6ecad290c0300bd2c38a44fb74"
        )
,
        // Flutter plugin: image_cropper
        .binaryTarget(
            name: "image_cropper",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.250.1/image_cropper.xcframework.zip",
            checksum: "d3334884c5bbf8b43ded320b05d330ab08b5231dc4783857597f9528652cb201"
        )
,
        // Flutter plugin: image_picker_ios
        .binaryTarget(
            name: "image_picker_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.250.1/image_picker_ios.xcframework.zip",
            checksum: "bae8c9351117d03d35ca7445daa26aef27bf0deab34ae46d3f320b6ac3887bed"
        )
,
        // Flutter plugin: mapbox_maps_flutter
        .binaryTarget(
            name: "mapbox_maps_flutter",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.250.1/mapbox_maps_flutter.xcframework.zip",
            checksum: "047d9004088f4ee70699d35aa223a12acf9716c07bd1acee49ca31ea59be5dae"
        )
,
        // Flutter plugin: MapboxCommon
        .binaryTarget(
            name: "MapboxCommon",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.250.1/MapboxCommon.xcframework.zip",
            checksum: "5e8e16a49b90b06af05e668356cd541c8256e2707cfd236e4b1bbb301227e620"
        )
,
        // Flutter plugin: MapboxCoreMaps
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.250.1/MapboxCoreMaps.xcframework.zip",
            checksum: "c1adda85ef51cd353a26128928bec2628c6f7431b2b29e23d092f1910fe4348b"
        )
,
        // Flutter plugin: MapboxMaps
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.250.1/MapboxMaps.xcframework.zip",
            checksum: "e8e175a18d6db89e3af8403332020b0158f0ea219fb4bc92d251a31dada0244e"
        )
,
        // Flutter plugin: NordicDFU
        .binaryTarget(
            name: "NordicDFU",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.250.1/NordicDFU.xcframework.zip",
            checksum: "4faaa9a56eb06718e422320dfd11d7f33141dc951b8b0807d87da9e573be688a"
        )
,
        // Flutter plugin: package_info_plus
        .binaryTarget(
            name: "package_info_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.250.1/package_info_plus.xcframework.zip",
            checksum: "eaa5fa269954828b655cda1f56678a524d9f6345badaf61cd0de8986f6375d34"
        )
,
        // Flutter plugin: path_provider_foundation
        .binaryTarget(
            name: "path_provider_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.250.1/path_provider_foundation.xcframework.zip",
            checksum: "4b587971f8bd89bc4d39f0f5574379238a6aa0e5eb6b287aad818a030d8303e9"
        )
,
        // Flutter plugin: permission_handler_apple
        .binaryTarget(
            name: "permission_handler_apple",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.250.1/permission_handler_apple.xcframework.zip",
            checksum: "456609c9b76573e93363886251b17511d752aea7a210a5fc2664b8d00b3ecbc6"
        )
,
        // Flutter plugin: share_plus
        .binaryTarget(
            name: "share_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.250.1/share_plus.xcframework.zip",
            checksum: "014b051af1556a77298a3dd25b014edc2149afc7008db67d0a3e491a839638ec"
        )
,
        // Flutter plugin: shared_preferences_foundation
        .binaryTarget(
            name: "shared_preferences_foundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.250.1/shared_preferences_foundation.xcframework.zip",
            checksum: "7e4bf6742e7ea1782a670ae6b1c66f35cb5411b7232f28c9f8752a817989e5ad"
        )
,
        // Flutter plugin: sqflite_darwin
        .binaryTarget(
            name: "sqflite_darwin",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.250.1/sqflite_darwin.xcframework.zip",
            checksum: "fdb554df4800e8572155950de624f430b096600054d4c797460b2633e8435e69"
        )
,
        // Flutter plugin: TOCropViewController
        .binaryTarget(
            name: "TOCropViewController",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.250.1/TOCropViewController.xcframework.zip",
            checksum: "71e11bf4501f591fe058f45819e48e4f0ddebecb4fe537cba18f87092a02cdca"
        )
,
        // Flutter plugin: Turf
        .binaryTarget(
            name: "Turf",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.250.1/Turf.xcframework.zip",
            checksum: "b354de91a5053451ad6c5eac57dba4d3a358670c6465561b38a03a52dc945f54"
        )
,
        // Flutter plugin: url_launcher_ios
        .binaryTarget(
            name: "url_launcher_ios",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.250.1/url_launcher_ios.xcframework.zip",
            checksum: "3abcbe065a7f910a7134207a6a1b0175ef0007b4e46404d228ab39f45ab46817"
        )
,
        // Flutter plugin: video_player_avfoundation
        .binaryTarget(
            name: "video_player_avfoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.250.1/video_player_avfoundation.xcframework.zip",
            checksum: "b0bc5c6a605d606211dc8ad659088def36ff4b4e205efafb1c91872a6f196110"
        )
,
        // Flutter plugin: wakelock_plus
        .binaryTarget(
            name: "wakelock_plus",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.250.1/wakelock_plus.xcframework.zip",
            checksum: "52e16e78323f7b46e44b3978c66f4d3db828993092a81b80d6a14c3c220d17c0"
        )
,
        // Flutter plugin: ZIPFoundation
        .binaryTarget(
            name: "ZIPFoundation",
            url: "https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.1-test.250.1/ZIPFoundation.xcframework.zip",
            checksum: "9f63d1bc0ded6591fa605d42f85b827184ffda3a911bac2ead0b31dcfa413833"
        )
    ]
)
