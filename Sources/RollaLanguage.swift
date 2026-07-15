import Foundation

/// SDK UI languages a host app can configure.
///
/// Pass a value to `RollaConfiguration.language` to render the SDK in that
/// language for the Flutter engine's lifetime. The configured value replaces
/// persisted picks and the user's backend profile language.
public enum RollaLanguage: String {
    case english
    case german
    case spanish
    case croatian
    case bosnian
    case serbianLatin
    case serbianCyrillic
    case arabic
}
