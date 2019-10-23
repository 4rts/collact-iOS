//
//  BaseVC.swift
//  collact
//
//  Created by minjae on 29/09/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit
import Spring

class BaseVC: UIViewController {
    
    var genreArray = [
        ["name": "Image", "color": #colorLiteral(red: 0.9018599987, green: 0.0006837341934, blue: 0.1164185181, alpha: 1)],
        ["name": "Video", "color": #colorLiteral(red: 0.9478152394, green: 0.410014689, blue: 0, alpha: 1)],
        ["name": "Programming", "color": #colorLiteral(red: 0.9497713447, green: 0.7923770547, blue: 0.01942691952, alpha: 1)],
        ["name": "Music", "color": #colorLiteral(red: 0.3339171708, green: 0.8689348102, blue: 0, alpha: 1)],
        ["name": "Performance", "color": #colorLiteral(red: 0.00416468177, green: 0.71829319, blue: 0.8336349726, alpha: 1)],
        ["name": "Object", "color": #colorLiteral(red: 0, green: 0.2390471101, blue: 0.901499033, alpha: 1)],
        ["name": "Idea", "color": #colorLiteral(red: 0.378341198, green: 0, blue: 0.9022763371, alpha: 1)]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setConstraint<T:UIView>(_ view: T, value: CGFloat, identifier: String = "constraint") {
        for constraint in view.constraints {
            if constraint.identifier == identifier {
                constraint.constant = value
            }
        }
    }
    
    func setConstraintForDevice(_ view : UIView, NotchO: CGFloat, NotchX: CGFloat, identifier: String = "constraint"){
        for constraint in view.constraints {
            if constraint.identifier == identifier {
                if (UIDevice.current.isiPhoneXS || UIDevice.current.isiPhoneXSMAX)  {
                    constraint.constant = NotchO
                }
                else {
                    constraint.constant = NotchX
                }
            }
        }
    }
    
    func animationAction<T:Springable>(animationObject: T, autostart: Bool = true, animation: String = "FadeInUp", curve: String = "EaseIn", duration: CGFloat = 0, delay: CGFloat = 0,x: CGFloat = 0, y: CGFloat = 0, callback: @escaping(()->Void) = {}) {
        animationObject.autostart = autostart
        animationObject.animation = animation
        animationObject.curve = curve
        animationObject.duration = duration
        animationObject.delay = delay
        animationObject.x = x
        animationObject.y = y
        animationObject.animate()
        Timer.scheduledTimer(withTimeInterval: TimeInterval(duration + delay), repeats: false) { _ in
            callback()
        }
    }
}
