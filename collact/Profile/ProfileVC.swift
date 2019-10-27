//
//  ProfileVC.swiftStackContainerView
//  collact
//
//  Created by minjae on 29/09/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet weak var swipeCardContainerView: UIView!

    var swipeCardStackView: SwipeCardStackView!
    
    var viewModelData = [SwipeCardModel(bgColor: UIColor(red:0.96, green:0.81, blue:0.46, alpha:1.0), text: "Hamburger", image: "demoImage1"),
    SwipeCardModel(bgColor: UIColor(red:0.29, green:0.64, blue:0.96, alpha:1.0), text: "Puppy", image: "demoImage1"),
    SwipeCardModel(bgColor: UIColor(red:0.29, green:0.63, blue:0.49, alpha:1.0), text: "Poop", image: "demoImage1"),
    SwipeCardModel(bgColor: UIColor(red:0.69, green:0.52, blue:0.38, alpha:1.0), text: "Panda", image: "demoImage1"),
    SwipeCardModel(bgColor: UIColor(red:0.90, green:0.99, blue:0.97, alpha:1.0), text: "Subway", image: "demoImage1"),
    SwipeCardModel(bgColor: UIColor(red:0.83, green:0.82, blue:0.69, alpha:1.0), text: "Robot", image: "demoImage1")]

    override func loadView() {
        super.loadView()
        
        self.setSwipeCardContainerView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func setSwipeCardContainerView() {
        swipeCardStackView = SwipeCardStackView()
        swipeCardStackView.dataSource = self
        swipeCardStackView.translatesAutoresizingMaskIntoConstraints = false
        swipeCardContainerView.addSubview(swipeCardStackView)
        
        swipeCardStackView.topAnchor.constraint(equalTo: swipeCardContainerView.topAnchor).isActive = true
        swipeCardStackView.leadingAnchor.constraint(equalTo: swipeCardContainerView.leadingAnchor).isActive = true
        swipeCardStackView.trailingAnchor.constraint(equalTo: swipeCardContainerView.trailingAnchor).isActive = true
        swipeCardStackView.bottomAnchor.constraint(equalTo: swipeCardContainerView.bottomAnchor).isActive = true

    }
    
    @IBAction func artWorkRegisterAction(_ sender: Any) {
        
    }
}

extension ProfileVC : SwipeCardsDataSource {

    func numberOfCardsToShow() -> Int {
        return viewModelData.count
    }

    func card(at index: Int) -> SwipeCardView {
        let card = SwipeCardView()
        card.dataSource = viewModelData[index]
        return card
    }

    func emptyView() -> UIView? {
        return nil
    }


}
