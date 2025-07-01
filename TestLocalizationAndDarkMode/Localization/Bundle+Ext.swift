//
//  Bundle+Localization.swift
//  TestLocalizationAndDarkMode
//
//  Created by Thạnh Dương Hoàng on 1/7/25.
//

import Foundation

private var bundleKey: UInt8 = 0

extension Bundle {
    static func setLanguage(_ language: String) {
        object_setClass(Bundle.main, PrivateBundle.self)
        objc_setAssociatedObject(Bundle.main, &bundleKey, language, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}

private class PrivateBundle: Bundle {
    override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        guard let lang = objc_getAssociatedObject(self, &bundleKey) as? String,
              let path = Bundle.main.path(forResource: lang, ofType: "lproj"),
              let bundle = Bundle(path: path) else {
            return super.localizedString(forKey: key, value: value, table: tableName)
        }
        return bundle.localizedString(forKey: key, value: value, table: tableName)
    }
}
