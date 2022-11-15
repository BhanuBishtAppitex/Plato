//
//  MainTabBarController.swift
//  Plato
//
//  Created by wOOx Technology on 15/11/22.
//

import UIKit

class MainTabBarController: UITabBarController {

    @IBOutlet weak var mainTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = 1
        tabBar.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9568627451, blue: 1, alpha: 1)
    }
}
