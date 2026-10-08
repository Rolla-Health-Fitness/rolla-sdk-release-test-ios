# Changelog

**Tags used in this changelog:**

- `[breaking]` — changes that require immediate attention in order to avoid a failed build.
- `[feature]` — new SDK capability.
- `[improvement]` — existing behavior enhanced, optimized or refactored.
- `[documentation]` — documentation-only change.
- `[fix]` — bug fix.

---

## 0.1.16 [Draft]

### Both platforms

- **[feature] Indoor group sessions.** On a tenant where the backend has group sessions enabled, users can create or join a group from the indoor activity setup with a session code, follow the participants live (heart rate, Active Points, paused and delayed states) in a dashboard widget and a full-screen page, and leave, remove or end the session while their own recording continues unchanged. First use asks for a dedicated sharing consent, reviewable and withdrawable from Privacy settings. The backend decides availability per tenant, so nothing appears for tenants that have it off; hosts that want the UI hidden regardless pass the new `RollaDisabledModule.groupActivities` (Dart, Swift and Kotlin). Flutter hosts that delete accounts or wipe secure storage themselves should call `RollaSDK.clearDeletedAccountGroupData()` after a confirmed deletion and leave the keys in `rollaInstallationStorageKeys` in place on logout.

- **[feature] Nutrition is a new tab, on by default.** Upgrading apps gain a second item in the bottom navigation, a Meal entry in the quick-action menu, and calls to the nutrition endpoints. Hosts that do not want it pass `RollaDisabledModule.nutrition` (Dart, Swift and Kotlin), which removes the tab, the quick action and `RollaScreen.nutrition` together. Kotlin and Swift hosts that switch exhaustively over `RollaScreen` or `RollaDisabledModule` need a branch for the new case. It covers the daily calorie budget, meals, water, weight goals, meal plans and reusable day templates, all kept on the user's account so they survive reinstalling the app or switching phone. The budget shown for a past day is the one that actually applied then — against the goal and settings in force at the time — rather than today's figures worked out again, and tapping the ring breaks it down line by line. Weight goals are offered as dated plans the backend prices, each pairing a target date with the weekly rate and daily budget it needs; a target that cannot be reached safely simply offers fewer plans or none. A user who has not chosen a goal is asked for one before the tab opens, since there is no budget without it. Two new history screens show calories against each day's budget and water against the daily target. Every screen reads in the user's own language, including the AI agreement and the explanations shown when something cannot be estimated. Dates, month names and meal times now follow the phone's own language and clock settings, including whether times are shown as 12- or 24-hour.

- **[feature] A meal can be estimated by AI from a photo or a short description.** The user photographs their plate or types what they ate, and gets back an estimate they can edit — renaming the dish, changing portions, removing anything that was not there — before deciding to save it. Nothing reaches their log until they confirm it. Photos are cropped, turned the right way up and stripped of location and other hidden data before leaving the phone, and are deleted once the estimate comes back. Scanning asks for the user's agreement before the camera opens, not after the photo exists, and that agreement can be withdrawn at any time from the new Nutrition settings screen. Where an estimate cannot be made the user is told why and whether trying again would help. Partners who do not enable the AI features see none of this.

- **[feature] Host apps can open the Nutrition tab directly with `RollaScreen.nutrition`.** Available on iOS and Android alongside the existing screens, and useful for apps that hide the SDK's bottom navigation and offer nutrition from their own menu. Opened this way, going back returns the user to the host app. Disabling the nutrition module makes the request resolve as `screenDisabled`, as it does for every other optional screen.

- **[feature] `syncHealthData` now reports the result of each data stream, and returns `partial` when a stream fails but new data still lands.** `RollaSyncResult.streamResults` lists every stream the sync attempted — heart rate, HRV, steps and sleep for the band, plus weight, blood pressure and workouts for Apple Health and Health Connect — as `uploaded`, `noNewData` or `failed` with an error message. A stream that needs a permission the app has not granted is reported as `permissionRequired`, with an error naming the permission, and does not change the outcome. A sync where at least one stream failed and new data still reached the server — another stream uploaded, or the failed stream's accepted part is in `syncedData` — now returns `partial` (`hasNewData` true, `error` set to the first failure) instead of `success`, and one where streams failed and no new data reached the server returns `failure`. Hosts that treat every outcome other than `success` as an error should handle `partial` as a sync that ran. UI syncs reported through `rollaDidCompleteUISync` / `onUiSyncCompleted` carry the same results and outcomes. Syncs where every stream succeeds are unchanged.

