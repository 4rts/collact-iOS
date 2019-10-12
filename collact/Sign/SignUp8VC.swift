//
//  SignUp8VC.swift
//  collact
//
//  Created by minjae on 2019/10/11.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

class SignUp8VC: BaseVC {
    
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.maximumValue = 100
        slider.minimumValue = 20
        slider.value = 0.5
        slider.minimumTrackTintColor = UIColor.clear
        slider.maximumTrackTintColor = UIColor.clear
        slider.layer.borderWidth = 0.5
        slider.layer.borderColor = UIColor.white.cgColor
        slider.layer.cornerRadius = 30
    }
    
    @IBAction func changeSliderValue(_ sender: UISlider) {
        print(Int(sender.value))
        self.view.backgroundColor = UIColor.init(hue: CGFloat(353 / 360), saturation: CGFloat(sender.value / 100), brightness: 1, alpha: 1)
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        self.performSegue(withIdentifier: "NextStep", sender: nil)
    }
}
