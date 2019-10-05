//
//  SignUp2VC.swift
//  collact
//
//  Created by minjae on 05/10/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

class SignUp2VC: BaseVC {

    @IBOutlet weak var emailTextField: MontTextFieldView!
    @IBOutlet weak var passwordTextField: MontTextFieldView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.textField.placeholder = "id@email.com"
        passwordTextField.textField.placeholder = "*********"
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        // TODO: 영문 벨리데이션 된 이후에 nextStep으로 이동하게 만들기
        self.performSegue(withIdentifier: "NextStep", sender: nil)
    }
    
}
