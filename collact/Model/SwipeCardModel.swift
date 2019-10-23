//
//  SwipeCardModel.swift
//  collact
//
//  Created by minjae on 2019/10/24.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

struct SwipeCardModel {
    
    var bgColor: UIColor
    var text : String
    var image : String
      
    init(bgColor: UIColor, text: String, image: String) {
        self.bgColor = bgColor
        self.text = text
        self.image = image
    
    }
}