- **[fix] Token callbacks now reach native hosts during headless calls.** `rollaDidRefreshToken` / `onTokenRefreshed` and `rollaDidRequestTokenRefresh` / `onTokenExpired` previously fired only while the SDK UI was presented. A `syncHealthData` or `getBandBatteryLevel` call that rotated the session therefore left the host holding a consumed refresh token, and a failed refresh made the call wait ten seconds before failing. Both callbacks are now delivered for the engine's lifetime, UI or not, and a refresh failure with no delegate/listener attached fails the call right away instead of waiting for a token push that cannot come.
- **[fix] Opening the app through one of its own links no longer shows a "Page not found" screen.** When a signed-in user opened the app via a link such as `rolla://auth/sign-up`, the SDK showed an error page instead of Home; it now lands on Home (or stays on a mandatory startup step such as consent, if one is showing) and leaves such links to the host app.
- **[improvement] The stale-data and refresh-complete dialogs now offer a shortcut into the Garmin Connect or Oura app.** A user told to sync in the companion app can open it straight from the dialog. Android launches the installed app by package name (the SDK declares the required `<queries>` entries itself — no host manifest change), iOS opens it via its URL scheme, and both fall back to the provider's web portal when the app is not installed.
- **[improvement] Workout map improvements.** The live map now rotates so the direction of travel faces up, older parts of the route fade toward the map background so out-and-back tracks stay readable, and all route maps (live, review, insights) show play/stop markers at the start and finish with a contrasting casing on the polyline.
- **[improvement] Connecting Garmin or Oura now returns the user to the app automatically after signing in — no more manual switch back from the browser.** Enabled by the new optional `oauthCallbackScheme` setting (Android apps also register the matching scheme in their manifest); apps that don't set it keep the existing browser flow.
- **[improvement] Swimming splits use a 100 m base (100 yd for imperial units).** The activity summary shows a Splits tab for swims — rows in meters/yards with pace per 100 m — when the activity carries split data, such as swims imported from Garmin.
- **[improvement] Stopping an activity that looks incomplete now asks before saving.** If the elapsed time is under a minute, or an activity whose distance is recorded live ended with effectively none, the stop button opens a Continue / Save anyway / Discard dialog instead of going straight to the summary. Save anyway keeps the previous behavior, Continue resumes tracking, and Discard deletes the activity without saving it — which now also fires the activity-removed event with reason `canceled`, previously only reachable through crash recovery. The distance half only applies where the running session can actually produce distance: activities whose distance arrives from imports (swimming, ice skating) are never gated on it, and treadmill-style indoor walks and runs only while a band is driving the session.
- **[fix] Score card messages at the "good" level no longer call a metric "at baseline" when it is not.** The Readiness and Activity cards pick one metric for their message, and the good-level copy said that metric was at or near baseline while the metric furthest from baseline was being picked — a card could call HRV "balanced" next to a clearly low HRV. A metric that has dropped out of the good band is now named with new copy that says so ("HRV dipped below baseline this morning, but overall recovery is holding"), and otherwise the message names the metric closest to baseline. New copy in all eight languages.
- **[fix] The Insights Unread filter now shows every unread insight.** Previously it only searched the insights already loaded, so the filter could report nothing left while older insights further down the All view were still marked unread.
- **[fix] Leaderboard weekly date ranges now match the period the rankings cover.** Weekly leaderboards are scoped to the calendar month, so a month's first and last week can be shorter than seven days. The header and share card previously showed week 1 as a full seven days that overlapped week 2; they now show the exact span, and a one-day week as a single date (header "Aug 31", share card "31 Aug 2026") instead of "Aug 31 - Aug 31".
- **[fix] Walking, running and hiking routes resume after a stretch in a vehicle.** Getting into a car mid-activity correctly drops the too-fast fixes, but on iOS the route and distance then stayed frozen for the rest of the activity (or for ten-plus minutes of walking) once the user got out again, and on Android the drive could leak a few points and add its length to the distance. The GPS pipeline on both platforms now recognizes a sustained run of implausible fixes as a lost anchor, waits for a consistent run of activity-pace fixes, and resumes within a few seconds. The first fix after the gap is stored as the start of a new route segment, so the distance covered in the vehicle is excluded from the live distance, the saved total, the splits and pace/speed charts, and a crash-recovered activity alike; the route map still joins the two walked stretches with a straight line. Brief GPS glitches and stop-and-go walks keep bridging as before.
- **[fix] Users who sign in with Apple or Google now get a clear explanation on the Change Email screen instead of a cryptic "Email managed by OAuth" error.** The screen tells them their email is managed by their sign-in provider and cannot be changed in the app.
- **[fix] The band "Reconnect" pill no longer shows for users whose primary source is Garmin or Oura.** It also no longer covers the bottom of the Home, Insights and Profile screens while visible.
- **[fix] Logging or editing sleep now explains why a save was rejected.** If the sleep cannot be saved, the message says what went wrong instead of showing a generic error.
- **[fix] Editing a night of sleep with a filled gap no longer saves that gap twice.** The filled period is now stored once, exactly as shown on the edit screen.
- **[fix] Sauna, Steam Room, Cold Plunge, Jacuzzi and Meditation no longer earn calories or Active Points.** These are passive wellness activities, so they are now saved as duration-only logs that do not count toward daily totals, the Activity score or the leaderboards; entries saved before this change keep the values they already have.
- **[fix] The average speed of an activity recorded in the app now matches its average pace.** It previously ignored time spent standing still and could read several times too fast; it is now distance over recorded time.
- **[fix] Data Sources page now shows connect and set-primary errors.** A successful Apple Health or Health Connect connect also offers the historical import right away.
- **[fix] The inactivity reminder and the evening band-battery warning now fire once and no longer repeat a year later.** A band-battery warning left repeating by an earlier SDK version is cleared once after the update.
- **[fix] Changing weight and height together in Personal details now gives the new weight entry the correct BMI.** It previously used the old height. Saving Personal details without changing the weight also no longer adds a duplicate weight entry, and a weight that could not be logged now shows an error instead of a successful save.

