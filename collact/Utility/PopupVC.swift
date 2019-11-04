//
//  PopupVC.swift
//  collact
//
//  Created by minjae on 2019/11/05.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

class PopupVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func startPopupAnimation(_ animations : @escaping () -> Void){
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 1.0,
                       options: .curveEaseInOut,
                       animations: animations,
                       completion: nil)
    }
    
    func dismissPopupAnimation(_ animations : @escaping () -> Void, _ completion : @escaping (Bool) -> Void){
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 1.0,
                       options: .curveEaseInOut,
                       animations: animations,
                       completion: completion)
    }

}
