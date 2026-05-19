# Changelog

**Tags used in this changelog:**

- `[breaking]` — changes that require immediate attention in order to avoid a failed build.
- `[feature]` — new SDK capability.
- `[improvement]` — existing behavior enhanced, optimized or refactored.
- `[documentation]` — documentation-only change.
- `[fix]` — bug fix.

---

## 0.1.11

### Both platforms

- **[feature] Added `disabledModules` to `RollaSDKConfig` / `RollaConfiguration`.** Pass a set of `RollaDisabledModule` values to hide a module's entire UI. `weight` and `bloodPressure` are the first two modules supported for disabling; see `RollaDisabledModule` for the current list.

- **[feature] Manual activity logging.** Added a new `manualActivity` module that lets users log a workout after the fact. Pick an activity type, set duration and intensity, and the SDK estimates calories — using available heart-rate samples for the window when present, or a metabolic-equivalents fallback otherwise. Enable it by including `RollaModuleType.manualActivity` in your `RollaConfiguration`'s modules list.

- **[feature] Smartphone-only workout tracking.** Workouts can now be started and tracked without a paired wearable, using the phone's pedometer and motion sensors. The activity session transparently falls back to phone sensors when no wearable is connected and merges streams when one is. New permissions are required on Android — see below.

- **[breaking] Removed the previously undocumented `enabledModules` parameter from `RollaConfiguration`.** Replaced by `disabledModules`. Partners weren't using the old parameter, but anything that referenced it must switch to the new API.

- **[improvement] FAB quick-actions overlay redesigned.** The home FAB now opens a quick-actions sheet with entries for starting a live workout and logging a manual activity. The overlay replaces the previous quick-actions header behavior on the Home tab.

- **[improvement] Active calories model updated to the Compendium of Physical Activities.** Walking, running, and cycling kcal output now uses a speed-based MET table instead of fixed or curve-fitted values. The same workout will report different calorie totals than prior SDK versions — typically higher for walking, comparable for running and cycling.

- **[fix] Fixed incorrect Active Points abbreviation translations.** Active Points values now use the `AP`/`AB` abbreviation instead of the translated "points" word, which had wrong singular/plural forms in Croatian and Bosnian.

### Android

- **[breaking] `ACTIVITY_RECOGNITION` permission now required.** The bundled SDK manifest declares `android.permission.ACTIVITY_RECOGNITION` (API 29+) to read the phone's step counter for smartphone-only workouts. Ensure your host app does not strip it via `tools:node="remove"` and that your Play Console listing covers the new permission rationale.

### iOS

- **[breaking] `NSMotionUsageDescription` now required in the host app's `Info.plist`.** Smartphone-only workouts use `CMPedometer` to count steps and measure cadence. iOS terminates any app that calls `CMPedometer.startUpdates` without a `NSMotionUsageDescription` string declared. Add the key with a user-facing rationale (e.g. "Used to count steps and measure cadence during workouts when no fitness band is connected") to your host app's `Info.plist`, or smartphone-only workouts will crash the app on first start.

- **[improvement] Live Workout widget honors phone-only mode.** `LiveWorkoutAttributes.ContentState` gained an `isPhoneOnly` flag so the Dynamic Island and Lock Screen views can hide band-specific elements (heart rate, band-disconnected banner) when a workout is being tracked from the phone alone. The flag is defaulted to `false` so Live Activities started before this update continue to decode cleanly across the upgrade.

---

## 0.1.10

### Both platforms

- **[feature] Added the `showSettingsButton` boolean config on `RollaConfiguration`.** Renders a Settings button on the Home screen that opens a sheet with Data Sources and Goals shortcuts. Defaults to `true` since most partners need it automatically.

- **[improvement] Improved the GPS tracking to be more accurate on iOS and Android.** The location pipeline has been refactored on both platforms to hold steady when you're standing still, filter out GPS zig-zags, and recover cleanly when you start moving again. Additionally, the in-app map views got some general UX improvements and polishing.

- **[documentation] Added a permissions rationale matrix to the iOS and Android permissions docs.** Each permission is grouped by capability (Location, Bluetooth, Health Connect / Apple Health, etc.) and carries a required/optional status plus a partner-ready rationale suitable for App Store and Play Console submissions.

### Android

- **[breaking] `minSdk` raised from 24 to 26.** Required by the bundled Health Connect plugin's manifest.

- **[breaking] Host-app Kotlin floor raised to 2.2.0.** Required by the bundled `health` plugin's transitive `kotlin-stdlib-jdk7:2.2.10`. Kotlin ≥ 2.1.0 should work as well because of the [version tolerance](https://kotlinlang.org/docs/metadata-jvm.html#maven) rule, but 2.2.0 is still the recommended minimum.

- **[feature] Google Health Connect support.** Android health data can now be synced and tracked from Health Connect.

- **[improvement] Build JDK floor lowered from 21 to 17.** AAR is now compiled with Java 17 (class file major version 61).

### iOS

- **[improvement] Simulator support added (Debug configuration).** `0.1.10` runs on iPhone simulators under the Debug configuration, in addition to the existing Release-on-device support. Hardware-backed features (Bluetooth, etc.) still only work on physical devices.

---

## 0.1.9 — First stable release

`0.1.9` is the first stable release of the Rolla SDK. Per-change entries begin at `0.1.10`.
