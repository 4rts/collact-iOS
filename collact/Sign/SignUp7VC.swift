//
//  SignUp7VC.swift
//  collact
//
//  Created by minjae on 07/10/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

class SignUp7VC: BaseVC {

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
        slider.thumbRect(forBounds: <#T##CGRect#>, trackRect: <#T##CGRect#>, value: <#T##Float#>)
    }
    
    @IBAction func changeSliderValue(_ sender: UISlider) {
        print(Int(sender.value))
        self.view.backgroundColor = UIColor.init(hue: CGFloat(353 / 360), saturation: CGFloat(sender.value / 100), brightness: 1, alpha: 1)
    }
}
