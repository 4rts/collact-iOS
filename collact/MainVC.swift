//
//  MainVC.swift
//  collact
//
//  Created by minjae on 29/09/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

class MainVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        self.tabBar.barTintColor =  UIColor(red:255, green:255, blue:255, alpha:1)
        self.tabBar.tintColor = UIColor.black
        self.tabBar.unselectedItemTintColor = #colorLiteral(red: 0.8941176534, green: 0.9098039269, blue: 0.9254902005, alpha: 1)
    }

}
