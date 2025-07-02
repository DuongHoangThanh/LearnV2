//
//  MainViewController.swift
//  TestLocalizationAndDarkMode
//
//  Created by Thạnh Dương Hoàng on 1/7/25.
//

import UIKit
import Combine

class MainViewController: UIViewController {

    @IBOutlet weak var darkModeSwitch: UISwitch!
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        darkModeSwitch.isOn = ThemeManager.shared.currentTheme == .dark
        updateLocalizedTexts()
        applyThemeUI()
        
        
//        NotificationCenter.default.addObserver(self, selector: #selector(updateLocalizedTexts), name: .languageDidChange, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(applyThemeUI), name: .themeChanged, object: nil)
        
        NotificationCenter.default.publisher(for: .languageDidChange)
            .sink { [weak self] _ in
                self?.updateLocalizedTexts()
            }
            .store(in: &cancellables)
        
//        NotificationCenter.default.publisher(for: .themeChanged)
//            .sink { [weak self] _ in
//                self?.applyThemeUI()
//            }
//            .store(in: &cancellables)
    }
    
    @IBOutlet weak var completedLabel: UILabel!
    
    @objc func updateLocalizedTexts() {
        completedLabel.text = R.string.localizable.settings_title()
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
