//
//  SearchFilterPopupVC.swift
//  collact
//
//  Created by minjae on 2019/11/05.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

class SearchFilterPopupVC: BaseVC {

    @IBOutlet weak var alphaView: UIView!
    @IBOutlet weak var popupView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startPopupAnimation {
            self.alphaView.alpha = 0.4
            self.popupView.alpha = 1
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func closePopupAction(_ sender: Any) {
        dismissPopupAnimation( {
            self.alphaView.alpha = 0
            self.popupView.alpha = 0
            self.view.layoutIfNeeded()
        }, {_ in
            self.dismiss(animated: false, completion: nil)
        })
    }
    
}
