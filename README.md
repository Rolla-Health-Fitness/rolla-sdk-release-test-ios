# Rolla SDK — iOS

iOS distribution repository for the Rolla Flutter SDK. Contains Swift Package Manager and CocoaPods artifacts for integrating Rolla into native iOS apps.

**Current version:** `0.1.6`

---

## Swift Package Manager

1. In Xcode, select your **PROJECT** (not target) in the navigator
2. Go to **Package Dependencies** tab
3. Click **+** → **Add Package Dependency**
4. Enter: `https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios.git`
5. Select version: `0.1.6`
6. Click **Add Package**

---

## CocoaPods

Add to your `Podfile`:

```ruby
source 'https://github.com/Rolla-Health-Fitness/rolla-sdk-release-ios.git'
source 'https://cdn.cocoapods.org/'

target 'YourApp' do
  use_frameworks!
  pod 'RollaSDK', '0.1.6'
end
```

Then run `pod install`.

---

For detailed integration instructions see [IOS_INTEGRATION.md](https://github.com/Rolla-Health-Fitness/rolla-sdk/blob/dev/IOS_INTEGRATION.md).
