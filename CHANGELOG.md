# Changelog

**Tags used in this changelog:**

- `[breaking]` — changes that require immediate attention in order to avoid a failed build.
- `[feature]` — new SDK capability.
- `[improvement]` — existing behavior enhanced, optimized or refactored.
- `[documentation]` — documentation-only change.
- `[fix]` — bug fix.

---

## 0.1.12

> **No documented changes yet.** When adding a new changelog entry, follow the pattern from previous versions in this file and see [`docs/changelog/CHANGELOG_WORKFLOW.md`](docs/changelog/CHANGELOG_WORKFLOW.md). Delete this note when you add the first bullet.

---

## 0.1.11

### Both platforms

- **[improvement] Updated Stale Data Notification Appearance to be less intrusive.** On app open, stale data now shows a brief toast instead of a full-screen dialog. Tapping the toast reveals the full details. Manual refresh still shows the full dialog. The refresh icon also turns orange when data is stale.

- **[feature] Activity History page.** Added a dedicated Activity History screen that displays all past workouts in a monthly calendar view with summary stats and shareable card previews.

- **[feature] Custom Rolla Analytics for SDK usage tracking.** Added a new `analytics` module that captures basic in-app usage events and reports them to the Rolla backend. Events are queued locally and delivered reliably across offline periods.

- **[feature] Added `disabledModules` to `RollaConfiguration`.** Pass a set of `RollaDisabledModule` values to hide a module's entire UI. `weight` and `bloodPressure` are the first two modules supported for disabling; see `RollaDisabledModule` for the current list.

- **[feature] Added `removeRollaBandReferences` flag to `RollaConfiguration`, default value `true`.** SDK partner apps now default to generic "fitness device" wording across the SDK UI, with Rolla Band references shown only when the flag is set to `false`.

- **[feature] Manual activity logging.** Added a new `manualActivity` module that lets users log a workout after the fact. Pick an activity type, set duration and intensity, and the SDK estimates calories — using available heart-rate samples for the window when present, or a metabolic-equivalents fallback otherwise.

- **[feature] New activities: Spa and Calisthenics.** Added a `Spa` category (Sauna, Steam Room, Cold Plunge, Jacuzzi) that is available only from the manual activity logger — these entries do not appear in the live-tracking start list. `Calisthenics` was added under Strength and can be both live-tracked and logged manually.

- **[feature] Smartphone-only workout tracking.** Workouts can now be started and tracked without a paired wearable, using the phone's pedometer and motion sensors. The activity session transparently falls back to phone sensors when no wearable is connected and merges streams when one is. New permissions are required on Android — see below.

- **[breaking] Removed the previously undocumented `enabledModules` parameter from `RollaConfiguration`.** Replaced by `disabledModules`. Partners weren't using the old parameter, but anything that referenced it must switch to the new API.

- **[improvement] Redesigned Insights experience.** Insights section has been moved off the SDK's Home page into its own dedicated **Insights tab** in the SDK's bottom navigation, visible only to partners using the bottom navigation bar. The tab shows a daily scrollable feed with filters, full article views (embedded charts, maps, route previews, highlight tiles), and ratings. Partners that don't use the SDK's bottom navigation will no longer see the Insights section.

- **[improvement] Redesigned the bottom navigation bar.** The SDK's bottom navigation has been redesigned from Material's default bottom bar into a floating pill with a blurred backdrop, an animated sliding indicator behind the active tab, and a separated circular FAB for starting workouts. Three primary tabs (Home, Insights, Profile) replace the previous layout. Partners that aren't using the SDK's bottom navigation will only see the positional change of the Plus button for starting activities, from bottom centre to bottom right.

- **[improvement] FAB quick-actions overlay redesigned.** The home FAB now opens a quick-actions sheet with entries for starting a live workout and logging a manual activity. The overlay replaces the previous quick-actions header behavior on the Home tab.

- **[improvement] Active calories model updated to the Compendium of Physical Activities.** Walking, running, and cycling kcal output now uses a speed-based MET table instead of fixed or curve-fitted values. The same workout will report different calorie totals than prior SDK versions — typically higher for walking, comparable for running and cycling.

- **[fix] Fixed incorrect Active Points abbreviation translations.** Active Points values now use the `AP`/`AB` abbreviation instead of a translated word, fixing incorrect plural forms in some locales.

- **[fix] Apple Health and Health Connect now sync data when connected as a secondary source.** Previously, when a user's primary source was the band (or another service), workouts, weight, and blood pressure from a secondary Apple Health / Health Connect connection stopped syncing entirely. These data types are now uploaded automatically on each Home resume, while heart rate, HRV, steps, and sleep remain owned by the primary source.

- **[feature] Added a Privacy screen to Account Settings.** The screen fetches partner-specific privacy notice markdown from the backend and renders it with placeholders already resolved.

- **[fix] Restored the original Terms of Use and Privacy Policy links.**

- **[improvement] Reduced SDK payload size by approximately 73 MB by dropping unused bundled media assets.**

- **[fix] Active workout distance no longer resets to 0 after the app is closed or loses connection.** If a workout is interrupted (for example by closing the app or switching to airplane mode), the previously tracked distance is now restored on resume so it continues from where it left off instead of starting over.

- **[fix] Fixed incorrect activity session being restored after an interrupted workout.** Recovery now targets your most recent session and clears out stale, abandoned ones.

- **[fix] Workout pause segments no longer leak to workout data.** Fixed a bug where samples recorded during a pause leaked into the workout samples.

- **[fix] Fixed Rolla band activities being auto-ended mid-workout during low-motion sessions.** Disabled a band firmware flag that was being toggled on unintentionally, which let the band terminate user-started activities after long stationary stretches.

- **[fix] Remaining connected data source is now promoted to primary when the Rolla Band is unpaired.** Previously, if the band was the primary source and another service (e.g. Garmin or Apple Health) was connected as secondary, unpairing the band left that service as secondary until the app was restarted. The remaining connected service is now switched to primary right away, with no restart required.

- **[improvement] Reworked the in-app FAQ content.** The Help & Support FAQ screen is now organised into clear sections — Understanding Your Health Metrics, Wearable Connection & Syncing, Why Can't I See a Specific Metric?, and Wearable Compatibility. Answers now cover all supported wearables (Rolla Band, Garmin, and Apple Watch / Apple Health) with device-specific guidance for connecting, syncing, and missing metrics, rather than focusing on the Rolla Band alone. Updated across all supported languages.

- **[fix] Home screen no longer flickers or briefly shows 0 when refreshing.** When pulling down to refresh the Home screen, the Readiness, Activity, Health Score, and metrics cards used to blink and momentarily display a 0 before the new numbers arrived. They now stay on screen showing your current values and update smoothly in place once the latest data is ready.

- **[fix] Stale-data warning now names the correct data source.** The dialog referenced Garmin even when Oura was the connected source; it now names the actual primary source.

- **[feature] Unread Insights badge & filtering.** The Insights tab now displays an unread badge indicating new articles since the user's last visit, and adds filter controls to narrow the feed by read/unread status.

- **[fix] Account details screen improvements during sign-up.** The name field now validates on blur, country/city selection handles offline gracefully, and the screen's text field and searchable dropdown are now exported for reuse in the white-label app.

- **[fix] Indoor workouts no longer wait 30–45s on "Waiting for GPS…" before showing you on the map.** The map now appears almost immediately using a cached position while precise GPS warms up, without affecting recorded route accuracy.

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
