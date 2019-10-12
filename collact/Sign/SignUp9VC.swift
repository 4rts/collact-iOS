//
//  SignUp9VC.swift
//  collact
//
//  Created by minjae on 2019/10/11.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

class SignUp9VC: BaseVC {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var registerButton: UIButton!
    
    var artistFlag: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.artistFlag {
            titleLabel.textColor = UIColor.white
        } else {
            
        }
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        
    }

}