### Android

- **[breaking] Android host apps should override two entries the photo scan adds to their manifest.** The scan pulls in CameraX, which merges four things into your app's manifest: `CAMERA`, which the scan needs and you should keep; `RECORD_AUDIO`, which the scan never uses and which shows as Microphone on your Play listing; `WRITE_EXTERNAL_STORAGE` capped at API 28, which implies an uncapped `READ_EXTERNAL_STORAGE`; and a **required** `android.hardware.camera.any` feature, which hides your app from devices without a camera. The SDK cannot undo any of them — a library manifest cannot override a sibling library's entries, only your own app manifest outranks them. Add these two lines to it (the example app has them):

  ```xml
  <uses-permission android:name="android.permission.RECORD_AUDIO" tools:node="remove" />
  <uses-feature android:name="android.hardware.camera.any"
      android:required="false"
      tools:replace="android:required" />
  ```

  Apps that skip this still build and run; they advertise a microphone permission they never use and lose camera-less devices from their store listing. Scanning is one way in among several — search, recents, manual entry and a typed description all work without a camera.

- **[fix] Steps and active calories now import from Health Connect after a long gap between syncs.** They previously stopped arriving for good once a device had gone about three and a half days without new steps being synced, including during the one-time history import.
- **[fix] Health Connect workouts now import during `syncHealthData` calls made without the SDK UI on screen, once the app has granted their permissions.** The workout import asked for its permissions on every sync, which a sync without the SDK UI cannot do, so workouts waited for the next sync inside the SDK UI. Permissions that are already granted are now checked instead of requested; when one is missing, the workouts stream reports `permissionRequired` instead of failing.
- **[improvement] SDK reminders no longer use exact alarms, so `SCHEDULE_EXACT_ALARM` no longer affects them.** The inactivity reminder and the band-battery warning arrive around their planned time (possibly later while the device is idle) whether or not the permission is granted. Previously, declaring it gave these reminders exact timing; hosts that declared it only for the SDK can remove it. Removing it cancels a pending reminder once on update, and the SDK schedules it again (the inactivity reminder on the next app open, the battery warning on the next band reading).

