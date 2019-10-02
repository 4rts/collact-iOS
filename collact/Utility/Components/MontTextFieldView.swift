//
//  MontTextField.swift
//  collact
//
//  Created by minjae on 30/09/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

class MontTextFieldView: UIView {
    
    override lazy var attributedPlaceholder: NSAttributedString = {
        var attributedPlaceholder = NSAttributedString()
        var placeHolder = NSMutableAttributedString()
        // Set the Font
        placeHolder = NSMutableAttributedString(string: self.placeholder ?? "", attributes: [NSAttributedString.Key.font: UIFont(name: "Mont", size: 20.0)!])

        // Set the color
        placeHolder.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range:NSRange(location:0, length: self.placeholder?.count ?? 0))
        
        attributedPlaceholder = placeHolder
        return attributedPlaceholder
    }()
}
