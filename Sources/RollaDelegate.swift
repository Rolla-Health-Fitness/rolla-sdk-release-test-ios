import Foundation

public protocol RollaDelegate: AnyObject {
    func rollaDidClose(_ rolla: Rolla, reason: RollaCloseReason)
    func rollaDidFailWithError(_ rolla: Rolla, error: RollaError)

    /// Called when the SDK successfully refreshes tokens internally.
    ///
    /// Use this to sync your app's token storage with the SDK's refreshed tokens.
    ///
    /// - Parameters:
    ///   - rolla: The Rolla instance that refreshed the token.
    ///   - token: The new access token.
    ///   - refreshToken: The new refresh token, if provided.
    ///   - expiresIn: Time interval in seconds until the new access token expires, if known.
    func rollaDidRefreshToken(_ rolla: Rolla, token: String, refreshToken: String?, expiresIn: TimeInterval?)

    /// Called when the SDK's internal token refresh fails and the host app needs to provide new tokens.
    ///
    /// When this is called, the host app should obtain fresh tokens from its own auth backend
    /// and push them to the SDK via ``Rolla/updateToken(token:refreshToken:expiresIn:completion:)``.
    ///
    /// - Parameter rolla: The Rolla instance that needs fresh tokens.
    func rollaDidRequestTokenRefresh(_ rolla: Rolla)

    /// Called when a headless ``Rolla/syncHealthData(includeSamples:completion:)``
    /// reaches a terminal outcome.
    ///
    /// Delivers the same ``RollaSyncResult`` the `syncHealthData` completion
    /// handler receives, giving a host one central place to observe sync results
    /// — for example, to refresh its own UI. It fires only for a terminal
    /// outcome: transport failures (e.g. the engine could not start) come back
    /// through the completion handler as `.failure` and do not fire this method.
    ///
    /// - Parameters:
    ///   - rolla: The Rolla instance that ran the sync.
    ///   - result: The terminal sync result.
    func rollaDidCompleteSync(_ rolla: Rolla, result: RollaSyncResult)

    /// Called when an activity completed inside the SDK UI reaches a lifecycle
    /// phase: `finished` (saved in-SDK — instant), then `uploaded` (confirmed
    /// by the backend) or `uploadFailed` (the upload gave up permanently).
    ///
    /// ``RollaCompletedActivity/source`` distinguishes live-tracked activities
    /// from manually logged ones. Key idempotency on `(activityId, phase)` —
    /// `uploaded`/`uploadFailed` can re-fire across retries. Distinct from
    /// ``rollaDidClose(_:reason:)``: it fires whether or not the user then
    /// closes the SDK UI, and `uploaded` can arrive after close (uploads
    /// finish in the background while the engine is alive).
    ///
    /// - Parameters:
    ///   - rolla: The Rolla instance delivering the event.
    ///   - activity: The activity payload, including its lifecycle phase.
    func rollaDidCompleteActivity(_ rolla: Rolla, activity: RollaCompletedActivity)

    /// Called when a sync completes inside the SDK UI: the auto-sync on open,
    /// the sync on return from background while the SDK is showing, and the
    /// in-app manual refresh.
    ///
    /// Distinct from ``rollaDidCompleteSync(_:result:)``, which fires only for
    /// host-initiated headless ``Rolla/syncHealthData(includeSamples:completion:)``
    /// calls — the payload type is shared so a host reads one result shape for
    /// both directions. On a successful band / Apple Health / Health Connect
    /// UI sync, ``RollaSyncResult/syncedData`` carries the same per-stream
    /// summary breakdown as the headless result (samples are never included on
    /// UI syncs). It is `nil` when there is nothing attributable to report:
    /// failure events, Garmin/Oura content-only refreshes, syncs that recorded
    /// no data, and syncs that overlapped another sync (concurrent UI syncs or
    /// a concurrent headless sync) — never wrong or double-reported data.
    ///
    /// - Parameters:
    ///   - rolla: The Rolla instance delivering the event.
    ///   - result: The terminal result of the UI sync.
    func rollaDidCompleteUISync(_ rolla: Rolla, result: RollaSyncResult)

    /// Called when the user pairs a band inside the SDK UI — the band is
    /// persisted locally and registered with the backend at this moment.
    /// Auto-reconnects and login restores do not fire this.
    ///
    /// - Parameters:
    ///   - rolla: The Rolla instance delivering the event.
    ///   - band: The paired band (name, MAC, device type, RSSI).
    func rollaDidPairBand(_ rolla: Rolla, band: RollaBandInfo)

    /// Called when the user unpairs the band inside the SDK UI (confirmed by
    /// the backend). A band unpaired remotely — from another device — is
    /// reconciled silently and does not fire this.
    ///
    /// - Parameters:
    ///   - rolla: The Rolla instance delivering the event.
    ///   - band: The unpaired band (MAC plus last cached battery/firmware/serial).
    func rollaDidUnpairBand(_ rolla: Rolla, band: RollaBandInfo)

    /// Called when the SDK observes the user's primary data source change —
    /// committed inside the SDK UI, or discovered on a profile/connections
    /// refresh (changes made server-side or on another device surface on the
    /// next refresh, not instantly).
    ///
    /// - Parameters:
    ///   - rolla: The Rolla instance delivering the event.
    ///   - change: The previous and current primary source.
    func rollaDidChangePrimarySource(_ rolla: Rolla, change: RollaPrimarySourceChanged)

    /// Called when the user saves goal changes inside the SDK UI (each toggle
    /// backend-confirmed). One call per save, carrying both the toggled goals
    /// and the resulting enabled set.
    ///
    /// - Parameters:
    ///   - rolla: The Rolla instance delivering the event.
    ///   - change: The toggled goals and the enabled set after the save.
    func rollaDidChangeGoals(_ rolla: Rolla, change: RollaGoalsChanged)

    /// Called when the user updates profile data inside the SDK UI — a profile
    /// details edit, a weight log, or a blood-pressure log — with only the
    /// changed fields. See ``RollaProfileUpdated`` for the key vocabulary.
    ///
    /// - Parameters:
    ///   - rolla: The Rolla instance delivering the event.
    ///   - update: The sparse map of changed fields.
    func rollaDidUpdateProfile(_ rolla: Rolla, update: RollaProfileUpdated)
}

public extension RollaDelegate {
    func rollaDidClose(_ rolla: Rolla, reason: RollaCloseReason) {}
    func rollaDidFailWithError(_ rolla: Rolla, error: RollaError) {}
    func rollaDidRefreshToken(_ rolla: Rolla, token: String, refreshToken: String?, expiresIn: TimeInterval?) {}
    func rollaDidRequestTokenRefresh(_ rolla: Rolla) {}
    func rollaDidCompleteSync(_ rolla: Rolla, result: RollaSyncResult) {}
    func rollaDidCompleteActivity(_ rolla: Rolla, activity: RollaCompletedActivity) {}
    func rollaDidCompleteUISync(_ rolla: Rolla, result: RollaSyncResult) {}
    func rollaDidPairBand(_ rolla: Rolla, band: RollaBandInfo) {}
    func rollaDidUnpairBand(_ rolla: Rolla, band: RollaBandInfo) {}
    func rollaDidChangePrimarySource(_ rolla: Rolla, change: RollaPrimarySourceChanged) {}
    func rollaDidChangeGoals(_ rolla: Rolla, change: RollaGoalsChanged) {}
    func rollaDidUpdateProfile(_ rolla: Rolla, update: RollaProfileUpdated) {}
}
