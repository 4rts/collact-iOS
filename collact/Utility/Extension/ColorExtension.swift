//
//  ColorExtension.swift
//  jjanhaeyo
//
//  Created by minjae on 08/09/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

// HEX Value
extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b: CGFloat
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat(hexNumber & 0x0000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: 1.0)
                    return
                }
            }
        }
        return nil
    }
    
    static var montGray: UIColor = {
        return UIColor(red: 178, green: 185, blue: 191, alpha: 1.0)
    }()
    
    static var black15: UIColor = {
        return UIColor(red: 0, green: 0, blue: 0, alpha: 0.15)
    }()

    static var white85: UIColor = {
        return UIColor(red: 255, green: 255, blue: 255, alpha: 0.85)
    }()
    
    static var veryLightBlue: UIColor = {
        return UIColor(hex: "#e3e8ee")
    }()
}

public func leftToRightGradientColor<T: UIView>(_ pasteToView: T, colorArray: [UIColor]) {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = pasteToView.bounds
    gradientLayer.colors = [colorArray[0].cgColor, colorArray[1].cgColor]
    gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
    gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
    pasteToView.layer.addSublayer(gradientLayer)
}

public func topToBottomGradientColor<T: UIView>(_ pasteToView: T, colorArray: [UIColor]) {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = pasteToView.bounds
    gradientLayer.colors = [colorArray[0].cgColor, colorArray[1].cgColor]
    gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
    gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
    pasteToView.layer.addSublayer(gradientLayer)
}