### iOS

- **[breaking] iOS host apps must add a camera usage description before updating.** The nutrition photo scan opens the camera, and iOS shuts down any app that asks for the camera without explaining why. Add `NSCameraUsageDescription` to the app's `Info.plist` with a sentence covering what the camera is used for; the example app has one that can be copied. No Podfile change is needed — the SDK asks the camera directly rather than through a permission library. Apps that ship without the key will close the first time a user taps scan.

- **[feature] The cycling Live Activity now shows live speed instead of distance.** Outdoor and e-bike cycling workouts read out instantaneous speed on the lock screen and in the Dynamic Island — km/h or mph per the user's unit setting, from the same smoothed source as the dashboard's Speed card. Every other activity keeps the secondary metric its catalog profile specifies, so the lock screen and the in-app metrics grid always agree: the eight catalog entries that ride the cycling base type as a GPS mode (kayaking, skiing, snowboarding, golf, horseback riding, wheelchair and roller skating) show distance or active points, and swims and ice skating no longer offer a distance tile they can never fill live. Lock-screen heart rate for Band workouts is now the same 10-second average as the in-app heart rate tile rather than the raw reading — marginally slower to react on ramps. `secondaryMetricKind` gains a new value `"speed"` (alongside `"distance"` and `"activePoints"`); host widget extensions that switch on this field should add a `"speed"` case — existing extensions that only handle `"distance"` will fall through to their default branch, which is safe but shows the wrong icon/label for cycling.

- **[fix] The Apple Health history import now reports a window as failed when none of its workouts could be uploaded, as the Health Connect import already did.** Previously it skipped them silently.

---

## 0.1.15

### Both platforms

- **[feature] Rolla notifications now identify themselves and name their tap destination.** Every notification the SDK shows carries a structured payload, and the new `Rolla.notificationTarget(...)` resolver (iOS and Android wrappers) turns the tap your app receives into a typed destination: `null`/`nil` for a notification that is not Rolla's, an app-settings request for the background-location permission warning, or a `RollaScreen` to pass straight to `openScreen`. The inactivity reminder targets Insights (Home when the insights module is disabled), the band battery warning targets Home, and both Android ongoing workout notifications ("Workout in progress" and "Location Tracking" — the latter previously did nothing when tapped) target `resume`, the live workout. Flutter integrations route taps on the SDK-shown notifications automatically, including a tap that cold-launched the app; the two Android workout notifications are posted natively and resolve through `notificationTarget` in native hosts.

- **[fix] The loading indicator shown while the SDK starts now follows the host's `primaryColor` and `themeMode`.** Native iOS/Android hosts saw an off-brand spinner (mauve in light mode, teal in dark mode) between the host app and the SDK UI even when `RollaBranding.primaryColor` was set. It is now seeded from the configured primary color, matching the SDK's in-app indicators, and follows the configured theme mode instead of always following the device.

- **[fix] Leaving a leaderboard no longer immediately offers to join it again.** While the 7-day rejoin cooldown is active, the leaderboard now shows how many days remain until rejoining is possible, instead of a join prompt that would be rejected.
- **[fix] Manually added activities now count toward the daily Active Points and Active Calories totals.** Previously a manual activity kept its own points, but the daily totals on Home never included them.

- **[improvement] Swimming activities now show pace per 100 m (per 100 yd for imperial units) instead of per km.** Swim summaries also display distance and average pace when the activity carries that data, such as swims imported from Garmin.

- **[improvement] General bugfixes and stability improvements.**

### Android

- **[fix] Swiping the host app away from Recents mid-workout no longer resumes a stale SDK session on the next launch.** While a GPS or Bluetooth workout (or a band firmware update) is running, the SDK's foreground service keeps the app process alive through a Recents swipe, so the cached engine survived and the next `show()` re-presented the in-progress activity screen instead of a fresh Home with the resume-activity prompt. The swipe now stops workout tracking and tears the engine down, so the next launch behaves like a cold start and the interrupted activity is offered for Continue / Save / Discard, as on iOS. Closing the SDK with the back button and re-opening it in the same session still resumes seamlessly.

