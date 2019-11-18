//
//  ProfileVC.swiftStackContainerView
//  collact
//
//  Created by minjae on 29/09/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

class ProfileVC: BaseVC {

    @IBOutlet weak var swipeCardContainerView: UIView!

    override func loadView() {
        super.loadView()
        configureSwipeCardView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraintForDevice(swipeCardContainerView, NotchO: 420, NotchX: 340, identifier: "height")
    }

    func configureSwipeCardView() {
        let array = [7,-7,0]
        for (index, i) in array.enumerated() {
            let swipeCardView = SwipeCardView()
            swipeCardView.transform = CGAffineTransform(rotationAngle: (CGFloat(i) * .pi) / 180.0)
            swipeCardView.artWorkImageView.image = UIImage(named: "demo_Image_malikafavre_\(index + 1)")
            swipeCardView.translatesAutoresizingMaskIntoConstraints = false
            swipeCardContainerView.addSubview(swipeCardView)
            
            swipeCardView.topAnchor.constraint(equalTo: swipeCardContainerView.topAnchor).isActive = true
            swipeCardView.leftAnchor.constraint(equalTo: swipeCardContainerView.leftAnchor).isActive = true
            swipeCardView.rightAnchor.constraint(equalTo: swipeCardContainerView.rightAnchor).isActive = true
            swipeCardView.bottomAnchor.constraint(equalTo: swipeCardContainerView.bottomAnchor).isActive = true
        }
    }
    
    @IBAction func artWorkRegisterAction(_ sender: Any) {
        
    }
}
