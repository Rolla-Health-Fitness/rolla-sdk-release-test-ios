import Foundation

/// How the SDK UI is animated on and off screen by `Rolla.show(from:transition:)`.
///
/// The dismissal always mirrors the presentation, whichever way the SDK UI is
/// closed (its own close button, `Rolla.dismiss()`, or a host dismissal).
public enum RollaTransition {
    /// The SDK's standard presentation — a slide-in from the trailing edge
    /// with a subtle parallax on the host screen.
    case `default`

    /// A cross-fade between the host screen and the SDK UI.
    case fade
}
