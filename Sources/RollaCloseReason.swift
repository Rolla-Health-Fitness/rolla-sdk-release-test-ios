import Foundation

public enum RollaCloseReason: Equatable {
    case flutterRequested(reason: String?)
    case hostNavigationBack
    case hostModalDismiss
    case programmatic
    case hostStackReplaced
    case unknown
}