- **[fix] `openScreen` now brings an already-presented SDK UI back to the front when the host's own activities cover it.** Previously the navigation succeeded — the status reported `OPENED` — but happened invisibly behind the covering activity, leaving the user where they were. The common trigger is a notification tap, which always launches a host activity on top of the presenting SDK.

- **[fix] Scheduled reminders (the inactivity reminder and the evening battery warning) never displayed.** The broadcast receivers `flutter_local_notifications` fires scheduled notifications through were missing from every consuming app's merged manifest, so the alarms were silently dropped. The SDK now declares them itself — no host change needed, and a host that already declares these receivers with the standard attributes (`android:exported="false"`, per the `flutter_local_notifications` README) merges cleanly — along with `RECEIVE_BOOT_COMPLETED` so pending reminders survive a reboot. Scheduling also falls back to an inexact alarm when the app may not schedule exact alarms (`SCHEDULE_EXACT_ALARM` not declared or not granted — denied by default on Android 14+), instead of silently dropping the reminder.

- **[fix] Steps, sleep and HRV data no longer silently go missing on Android.** The failure fixed for pulse in 0.1.14 could hit every other band transfer too: an interrupted transfer froze the sync on that stage, and a corrupt band record could push the sync window a day or two into the future, making the metric vanish until the clock caught up. Every band transfer now recovers on its own within seconds, a corrupt record can no longer push the sync window into the future, and a transfer cut short defers its remainder to the next sync instead of skipping it.

---

## 0.1.14

### Both platforms

- **[breaking] `showSettingsButton` is renamed to `showOptionsButton`, and the entry moved into the top-right app bar actions.** The Settings button that was positioned at the very bottom of the Home scroll is now a three-dot options action at the trailing edge of the Home app bar, visible without scrolling. It opens the same bottom sheet of shortcuts as before, now titled "Options". The flag's meaning and default (`true`) are unchanged — so just rename the parameter on your `RollaConfiguration`.

- **[feature] Open a specific SDK screen from the host app.** The new `openScreen` API (Flutter: `RollaSDK.openScreen`, iOS/Android wrappers: `openScreen`) opens the Insights feed, the activity history, the goals editor, the SDK Home screen, or the last-opened state (`resume`) directly — presenting the SDK UI first when it is not on screen, honoring an optional presentation transition. The opened screen is the root of the SDK UI: back returns the user straight to your app, and `home` restores the regular Home entry point without an engine restart. Every outcome is a typed `RollaOpenScreenStatus`; the SDK's mandatory startup steps (onboarding, consent, permissions, data-source connection) always take precedence over the request.

- **[feature] Bluetooth heart rate monitor support.** A standard Bluetooth heart rate monitor (Polar, Garmin, Wahoo and similar chest straps and arm bands) can now be connected from the activity setup screen and used as a workout's heart rate source instead of the Rolla Band. Previously connected monitors are remembered and reconnected automatically when in range, and one that drops mid-workout reconnects on its own. A workout tracked with a monitor does not use a paired Band at all.

- **[feature] Manual sleep logging and editing.** A user can log a night their wearable missed, or correct one it got wrong, from the sleep detail screen — adjusting the sleep window on the chart or through time fields, and assigning a stage to stretches the device did not record. A night with no stage detail can be logged as a single in-bed block and is shown as a sleep-duration clock. A manual entry replaces whatever was stored for that night and survives later device syncs, and sleep metrics, scores and the home screen refresh as soon as one is saved. Available for the last 7 days.

- **[feature] One-time historical data import when a source is connected.** After connecting Apple Health, Health Connect, Garmin or Oura, the user is offered a backfill of the date range the backend reports as available, and can accept it, skip it (it stays re-offerable), or start it later from the "Import history" action in Data Sources. Apple Health and Health Connect are read on-device with per-stage progress while the screen stays open; Garmin and Oura are backfilled by the backend and the screen just confirms the job started. An on-device import that was interrupted is picked up again from the same action.

- **[fix] Leaderboard messages now follow the selected language.** The notice shown after leaving a leaderboard, which explains that rejoining is not possible for 7 days, along with the leaderboard error messages, always appeared in English regardless of the app language.

- **[fix] Home totals update immediately after deleting an activity.** The Active Points and Active Calories tiles and the Activity score card now refetch as soon as an activity is deleted, instead of correcting only after a manual reload.

