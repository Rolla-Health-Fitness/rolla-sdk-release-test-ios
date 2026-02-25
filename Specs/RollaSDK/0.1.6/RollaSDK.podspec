Pod::Spec.new do |s|
  s.name             = 'RollaSDK'
  s.version          = '0.1.6'
  s.summary          = 'Rolla Health & Fitness SDK for iOS'
  s.description      = <<-DESC
    The Rolla SDK provides health and fitness functionality for native iOS apps.

    This pod includes:
    - Pre-built XCFrameworks (no Flutter SDK required)
    - Swift wrapper API (Rolla, RollaDelegate, RollaConfiguration, etc.)
  DESC

  s.homepage         = 'https://github.com/Rolla-Health-Fitness/rolla-sdk'
  s.license          = { :type => 'MIT' }
  s.author           = { 'Rolla' => 'dev@rolla.cloud' }

  s.source           = {
    :http => 'https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios/releases/download/0.1.6-test/RollaSDK-iOS-0.1.6.zip'
  }

  s.ios.deployment_target = '14.0'
  s.swift_version = '5.0'

  # Swift wrapper sources
  s.source_files = 'Sources/**/*.swift', 'FlutterPluginRegistrant/*.{h,m}'

  # Expose Objective-C headers to Swift
  s.public_header_files = 'FlutterPluginRegistrant/*.h'

  # Pre-built Flutter frameworks and plugins
  # This list is dynamically generated based on pubspec.yaml dependencies
  # Last updated: Auto-generated during release build
  s.vendored_frameworks = [
    # Core Flutter frameworks
    'App.xcframework',
    'Flutter.xcframework',
    
    # Flutter plugins
    'connectivity_plus.xcframework',
    'device_info_plus.xcframework',
    'flutter_blue_plus_darwin.xcframework',
    'flutter_local_notifications.xcframework',
    'flutter_native_timezone_latest.xcframework',
    'flutter_secure_storage.xcframework',
    'geolocator_apple.xcframework',
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
    
    # Third-party dependencies (vendored)
    # Mapbox frameworks MUST be bundled (not fetched via pod dependency) because
    # mapbox_maps_flutter.xcframework was compiled against specific binaries.
    # Using pod dependency causes ABI/symbol mismatch at runtime.
    'MapboxMaps.xcframework',
    'MapboxCommon.xcframework',
    'MapboxCoreMaps.xcframework',
    'Turf.xcframework',
    'NordicDFU.xcframework',
    'TOCropViewController.xcframework'
    # NOTE: ZIPFoundation is NOT vendored - it's a source dependency below
    # to avoid Swift version mismatch errors with pre-built binaries
  ]

  # Source dependencies (compiled with consumer's Swift version)
  # ZIPFoundation must be source-compiled to avoid Swift ABI mismatch
  # (pre-built xcframeworks fail when Swift versions differ)
  s.dependency 'ZIPFoundation', '~> 0.9'

  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES'
  }
end
