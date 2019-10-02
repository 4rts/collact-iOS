//
//  MontTextField.swift
//  collact
//
//  Created by minjae on 30/09/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

class MontTextFieldView: UIView {

    lazy var textField: UITextField = {
        var textField = UITextField(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        textField.borderStyle = .none
        textField.minimumFontSize = 20
        textField.font = UIFont(name: "Mont", size: 20)!
        textField.attributedPlaceholder = changeAttributedString(string: textField.placeholder, color: UIColor.montGray)
        textField.attributedText = changeAttributedString(string: textField.text, color: UIColor.black)
        
        return textField
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(textField)
    }
    
    func changeAttributedString(string: String?, color: UIColor) -> NSMutableAttributedString {
        return NSMutableAttributedString(string: string ?? "", attributes: [NSAttributedString.Key.font: UIFont(name: "Mont", size: 20)!, NSAttributedString.Key.foregroundColor: color])
    }
}
