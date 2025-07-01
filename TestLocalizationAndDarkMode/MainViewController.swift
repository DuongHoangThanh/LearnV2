//
//  MainViewController.swift
//  TestLocalizationAndDarkMode
//
//  Created by Thạnh Dương Hoàng on 1/7/25.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var darkModeSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        darkModeSwitch.isOn = ThemeManager.shared.currentTheme == .dark
        updateLocalizedTexts()
        applyThemeUI()
        NotificationCenter.default.addObserver(self, selector: #selector(updateLocalizedTexts), name: .languageDidChange, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(applyThemeUI), name: .themeChanged, object: nil)
        
    }
    
    @IBOutlet weak var completedLabel: UILabel!
    
    @objc func updateLocalizedTexts() {
        completedLabel.text = "settings_title".localized
    }
    
    @objc private func applyThemeUI() {
        view.backgroundColor = UIColor(resource: .background)
        completedLabel.textColor = UIColor(resource: .text)
    }
    
    @IBAction func didTapEnglish(_ sender: UIButton) {
        LanguageManager.shared.currentLanguage = "en"
    }

    @IBAction func didTapVietnamese(_ sender: UIButton) {
        LanguageManager.shared.currentLanguage = "vi"
    }

    @IBAction func didTapFrench(_ sender: UIButton) {
        LanguageManager.shared.currentLanguage = "fr"
    }
    
    @IBAction func themeToggleSwitched(_ sender: UISwitch) {
        ThemeManager.shared.currentTheme = sender.isOn ? .dark : .light
    }
}

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
