//
//  SearchDetailVC.swift
//  collact
//
//  Created by minjae on 2019/11/19.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

class SearchDetailVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func searchFilterAction(_ sender: Any) {
        self.performSegue(withIdentifier: "SearchFilter", sender: nil)
    }
    
    @IBAction func artworkAction(_ sender: Any) {
        self.performSegue(withIdentifier: "ProfilePopup", sender: nil)
    }
    
}
