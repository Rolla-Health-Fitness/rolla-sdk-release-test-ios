# Rolla SDK — iOS

iOS distribution repository for the Rolla Flutter SDK. Contains artifacts for integrating Rolla into native iOS apps.

**Latest version:** `0.1.21-test.275.1`

> **Package Manager Support:** CocoaPods is the only supported package manager at this time. Swift Package Manager (SPM) will be supported soon.

---

## Installation

Add the Rolla SDK specs repository and dependency to your `Podfile`:

```ruby
platform :ios, '14.0'

source 'https://github.com/Rolla-Health-Fitness/rolla-sdk-release-test-ios.git'
source 'https://cdn.cocoapods.org/'

target 'YourApp' do
  use_frameworks!
  pod 'RollaSDK', '0.1.21-test.275.1'
end
```

Then run `pod install`.

> **Important:** Always open your project using the `.xcworkspace` file, not `.xcodeproj`.

### Disable User Script Sandboxing

CocoaPods requires `ENABLE_USER_SCRIPT_SANDBOXING` set to **No** in your target's Build Settings. Search for "User Script Sandboxing" under Build Options and set it to "No".

---

For detailed integration instructions see the [iOS Integration Guide](https://github.com/Rolla-Health-Fitness/rolla-sdk-documentation/tree/dev/ios).
