//
//  HomeVC.swift
//  collact
//
//  Created by minjae on 29/09/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

class HomeVC: BaseVC {

    @IBOutlet weak var artistButton: UIButton!
    @IBOutlet weak var collaboButton: UIButton!
    @IBOutlet weak var artistView: UIView!
    @IBOutlet weak var collaboView: UIView!
    @IBOutlet weak var myCollectionView: UIView!
    
    var buttonFlag: ViewType = .ARTIST
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func changeToView(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            self.artistButton.setTitleColor(UIColor.gray15, for: .normal)
            self.artistView.isHidden = false
            self.collaboButton.setTitleColor(UIColor.black, for: .normal)
            self.collaboView.isHidden = true
            self.buttonFlag = .ARTIST
        case 1:
            self.artistButton.setTitleColor(UIColor.black, for: .normal)
            self.artistView.isHidden = true
            self.collaboButton.setTitleColor(UIColor.gray15, for: .normal)
            self.collaboView.isHidden = false
            self.buttonFlag = .COLLABO
        default:
            break
        }
    }
    
}
