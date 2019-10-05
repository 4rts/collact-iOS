//
//  SignUp3VC.swift
//  collact
//
//  Created by minjae on 05/10/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

class SignUp3VC: BaseVC {
    
    @IBOutlet weak var yesButtonView: UIView!
    @IBOutlet weak var yesTextLabel: UILabel!
    @IBOutlet weak var noButtonView: UIView!
    @IBOutlet weak var noTextLabel: UILabel!
    
    var artistFlag: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        // TODO: 영문 벨리데이션 된 이후에 nextStep으로 이동하게 만들기
        self.performSegue(withIdentifier: "NextStep", sender: nil)
    }
    
    @IBAction func pickButtonAction(_ sender: Any) {
        if (sender as! UIButton).tag == 0 {
            self.changeButtonState(button: yesButtonView, label: yesTextLabel, flag: true)
            self.changeButtonState(button: noButtonView, label: noTextLabel, flag: false)
            self.artistFlag = true
        } else {
            self.changeButtonState(button: yesButtonView, label: yesTextLabel, flag: false)
            self.changeButtonState(button: noButtonView, label: noTextLabel, flag: true)
            self.artistFlag = false
        }
    }
    
    func changeButtonState(button: UIView, label: UILabel, flag: Bool) {
        if flag {
            button.backgroundColor = #colorLiteral(red: 0.9763678908, green: 0.976531446, blue: 0.9763450027, alpha: 1)
            label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        } else {
            button.backgroundColor = #colorLiteral(red: 0.9998950362, green: 1, blue: 0.9998714328, alpha: 1)
            label.textColor = #colorLiteral(red: 0.8958352208, green: 0.9100166559, blue: 0.9271379113, alpha: 1)
        }
    }
}
