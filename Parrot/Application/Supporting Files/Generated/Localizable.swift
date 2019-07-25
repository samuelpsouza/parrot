// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
internal enum L10n {

  internal enum Common {
    /// Ok
    internal static let ok = L10n.tr("Localizable", "common.ok")
  }

  internal enum Signup {

    internal enum Main {
      /// Crie sua conta
      internal static let title = L10n.tr("Localizable", "signup.main.title")
    }

    internal enum Picture {
      /// Foto
      internal static let title = L10n.tr("Localizable", "signup.picture.title")
    }
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
