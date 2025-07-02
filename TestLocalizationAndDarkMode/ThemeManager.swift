//
//  ThemeManager.swift
//  TestLocalizationAndDarkMode
//
//  Created by Thạnh Dương Hoàng on 1/7/25.
//

import Foundation
import UIKit

enum AppTheme: String {
    case light, dark
}

class ThemeManager {
    static let shared = ThemeManager()

    private let themeKey = "appTheme"
    
    var currentTheme: AppTheme {
        get {
            let value = UserDefaults.standard.string(forKey: themeKey) ?? AppTheme.light.rawValue
            return AppTheme(rawValue: value) ?? .light
        }
        set {
            guard currentTheme.rawValue != newValue.rawValue else { return }
            UserDefaults.standard.set(newValue.rawValue, forKey: themeKey)
            applyTheme(newValue)
        }
    }

    func applyTheme(_ theme: AppTheme) {
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .forEach { window in
                window.overrideUserInterfaceStyle = theme == .dark ? .dark : .light
            }

        NotificationCenter.default.post(name: .themeChanged, object: nil)
    }
}

extension Notification.Name {
    static let themeChanged = Notification.Name("themeChanged")
}
