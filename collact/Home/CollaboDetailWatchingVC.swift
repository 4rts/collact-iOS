
//
//  CollaboDetailWatchingVC.swift
//  collact
//
//  Created by minjae on 2019/10/24.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

class CollaboDetailWatchingVC: BaseVC {

    @IBOutlet weak var collaboImageView: UIImageView!
    @IBOutlet weak var collaboPartnersLabel: UILabel!
    @IBOutlet weak var collaboDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    @IBAction func closeButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
    @IBAction func linkAction(_ sender: Any) {
        if let url = URL(string: "https://dribbble.com/shots/7779269-Otto") {
            UIApplication.shared.open(url, options: [:])
        }
    }
}
