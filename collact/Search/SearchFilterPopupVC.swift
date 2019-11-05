//
//  SearchFilterPopupVC.swift
//  collact
//
//  Created by minjae on 2019/11/05.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

class SearchFilterPopupVC: PopupVC {

    @IBOutlet weak var alphaView: UIView!
    @IBOutlet weak var popupView: UIView!
    
    let rangeSlider = RangeSlider(frame: .zero)
    
    override func loadView() {
        super.loadView()
        setRangeSlider()
    }
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
    
    func setRangeSlider() {
        rangeSlider.frame = CGRect(x: 0, y: 0, width: popupView.frame.width, height: 90)
        rangeSlider.translatesAutoresizingMaskIntoConstraints = false
        rangeSlider.addTarget(self, action: #selector(rangeSliderValueChanged(rangeSlider:)), for: .valueChanged)
        popupView.addSubview(rangeSlider)
        
        rangeSlider.leftAnchor.constraint(equalTo: popupView.leftAnchor).isActive = true
        rangeSlider.rightAnchor.constraint(equalTo: popupView.rightAnchor).isActive = true
        rangeSlider.bottomAnchor.constraint(equalTo: popupView.bottomAnchor).isActive = true
        rangeSlider.heightAnchor.constraint(equalToConstant: 90).isActive = true
    }
    
    @objc func rangeSliderValueChanged(rangeSlider: RangeSlider) {
        print("Range slider value changed: (\(rangeSlider.lowerValue) \(rangeSlider.upperValue))")
    }
    
}
