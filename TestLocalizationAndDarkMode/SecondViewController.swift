//
//  SecondViewController.swift
//  TestLocalizationAndDarkMode
//
//  Created by Thạnh Dương Hoàng on 1/7/25.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateLocalizedTexts()
        NotificationCenter.default.addObserver(self, selector: #selector(updateLocalizedTexts), name: .languageDidChange, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(applyThemeUI), name: .themeChanged, object: nil)
    }
    
    @objc private func updateLocalizedTexts() {
        titleLabel.text = "change_language".localized
    }

    @objc private func applyThemeUI() {
        view.backgroundColor = UIColor(resource: .background)
        titleLabel.textColor = UIColor(resource: .text)
    }
}
