// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// huhu
  internal static let bye = L10n.tr("Localizable", "Bye", fallback: "huhu")
  /// Change Language
  internal static let changeLanguage = L10n.tr("Localizable", "change_language", fallback: "Change Language")
  /// Dark Mode
  internal static let darkMode = L10n.tr("Localizable", "dark_mode", fallback: "Dark Mode")
  /// hehe
  internal static let hello = L10n.tr("Localizable", "Hello", fallback: "hehe")
  /// Localizable.strings
  ///   TestLocalizationAndDarkMode
  /// 
  ///   Created by Thạnh Dương Hoàng on 1/7/25.
  internal static let settingsTitle = L10n.tr("Localizable", "settings_title", fallback: "Settings")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