- **[fix] Activity catalog search now ignores diacritics.** Searching is accent-insensitive (e.g. "trcanje" matches "Trčanje"), and the Yoga activity name is corrected in Bosnian/Serbian ("Joga" / "Јога").

- **[fix] Steps, Move Hours and Active Points show the full statistics grid over 7d/30d/1y.** These metric detail pages showed a single "Total" card; they now show Avg, Min, Max and Score, computed over the days that have data.

- **[fix] The Readiness and Activity screens no longer show an error while the user's session is being renewed.** They now wait for the renewal and load normally, and any error message they do show is translated into the selected language instead of appearing as technical text.

- **[improvement] Hardened token handling.** You can no longer break a session by passing outdated tokens — the SDK ignores anything older than what it already holds. And answering `onTokenExpired` (Android) / `rollaDidRequestTokenRefresh` (iOS) with `updateToken()` within 10 seconds now recovers the failing request invisibly, with no error state.

- **[improvement] Notification texts are now translated for every supported language.** The engagement and battery notification strings moved into the SDK's localization system, and date-of-birth fields now render month names in the selected language, including Latin-script Serbian.

- **[improvement] General bugfixes and stability improvements.**

### Android

- **[breaking] The Add-to-App public API types moved into sub-packages.** `Rolla` and `RollaListener` keep their package (`com.rolla.sdk.wrapper`); everything else moved, so imports need updating — no types were renamed and no behavior changed. `RollaConfiguration`, `RollaBranding`, `RollaLanguage`, `RollaThemeMode`, `RollaTransition`, `RollaDataSource` and `RollaDisabledModule` are now in `com.rolla.sdk.wrapper.config`; `RollaError` and `RollaCloseReason` in `com.rolla.sdk.wrapper.features.session`; the activity payloads in `…features.activity`, band payloads in `…features.band`, `RollaSyncResult` and `RollaPrimarySourceChanged` in `…features.sync`, `RollaGoalsChanged` in `…features.goals`, and `RollaProfileUpdated` in `…features.profile`. If you declare `RollaFlutterActivity` in your own manifest, it is now `com.rolla.sdk.wrapper.engine.RollaFlutterActivity`.

- **[fix] Pairing a band again right after unpairing it now works reliably.** Until now that attempt could quietly fail — the screen returned to the start of pairing with no message — and only succeeded after waiting around a minute.

- **[fix] Pulse data no longer silently goes missing on Android.** An interrupted band transfer could leave heart rate unsynced for days — the sync appeared to succeed while steps and sleep kept updating. The transfer now recovers on its own within seconds, and any missed stretch is fetched by the next sync.

---

## 0.1.13

### Both platforms

- **[feature] Insights entry on the Home screen.** A new Insights entry card in the Home Overview section shows the unread insights count and opens the insights feed page. This option can be disabled alongside all other insights UI by adding `RollaDisabledModule.insights` value to the `disabledModules`.

- **[feature] Optional Goals section on Home via the new `showGoalsSection` configuration flag.** `RollaConfiguration` gains an optional `showGoalsSection` (default `false`). When `true`, the bottom of the Home screen shows the user's enabled goals with an edit action — or a select-goals call-to-action when zero goals are selected.

- **[feature] New `RollaTransition` animation on the `show()` method.** A new optional `transition` parameter controls how the SDK UI opens and closes: `.default` is the existing animation, `.fade` is a cross-fade. The closing transition always mirrors the opening one.

- **[fix] Confirmation before changing the primary data source.** Switching your primary data source now asks for confirmation first, so it can no longer happen from an accidental tap.

- **[improvement] Refined Serbian translations.** Both Serbian scripts — Latin and Cyrillic — received a native-speaker terminology pass across the entire SDK UI.

- **[improvement] General bugfixes and stability improvements.**

---

## 0.1.12

### Both platforms

