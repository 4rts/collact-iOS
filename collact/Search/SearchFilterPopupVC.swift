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
    var rangeValue: [Int] = [0, 10]
    
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
        
        setRangeSlider()
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
        rangeSlider.frame = CGRect(x: 0, y: 0, width: popupView.frame.width - 48, height: 42)
        rangeSlider.translatesAutoresizingMaskIntoConstraints = false
        rangeSlider.addTarget(self, action: #selector(rangeSliderValueChanged(rangeSlider:)), for: .valueChanged)
        popupView.addSubview(rangeSlider)
        
        rangeSlider.leftAnchor.constraint(equalTo: popupView.leftAnchor, constant: 24).isActive = true
        rangeSlider.rightAnchor.constraint(equalTo: popupView.rightAnchor, constant: -24).isActive = true
        rangeSlider.bottomAnchor.constraint(equalTo: popupView.bottomAnchor, constant: -40).isActive = true
        rangeSlider.heightAnchor.constraint(equalToConstant: 42).isActive = true
    }
    
    @objc func rangeSliderValueChanged(rangeSlider: RangeSlider) {
        rangeValue = [getRoundsValue(rangeSlider.lowerValue * 10), getRoundsValue(rangeSlider.lowerValue * 10)]
    }
    
    func getRoundsValue(_ value: Double) -> Int {
        return Int(ceil(value))
    }
    
}
