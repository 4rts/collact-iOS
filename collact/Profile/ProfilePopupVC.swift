//
//  ProfilePopupVC.swift
//  collact
//
//  Created by minjae on 2019/10/27.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

class ProfilePopupVC: BaseVC {
    
    @IBOutlet weak var gradationColorView: UIView!
    @IBOutlet weak var historyCountLabel: UILabel!
    @IBOutlet weak var collectorCountLabel: UILabel!
    @IBOutlet weak var chatableLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        topToBottomGradientColor(gradationColorView, colorArray: [UIColor(hex: "#ffffff"), UIColor(hex: "#e4e8ed")])
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//         topToBottomGradientColor(gradationColorView, colorArray: [UIColor.red, UIColor.blue])
    }

}
