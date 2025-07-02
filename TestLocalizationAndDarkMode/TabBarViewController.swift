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
        mainVC.tabBarItem = UITabBarItem(title: "Main", image: UIImage(named: "trash"), tag: 0)
        
        let secondVC = SecondViewController()
        secondVC.tabBarItem = UITabBarItem(title: "Second", image: UIImage(named: "trash"), tag: 1)
        
        let homeVC = HomeViewController()
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "trash"), tag: 2)
        
        self.viewControllers = [mainVC, secondVC, homeVC]
        
    }
    

}
