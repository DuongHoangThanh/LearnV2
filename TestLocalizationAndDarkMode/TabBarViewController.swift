//
//  TabBarViewController.swift
//  TestLocalizationAndDarkMode
//
//  Created by Thạnh Dương Hoàng on 1/7/25.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let mainVC = MainViewController()
        mainVC.tabBarItem = UITabBarItem(title: "Main", image: nil, tag: 0)
        
        let secondVC = SecondViewController()
        secondVC.tabBarItem = UITabBarItem(title: "Second", image: nil, tag: 1)
        
        self.viewControllers = [mainVC, secondVC]
        
    }
    

}
