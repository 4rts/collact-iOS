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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
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
