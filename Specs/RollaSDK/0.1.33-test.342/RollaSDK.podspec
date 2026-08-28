# ==============================================================================
# RollaSDK - Flutter-based Health & Fitness SDK for iOS
# ==============================================================================
# This podspec provides binary distribution of the Rolla SDK for native iOS apps.
# The SDK is built with Flutter but distributed as pre-compiled XCFrameworks,
# so consumers don't need Flutter installed.
#
# WHAT'S INCLUDED:
# • App.xcframework - Your compiled Dart code + all pure Dart dependencies
#   (flutter_bloc, dio, go_router, get_it, dartz, fl_chart, hive, etc.)
# • Flutter.xcframework - Flutter engine runtime
# • Vendored Plugin XCFrameworks - Native iOS implementations for device features
#   (HealthKit, GPS, Bluetooth, Camera, Notifications, etc.)
# • Swift wrapper API - Native iOS interface (no Flutter knowledge required)
#
# BINARY DISTRIBUTION:
# All frameworks are pre-built during CI release and downloaded from GitHub.
# No compilation required during pod install (fast integration).
# ==============================================================================

Pod::Spec.new do |s|
  s.name             = 'RollaSDK'
  s.version          = '0.1.33-test.342'
  s.summary          = 'Rolla Health & Fitness SDK for iOS (Binary Distribution)'
  s.description      = <<-DESC
    The Rolla SDK provides comprehensive health and fitness functionality for
    native iOS apps. Built with Flutter, distributed as pre-compiled XCFrameworks.

    FEATURES:
    • Activity tracking (running, cycling, gym workouts, etc.)
    • Health data integration (HealthKit, Garmin, Apple Health)
    • Real-time GPS tracking with Mapbox maps
    • Bluetooth band connectivity
    • Metrics dashboard & analytics
    • User profile & goal management

    BINARY DISTRIBUTION:
    This pod includes all frameworks pre-compiled:
    • No Flutter SDK required on consumer machines
    • Fast pod install (no compilation)
    • 100+ MB of pre-built frameworks
    • Swift wrapper API for native iOS integration

    WHAT'S BUNDLED:
    • 1 App.xcframework (your Dart code + pure Dart packages)
    • 1 Flutter.xcframework (Flutter engine)
    • Vendored Plugin frameworks (native iOS implementations)
    • 6 Third-party frameworks (Mapbox, image processing, etc.)

    See GitHub for full integration guide and documentation.
  DESC

  s.homepage         = 'https://github.com/Rolla-Health-Fitness/rolla-sdk'
  s.license          = { :type => 'MIT' }
  s.author           = { 'Rolla' => 'dev@rolla.cloud' }

  s.source           = {
    :http => 'https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.33-test.342/RollaSDK-iOS-0.1.33-test.342.zip'
  }

  s.ios.deployment_target = '14.0'
  s.swift_version = '5.0'

  # Swift wrapper sources
  s.source_files = 'Sources/**/*.swift', 'FlutterPluginRegistrant/*.{h,m}'

  # Expose Objective-C headers to Swift
  s.public_header_files = 'FlutterPluginRegistrant/*.h'

  # ============================================================================
  # VENDORED FRAMEWORKS
  # ============================================================================
  # This section lists all pre-built XCFrameworks included in the SDK.
  # These frameworks are compiled during the CI release build and bundled
  # in the CocoaPods distribution.
  #
  # UNDERSTANDING WHAT'S INSIDE EACH FRAMEWORK:
  #
  # 1. App.xcframework (Compiled Dart Code)
  #    - Contains ALL pure Dart packages from pubspec.yaml
  #    - These packages have NO native iOS code, only Dart
  #    - Examples: flutter_bloc, bloc, go_router, dio, dartz, freezed,
  #      get_it, injectable, fl_chart, hive, flutter_svg, cached_network_image,
  #      lottie, equatable, uuid, intl, timezone, etc.
  #    - The Dart code is compiled to native ARM64 machine code and packaged
  #      into this single binary framework
  #
  # 2. Flutter.xcframework (Flutter Engine)
  #    - The Flutter runtime engine that executes Dart code
  #    - Provides rendering, platform channels, Dart VM, etc.
  #    - This is the core Flutter engine, NOT your app's Dart code
  #
  # 3. Plugin XCFrameworks (Native iOS Implementations)
  #    - Each plugin below has native iOS/Swift code that bridges Flutter to iOS APIs
  #    - These are listed separately because they contain platform-specific code
  #      that can't be compiled into App.xcframework
  #    - Examples:
  #      • apple_health → HealthKit integration
  #      • geolocator_apple → CoreLocation for GPS
  #      • image_picker_ios → Photos framework access
  #      • flutter_secure_storage → Keychain access
  #      • permission_handler_apple → Permission dialogs
  #      • mapbox_maps_flutter → Native Mapbox SDK
  #
  # WHY PURE DART PACKAGES AREN'T LISTED SEPARATELY:
  # Packages like flutter_bloc, dio, go_router, etc. don't appear in this list
  # because they're already compiled into App.xcframework. Only packages with
  # native iOS implementations need their own .xcframework file.
  #
  # This list is kept in sync with pubspec.yaml during the release build.
  # The validation step in .github/workflows/release.yml ensures all built
  # plugin frameworks are declared here.
  # ============================================================================
  s.vendored_frameworks = [
    # ----------------------------------------------------------------------------
    # CORE FLUTTER FRAMEWORKS
    # ----------------------------------------------------------------------------
    # These two frameworks are required for any Flutter module
    'App.xcframework',      # Your app's compiled Dart code + all pure Dart dependencies
    'Flutter.xcframework',  # Flutter engine runtime

    # ----------------------------------------------------------------------------
    # FLUTTER PLUGINS (Native iOS Implementations)
    # ----------------------------------------------------------------------------
    # Each plugin below has native iOS code and requires its own framework.
    # The list is alphabetically sorted for maintainability.

    # NOTE: apple_health is no longer listed here. It used to be a standalone
    # Flutter plugin (emitting apple_health.xcframework); its sources are now
    # vendored into the SDK (Classes/AppleHealth/**, compiled into the pod),
    # so flutter build no longer emits a separate apple_health.xcframework.
    'connectivity_plus.xcframework',
    'device_info_plus.xcframework',
    'flutter_blue_plus_darwin.xcframework',
    'flutter_local_notifications.xcframework',
    'flutter_native_timezone_latest.xcframework',
    'flutter_secure_storage.xcframework',
    'geolocator_apple.xcframework',
    'health.xcframework',
    'image_cropper.xcframework',
    'image_picker_ios.xcframework',
    'mapbox_maps_flutter.xcframework',
    'package_info_plus.xcframework',
    'path_provider_foundation.xcframework',
    'permission_handler_apple.xcframework',
    'share_plus.xcframework',
    'shared_preferences_foundation.xcframework',
    'sqflite_darwin.xcframework',
    'url_launcher_ios.xcframework',
    'video_player_avfoundation.xcframework',
    'wakelock_plus.xcframework',

    # ----------------------------------------------------------------------------
    # THIRD-PARTY NATIVE DEPENDENCIES
    # ----------------------------------------------------------------------------
    # These frameworks are transitive dependencies of Flutter plugins above.
    # They must be bundled (vendored) rather than fetched via CocoaPods because
    # the plugin xcframeworks were compiled against specific binary versions.
    # Using pod dependencies would cause ABI/symbol mismatches at runtime.

    # Mapbox transitive dependencies (required by mapbox_maps_flutter)
    'MapboxMaps.xcframework',      # Mapbox Maps SDK
    'MapboxCommon.xcframework',    # Mapbox shared utilities
    'MapboxCoreMaps.xcframework',  # Mapbox core mapping engine
    'Turf.xcframework',            # Geospatial geometry calculations

    # Image processing dependencies (required by image_cropper)
    'NordicDFU.xcframework',       # Nordic Device Firmware Update (used by image processing)
    'TOCropViewController.xcframework' # Native crop view controller

    # NOTE: ZIPFoundation is NOT vendored here - see source dependency below.
    # It's compiled from source to avoid Swift ABI version mismatches between
    # the pre-built binary and the consumer app's Swift version.
  ]

  # ----------------------------------------------------------------------------
  # SOURCE DEPENDENCIES (Compiled with Consumer's Swift Version)
  # ----------------------------------------------------------------------------
  # These dependencies are NOT vendored as pre-built frameworks. Instead,
  # CocoaPods fetches the source code and compiles it with the consumer app's
  # Swift version. This avoids Swift ABI compatibility issues.
  #
  # ZIPFoundation: Used by file compression features. Must be source-compiled
  # because pre-built Swift frameworks fail when Swift versions differ between
  # build time and consumer app (e.g., SDK built with Swift 5.9, app uses 5.10).
  s.dependency 'ZIPFoundation', '~> 0.9'

  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES'
  }
end
