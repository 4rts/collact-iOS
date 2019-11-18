//
//  ChatDetailVC.swift
//  collact
//
//  Created by minjae on 2019/11/19.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit
import SwiftyGif

class ChatDetailVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let gif = UIImage(named: "chat_gif.gif") {
//             detailImageView.setGifImage(gif)
//        }
        do {
            let gif = try UIImage(gifName: "chat_gif.gif")
            let imageview = UIImageView(gifImage: gif, loopCount: -1) // Use -1 for infinite loop
            imageview.frame = view.bounds
            view.addSubview(imageview)
        } catch {
            print(error)
        }
    }

}
