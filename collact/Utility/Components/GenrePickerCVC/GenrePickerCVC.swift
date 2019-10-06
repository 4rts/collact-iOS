//
//  GenrePickerCVC.swift
//  collact
//
//  Created by minjae on 06/10/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

protocol GenrePickerDelegate {
    func pickerGenre()
}
class GenrePickerCVC: UICollectionViewCell {
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var isCheck: Bool = false
    var genrePickerDelegate: GenrePickerDelegate?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.pickItemAction)))
    }

    func setItemView(item: [String:Any]) {
        self.textLabel.text = item["name"] as? String
        self.textLabel.textColor = item["color"] as? UIColor
        self.textLabel.alpha = 0.2
        self.cornerRadius = 25
    }
    
    @objc func pickItemAction() {
        self.isCheck = !self.isCheck
        if self.isCheck {
            self.imageView.isHidden = false
            self.textLabel.alpha = 1
            self.backgroundColor = #colorLiteral(red: 0.9763678908, green: 0.976531446, blue: 0.9763450027, alpha: 1)
        } else {
            self.imageView.isHidden = true
            self.textLabel.alpha = 0.2
            self.backgroundColor = #colorLiteral(red: 0.9998950362, green: 1, blue: 0.9998714328, alpha: 1)
        }
        self.genrePickerDelegate?.pickerGenre()
    }
}
