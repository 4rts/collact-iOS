//
//  MJSwipeCardStackView.swift
//  collact
//
//  Created by minjae on 2019/10/28.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

class MJSwipeCardStackView: UIView {
    
    //MARK: - Properties
    var numberOfCardsToShow: Int = 0
    var cardsToBeVisible: Int = 3
    var cardViews : [SwipeCardView] = []

}

extension MJSwipeCardStackView: MJSwipeCardsDelegate {
    func swipeDidEnd(on view: MJSwipeCardView) {
//        guard let datasource = dataSource else { return }
//        view.removeFromSuperview()
//
//        if remainingcards > 0 {
//            let newIndex = datasource.numberOfCardsToShow() - remainingcards
//            addCardView(cardView: datasource.card(at: newIndex), atIndex: 2)
//            for (cardIndex, cardView) in visibleCards.reversed().enumerated() {
//                UIView.animate(withDuration: 0.2, animations: {
//                cardView.center = self.center
//                  self.addCardFrame(index: cardIndex, cardView: cardView)
//                    self.layoutIfNeeded()
//                })
//            }
//
//        }else {
//            for (cardIndex, cardView) in visibleCards.reversed().enumerated() {
//                UIView.animate(withDuration: 0.2, animations: {
//                    cardView.center = self.center
//                    self.addCardFrame(index: cardIndex, cardView: cardView)
//                    self.layoutIfNeeded()
//                })
//            }
//        }
    }
}