- **[feature] New headless public SDK methods.** Four new methods that all run **headlessly** — no SDK UI needs to be opened; after initializing the SDK, host apps can call them directly:
  - **`warmUpEngine()`** — starts and configures the SDK ahead of time without showing any UI, so the first `show()` is instant and the headless reads below work before the SDK has ever been presented. Optional: the methods below already warm up the engine if needed, but this method gives host apps the freedom to warm the engine separately and control the timing.
  - **`syncHealthData()`** — runs a full sync of the user's primary health data source and returns a typed result: `success` (with whether new data was uploaded, when it started and completed, and a `syncedData` breakdown of what was synced), `skipped` (with a documented reason, e.g. no band paired, the band not reachable, or a missing permission), or `failure`. It never throws, and reports the same result to the `rollaDidCompleteHealthDataSync` delegate method (iOS) / `onSyncHealthDataCompleted` listener method (Android) — named 1:1 after the method so it can't be confused with the UI-sync event. Pass `includeSamples: true` to also get the raw per-sample arrays.
  - **`getBandBatteryLevel()`** — a live battery read from the connected Rolla band, returning a typed result: a percentage when available, or a documented "unavailable" reason (no band paired, band not reachable, Bluetooth off, permission not granted).
  - **`getPairedBandInfo()`** — answers "does this account currently have a Rolla band?" with **zero Bluetooth** — no scan, no connect, no BLE permission; works with Bluetooth off. Returns a typed result: `bandPaired` (with the band's MAC address plus the last cached battery/firmware/serial, when available), `noBandPaired` (the user's profile confirms no band), or `unknown` (offline with no local record — reported instead of guessing). The lookup is network-first, so a band unpaired remotely from another device is reported correctly.

  All of these methods can be called without the SDK UI being opened or launched, hence the term "headless". But because headless calls have no UI to prompt from, the host owns OS permissions: when one is missing the methods fail fast with a source-specific reason (`bluetoothPermissionRequired`, `bluetoothUnavailable`, `appleHealthPermissionRequired`, `healthConnectPermissionRequired`) rather than prompting.

