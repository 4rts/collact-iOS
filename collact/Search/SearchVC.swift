
//
//  SearchVC.swift
//  collact
//
//  Created by minjae on 29/09/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

class SearchVC: BaseVC {
    
    @IBOutlet weak var demoView1: UIView!
    @IBOutlet weak var demoView2: UIView!
    @IBOutlet weak var colorCategoryView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarItem.selectedImage = tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)
    }
    
    @IBAction func searchCategoryAction(_ sender: Any) {
        demoView1.isHidden = true
        demoView2.isHidden = false
        colorCategoryView.isHidden = false
        tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func searchCategoryAction2(_ sender: Any) {
        demoView1.isHidden = false
        demoView2.isHidden = true
        colorCategoryView.isHidden = true
        tabBarController?.tabBar.isHidden = false
    }
    @IBAction func searchAction(_ sender: Any) {
        self.performSegue(withIdentifier: "SearchAction", sender: nil)
    }
    
    @IBAction func searchFilerAction(_ sender: Any) {
        self.performSegue(withIdentifier: "SearchFiler", sender: nil)
    }
    
}
