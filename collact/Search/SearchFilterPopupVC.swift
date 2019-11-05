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
    @IBOutlet weak var commercialArtButton: UIButton!
    @IBOutlet weak var fineArtButton: UIButton!
    @IBOutlet weak var anythingButton: UIButton!
    
    let rangeSlider = RangeSlider(frame: .zero)
    var rangeValue: [Double] = [0, 1]
    var artTasteValue: ArtTaste = .ANYTHING
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let filterArtTaste = UserDefaults.standard.object(forKey: CodePreference.FILTER_ART_TASTE) {
            self.artTasteValue = ArtTaste(rawValue: filterArtTaste as! String) ?? .ANYTHING
            setArtTaste(artTaste: ArtTaste(rawValue: filterArtTaste as! String) ?? .ANYTHING)
        } else {
            setArtTaste(artTaste: .ANYTHING)
        }
        
        if let filterCareer = UserDefaults.standard.object(forKey: CodePreference.FILTER_CAREER) {
            self.rangeValue = filterCareer as! [Double]
            self.rangeSlider.lowerValue = rangeValue[0]
            self.rangeSlider.upperValue = rangeValue[1]
            self.rangeSlider.updateLayerFrames()
        }
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UserDefaults.standard.set(artTasteValue.rawValue, forKey: CodePreference.FILTER_ART_TASTE)
        UserDefaults.standard.set(rangeValue, forKey: CodePreference.FILTER_CAREER)
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
    
    @IBAction func pickArtTaste(_ sender: UIButton) {
        switch sender.tag {
        case 100:
            self.setArtTaste(artTaste: .COMMERCIAL)
        case 200:
            self.setArtTaste(artTaste: .FINE)
        default:
            self.setArtTaste(artTaste: .ANYTHING)
        }
    }
    
    func setArtTaste(artTaste: ArtTaste) {
        switch artTaste {
        case .COMMERCIAL:
            commercialArtButton.backgroundColor = .black
            fineArtButton.backgroundColor = .veryLightBlue
            anythingButton.backgroundColor = .veryLightBlue
        case .FINE:
            commercialArtButton.backgroundColor = .veryLightBlue
            fineArtButton.backgroundColor = .black
            anythingButton.backgroundColor = .veryLightBlue
        default:
            commercialArtButton.backgroundColor = .veryLightBlue
            fineArtButton.backgroundColor = .veryLightBlue
            anythingButton.backgroundColor = .black
        }
        self.artTasteValue = artTaste
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
        rangeValue = [rangeSlider.lowerValue, rangeSlider.upperValue]
    }
    
    func getRoundsValue(_ value: Double) -> Int {
        return Int(ceil(value))
    }
    
}
