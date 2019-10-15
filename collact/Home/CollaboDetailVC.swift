//
//  CollaboDetailVC.swift
//  collact
//
//  Created by minjae on 2019/10/16.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

class CollaboDetailVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }

}
