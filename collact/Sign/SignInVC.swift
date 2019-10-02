//
//  SignInVC.swift
//  collact
//
//  Created by minjae on 29/09/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

class SignInVC: BaseVC {

    @IBOutlet weak var idTextField: MontTextFieldView!
    
    @IBOutlet weak var pwTextField: MontTextFieldView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        idTextField.textField.placeholder = "Id@email.com"
        pwTextField.textField.placeholder = "Password"
    }
    
    @IBAction func signInAction(_ sender: Any) {
//        if idTextField.text != nil {
//            self.view.makeToast("Please enter your ID")
//        } else if pwTextField.text != nil {
//            self.view.makeToast("Please enter your Password")
//        } else {
//             회원가입
//        }
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        
    }
    
}
