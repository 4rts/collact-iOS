//
//  RangeSliderThumbLayer.swift
//  collact
//
//  Created by minjae on 2019/11/05.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit
import QuartzCore

class RangeSliderThumbLayer: CALayer {
    
    lazy var thumbValueTextLayer: CATextLayer = {
        let textLayer = CATextLayer()
        textLayer.string = "\(Int(ceil(locationValue * 10)))"
        textLayer.font = UIFont(name: "Mont", size: 14)
        textLayer.fontSize = 14
        textLayer.alignmentMode = .center
        textLayer.foregroundColor = UIColor.black.cgColor
        return textLayer
    }()
    
    var highlighted: Bool = false {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var locationValue: Double = 0
    weak var rangeSlider: RangeSlider?
    
    override func draw(in ctx: CGContext) {
        thumbValueTextLayer.frame = CGRect(x: 0, y: -16, width: self.frame.width, height: 17)
        thumbValueTextLayer.string = "\(Int(ceil(locationValue * 10)))"
        self.addSublayer(thumbValueTextLayer)
        
        if let slider = rangeSlider {

            let thumbFrame = bounds
            let cornerRadius = thumbFrame.height * slider.curvaceousness / 2.0
            let thumbPath = UIBezierPath(roundedRect: thumbFrame, cornerRadius: cornerRadius)
            
            // Fill - with a subtle shadow
            let shadowColor = UIColor.white
            ctx.setShadow(offset: CGSize(width: 0.0, height: 0.0), blur: 1.0, color: shadowColor.cgColor)
            ctx.setFillColor(slider.thumbTintColor.cgColor)
            ctx.addPath(thumbPath.cgPath)
            ctx.fillPath()
            
            // Outline
        
            ctx.setStrokeColor(shadowColor.cgColor)
            ctx.setLineWidth(5)
            ctx.addPath(thumbPath.cgPath)
            ctx.strokePath()
            
            if highlighted {
                ctx.setFillColor(UIColor(white: 0.0, alpha: 0.1).cgColor)
                ctx.addPath(thumbPath.cgPath)
                ctx.fillPath()
            }
        }
    }
}