- **[feature] Added new module — Leaderboards.** Opt-in competitive rankings compare users on their Health Score or Active Points against others in the tenant over weekly and monthly periods. The profile screen shows a summary card with the user's rank per challenge type; the detail page lists ranked participants centered on the user's position with bidirectional pagination, supports weekly/monthly toggling and browsing up to 6 months of history, and lets users join or leave (with a 7-day rejoin cooldown). The module is wired end-to-end to the backend leaderboard API and can be hidden everywhere in the SDK UI by passing the new `RollaDisabledModule.leaderboards` value in `disabledModules`, alongside the existing `weight` and `bloodPressure` values.
- **[improvement] Onboarding profile data can be skipped by setting the profile in advance.** Host apps can now call `POST /api/setprofile` (with the user's bearer token and `Partner-ID` header, like the other auth-API endpoints) before first presenting the SDK: when the profile already carries a username, birthdate, gender, height, and weight, the SDK skips its account-details onboarding screen entirely. Weight remains mandatory when the weight module is disabled because calorie calculations depend on it. The completeness rule no longer demands units, country, or language (they default or self-heal), and a partially set profile pre-fills the onboarding form so users only complete the gaps.
- **[feature] Host-controlled SDK language.** `RollaConfiguration` gains an optional `language`, typed by the new `RollaLanguage` enum listing every language the SDK ships (`english`, `german`, `spanish`, `croatian`, `bosnian`, `serbianLatin`, `serbianCyrillic`, `arabic`). When set, that language is authoritative for the Flutter engine's lifetime: persisted picks and the backend profile cannot override it. Changing the configured language requires destroying and recreating the engine, like other SDK configuration changes. A configured language is also written to the user's backend profile at startup when it differs, so backend-generated content (goal labels, insights) matches the SDK UI language.
- **[feature] Host event listener: eleven SDK events pushed to the host app.** The existing `RollaDelegate` (iOS) / `RollaListener` (Android) gains eleven methods a host can override to observe what happens inside the SDK, without polling:

  | Event | iOS | Android | Payload |
  |---|---|---|---|
  | Activity completed | `rollaDidCompleteActivity` | `onActivityCompleted` | `RollaCompletedActivity` |
  | UI sync completed | `rollaDidCompleteUISync` | `onUiSyncCompleted` | `RollaSyncResult` |
  | Band paired | `rollaDidPairBand` | `onBandPaired` | `RollaBandInfo` |
  | Band unpaired | `rollaDidUnpairBand` | `onBandUnpaired` | `RollaBandInfo` |
  | Primary source changed | `rollaDidChangePrimarySource` | `onPrimarySourceChanged` | `RollaPrimarySourceChanged` |
  | Goals changed | `rollaDidChangeGoals` | `onGoalsChanged` | `RollaGoalsChanged` |
  | Profile updated | `rollaDidUpdateProfile` | `onProfileUpdated` | `RollaProfileUpdated` |
  | Band connected | `rollaDidConnectBand` | `onBandConnected` | `RollaBandInfo` |
  | Band disconnected | `rollaDidDisconnectBand` | `onBandDisconnected` | `RollaBandInfo` |
  | Activity started | `rollaDidStartActivity` | `onActivityStarted` | `RollaStartedActivity` |
  | Activity removed | `rollaDidRemoveActivity` | `onActivityRemoved` | `RollaRemovedActivity` |

  All methods have default no-op bodies, so existing integrations compile unchanged. Events are delivered for the engine's lifetime — they keep flowing after the SDK UI closes, as long as the engine is alive. Firing semantics and lifecycle guarantees are documented on the delegate/listener methods.
- **[feature] Hide selected data sources from the SDK UI.** A new `disabledDataSources` option hides specific data-source connect options (Band, Garmin, Oura, Apple Health, Health Connect) wherever a source is offered; omit it or pass an empty set to offer every source (default, no change for existing partners). Already-connected sources stay visible for viewing/disconnecting. When only the Band is left, the picker is skipped and onboarding goes straight to band pairing.
- **[feature] Added Spanish (Español) language support.**
- **[feature] Added Serbian language support in both scripts — Cyrillic (ћирилица) and Latin (latinica).**
- **[feature] Insights Settings page for personalized context.** Added a new Insights Settings screen that lets users provide additional personal context — such as lifestyle details, health goals, and preferences — so AI-generated insights can be more relevant and tailored to the individual.
- **[breaking] `RollaBranding` reworked to hold exactly the options that affect the SDK.** It now has six fields, all optional: `hostAppName` (names the host app in the consent intro and the permission prompts, in every SDK language), `primaryColor` (seeds the SDK's entire color scheme), `themeMode` (renamed from `defaultThemeMode`, now typed by the new `RollaThemeMode` enum), `headerLogoAsset`, `privacyUrl`, and `removeRollaBandReferences` (moved from `RollaConfiguration`, same semantics). A set field overrides the SDK's built-in default individually and an unset field keeps it — previously, passing any branding replaced all defaults at once, silently dropping e.g. the consent screen's privacy-policy link. The removed options — `appName`, `secondaryColor`, `accentColor`, `brightness`, `defaultLocale`, `termsUrl` — had no effect on the SDK UI.
- **[improvement] Added clearer guidance for profile metrics and data sources.** Profile details now explain BMI, BMR, and max heart rate with source links, and the Data Sources page clarifies how primary and secondary sources work.
- **[improvement] Split the combined permission screen into two separate pages for Bluetooth and Location.** Each permission now has its own dedicated page with contextual copy explaining why it is needed, giving users a clearer understanding before granting access.
- **[fix] Opening the app without an internet connection no longer signs you out or gets stuck on a loading spinner.** Your session is kept and you land on the home screen in offline mode, with data refreshing once you're back online.
- **[fix] Saving an interrupted activity now keeps the duration shown on the recovery prompt.** The saved activity's summary now matches the time displayed on the Save button instead of showing a different duration.
- **[fix] Activities with little or no distance no longer show a wrong average pace.** When there isn't enough distance to calculate a meaningful pace, the average pace is now left blank instead of displaying an unrealistic value.
- **[fix] Bugs and stability fixes.** Various internal fixes and stability improvements.

### Android

- **[improvement] Neutral Android notification channel names.** The two SDK-created Android notification channels that end users see in system settings were renamed from "Rolla Warnings" and "Engagement" to the brand-neutral "Important Alerts" and "Engagement Tips". This keeps the channels consistent with the host app's branding.

### iOS

- **[breaking] `RollaDelegate` error method renamed: `rolla(_:didFailWithError:)` → `rollaDidFailWithError(_:error:)`.** Aligns the one anonymous-form method with the rest of the `rollaDid…` delegate family. Migration is a signature change only — same parameters, same behavior: `func rollaDidFailWithError(_ rolla: Rolla, error: RollaError)`.

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
