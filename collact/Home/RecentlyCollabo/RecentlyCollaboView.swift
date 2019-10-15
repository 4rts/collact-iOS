//
//  RecentlyCollaboView.swift
//  collact
//
//  Created by minjae on 2019/10/13.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

class RecentlyCollaboView: UIView {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var recentlyCollaboList = ["demoImage1","demoImage2","demoImage1","demoImage2"]
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setLayout()
    }
    
    func setLayout(){
        let width = self.frame.width - 32
        pageControl.backgroundColor = .none
        pageControl.numberOfPages = recentlyCollaboList.count
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = false
        
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: CGFloat(recentlyCollaboList.count) * (width + 16), height: 240)
        
        scrollView.decelerationRate = UIScrollView.DecelerationRate.fast
        
        self.backgroundColor = .none
        
        for i in 0 ..< recentlyCollaboList.count {
            let image: UIImageView = UIImageView(frame: CGRect(x: CGFloat(i) * (width + 8) + 16, y: 0, width: width, height: 240))
//            image.sd_setImage(with: URL(string: bannerList[i].eventBannerURL ?? ""))
            image.image = UIImage(named: recentlyCollaboList[i])
            image.contentMode = .scaleToFill
            image.layer.masksToBounds = true
            image.layer.cornerRadius = 5
            image.isUserInteractionEnabled = true
            scrollView.addSubview(image)
        }
    }
}

extension RecentlyCollaboView: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / (self.frame.width - 32))
        pageControl.currentPage = Int(pageIndex)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let width = self.frame.width - 32 + 8
        var offset = targetContentOffset.pointee
        let index = (offset.x) / width
        var roundIndex = round(index)
        
        if scrollView.contentOffset.x > targetContentOffset.pointee.x {
            roundIndex = floor(index)
        }else {
            roundIndex = ceil(index)
        }
        offset = CGPoint(x: roundIndex * width, y : 0)
        targetContentOffset.pointee = offset
    }
}
