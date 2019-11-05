//
//  RangeSlider.swift
//  collact
//
//  Created by minjae on 2019/11/05.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit
import QuartzCore

class RangeSlider: UIControl {
    
    let trackLayer: RangeSliderTrackLayer = RangeSliderTrackLayer()
    let lowerThumbLayer: RangeSliderThumbLayer = RangeSliderThumbLayer()
    let upperThumbLayer: RangeSliderThumbLayer = RangeSliderThumbLayer()
    var previousLocation: CGPoint = CGPoint()
    
    override var frame: CGRect {
        didSet {
            updateLayerFrames()
            
        }
    }
    
    var trackTintColor: UIColor = UIColor(hex: "#e3e8ec")
    var trackHighlightTintColor: UIColor = UIColor(hex: "#000000")
    var thumbTintColor: UIColor = .black
    var curvaceousness: CGFloat = 1.0
    var thumbWidth: CGFloat = 28
    
    var minimumValue = 0.0
    var maximumValue = 1.0
    var lowerValue = 0.0
    var upperValue = 1.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        trackLayer.rangeSlider = self
        upperThumbLayer.contentsScale = UIScreen.main.scale
        layer.addSublayer(trackLayer)
        
        lowerThumbLayer.rangeSlider = self
        lowerThumbLayer.contentsScale = UIScreen.main.scale
        lowerThumbLayer.locationValue = lowerValue
        layer.addSublayer(lowerThumbLayer)
        
        upperThumbLayer.rangeSlider = self
        upperThumbLayer.contentsScale = UIScreen.main.scale
        upperThumbLayer.locationValue = upperValue
        layer.addSublayer(upperThumbLayer)
        
        updateLayerFrames()
        
    }
    

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }

    func updateLayerFrames() {
        trackLayer.frame = CGRect(x: 0, y: self.frame.height/2 - 4,
                                  width: self.frame.width, height: 4)
        trackLayer.setNeedsDisplay()
        
        let lowerThumbCenter = CGFloat(positionForValue(value: lowerValue))
        lowerThumbLayer.frame = CGRect(x: lowerThumbCenter - thumbWidth / 2.0, y: 4,
                                       width: thumbWidth, height: thumbWidth)
        lowerThumbLayer.setNeedsDisplay()
        
        let upperThumbCenter = CGFloat(positionForValue(value: upperValue))
        upperThumbLayer.frame = CGRect(x: upperThumbCenter - thumbWidth / 2.0, y: 4,
                                       width: thumbWidth, height: thumbWidth)
        upperThumbLayer.setNeedsDisplay()
    }

    func positionForValue(value: Double) -> Double {
        return Double(bounds.width - thumbWidth) * (value - minimumValue) /
            (maximumValue - minimumValue) + Double(thumbWidth / 2.0)
    }
    
    func boundValue(value: Double, toLowerValue lowerValue: Double, upperValue: Double) -> Double {
        return min(max(value, lowerValue), upperValue)
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        previousLocation = touch.location(in: self)
        
        if lowerThumbLayer.frame.contains(previousLocation) {
            lowerThumbLayer.highlighted = true
        } else if upperThumbLayer.frame.contains(previousLocation) {
            upperThumbLayer.highlighted = true
        }
        
        return lowerThumbLayer.highlighted || upperThumbLayer.highlighted
    }

    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)
        let deltaLocation = Double(location.x - previousLocation.x)
        let deltaValue = (maximumValue - minimumValue) * deltaLocation / Double(bounds.width - thumbWidth)
        
        previousLocation = location
        
        if lowerThumbLayer.highlighted {
            lowerValue += deltaValue
            lowerValue = boundValue(value: lowerValue, toLowerValue: minimumValue, upperValue: upperValue - 0.1)
            lowerThumbLayer.locationValue = lowerValue
        } else if upperThumbLayer.highlighted {
            upperValue += deltaValue
            upperValue = boundValue(value: upperValue, toLowerValue: lowerValue + 0.1, upperValue: maximumValue)
            upperThumbLayer.locationValue = upperValue
        }
        
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        updateLayerFrames()
        
        CATransaction.commit()
        sendActions(for: .valueChanged)
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        lowerThumbLayer.highlighted = false
        upperThumbLayer.highlighted = false
    }
}

