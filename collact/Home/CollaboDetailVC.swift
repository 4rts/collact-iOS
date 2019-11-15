//
//  CollaboDetailVC.swift
//  collact
//
//  Created by minjae on 2019/10/16.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

class CollaboDetailVC: BaseVC {

    @IBOutlet weak var cardScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collaboArtistsNameLabel: UILabel!
    @IBOutlet weak var howManyLikeThisCollaboLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    
    // Card Outlet
    @IBOutlet weak var completeDateLabel1: UILabel!
    @IBOutlet weak var completeDateLabel2: UILabel!
    @IBOutlet weak var collaboTextLabel: UILabel!
    
    // Partner Outlet
    @IBOutlet weak var partner1Image: UIImageView!
    @IBOutlet weak var partner1Label: UILabel!
    @IBOutlet weak var partner2Image: UIImageView!
    @IBOutlet weak var partner2Label: UILabel!
    
    
    // 나중에 heartFlag가 클래스에 들어가야겠지만 지금은 안에서만 처리
    var heartFlag: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardScrollView.isPagingEnabled = true
        cardScrollView.alwaysBounceVertical = false
        cardScrollView.alwaysBounceHorizontal = false
        pageControl.hidesForSinglePage = true
        pageControl.numberOfPages = 2
        pageControl.pageIndicatorTintColor = .darkGray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }

    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func heartButtonAction(_ sender: Any) {
        self.heartFlag = !heartFlag
        if self.heartFlag {
            self.heartButton.alpha = 1
        } else {
            self.heartButton.alpha = 0.4
        }
    }
    @IBAction func profilePopupAction(_ sender: Any) {
        // 이후 segue 인자 sender에 넣어 값 넘겨야함
        self.performSegue(withIdentifier: "ProfilePopup", sender: nil)
    }
    
    @IBAction func collaboWatchingAction(_ sender: Any) {
        self.performSegue(withIdentifier: "CollaboDetailWatching", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ProfilePopup" {
//            let popupVC = segue.destination as! ProfilePopupVC
        }
    }
    
}


extension CollaboDetailVC: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floor(scrollView.contentOffset.x / UIScreen.main.bounds.width))
    }
}
