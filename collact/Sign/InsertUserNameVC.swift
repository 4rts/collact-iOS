//
//  InsertUserNameVC.swift
//  collact
//
//  Created by minjae on 30/09/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

// TODO(2019/10/03): 안녕 애니메이션 끝나고 난 이후의 이름 입력 표현하는 법 디자이너들과 생각해보기

import UIKit
import Spring

class InsertUserNameVC: BaseVC {

    @IBOutlet weak var helloAnimationLabel: SpringLabel!
    @IBOutlet weak var nameTextFieldContainer: SpringView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var nameTextField: MontTextFieldView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.textField.placeholder = "Text your name in English"
        animationAction(animationObject: helloAnimationLabel, animation: "FadeIn", curve: "EaseIn", duration: 1.5, y: 70) {
            self.helloAnimationLabel.isHidden = true
            self.nameTextFieldContainer.isHidden = false
            self.backButton.isHidden = false
            self.nextButton.isHidden = false
        }
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        // TODO: 영문 벨리데이션 된 이후에 nextStep으로 이동하게 만들기
        self.performSegue(withIdentifier: "NextStep", sender: nil)
    }
}
