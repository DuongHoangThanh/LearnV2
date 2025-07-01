//
//  LanguageManager.swift
//  TestLocalizationAndDarkMode
//
//  Created by Thạnh Dương Hoàng on 1/7/25.
//

import Foundation

import Foundation

class LanguageManager {
    static let shared = LanguageManager()

    private let languageKey = "AppLanguage"

    private init() { }

        var currentLanguage: String {
            get {
                UserDefaults.standard.string(forKey: languageKey) ?? Locale.preferredLanguages.first ?? "en"
            }
            set {
                UserDefaults.standard.set(newValue, forKey: languageKey)
                Bundle.setLanguage(newValue)
                NotificationCenter.default.post(name: .languageDidChange, object: nil)
            }
        }
}

