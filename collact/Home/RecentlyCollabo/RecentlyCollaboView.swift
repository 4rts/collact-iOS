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
    @IBOutlet weak var pageControl: UIPageControl!
    
    var collaboDetailDelegate: CollaboDetailDelegate?
    var recentlyCollaboList = [["demo_Image_artist_3","demo_Image_artist_5"],["demo_Image_artist_10","demo_Image_artist_30"],["demo_Image_artist_32","demo_Image_artist_22"], ["demo_Image_artist_38","demo_Image_artist_25"]]
    var colorArr = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor.blue, UIColor.cyan]
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .none
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
        
        for (index, recentlyCollabo) in recentlyCollaboList.enumerated() {
            let view = UIView(frame: CGRect(x: CGFloat(index) * (width + 8) + 16, y: 0, width: width, height: 240))
            view.tag = index
            view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(buttonAction)))
            let image1 = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width/2, height: view.frame.height))
            setImageView(image1, imageTitle: recentlyCollabo[0])
            view.addSubview(image1)
            
            let image2 = UIImageView(frame: CGRect(x: view.frame.width/2, y: 0, width: view.frame.width/2, height: view.frame.height))
            setImageView(image2, imageTitle: recentlyCollabo[1])
            view.addSubview(image2)
            
            let foregroundView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
            foregroundView.backgroundColor = UIColor.white
            foregroundView.alpha = 0.2
            view.addSubview(foregroundView)
            
            let gradationColorView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
            leftToRightGradientColor(gradationColorView, colorArray: [colorArr[Int.random(in: 0 ..< 6)], colorArr[Int.random(in: 0 ..< 6)]])
            gradationColorView.alpha = 0.5
            view.addSubview(gradationColorView)
            
            let collaboArtists = UILabel(frame: CGRect(x: 0, y: 102, width: view.frame.width, height: 17))
            collaboArtists.textAlignment = .center
            collaboArtists.textColor = UIColor.white
            collaboArtists.font = UIFont(name: "Mont", size: 14)
            collaboArtists.text = "Grabit X Jvdas Berra"
            view.addSubview(collaboArtists)
            
            let collaboDate = UILabel(frame: CGRect(x: 0, y: 126, width: view.frame.width, height: 15))
            collaboDate.textAlignment = .center
            collaboDate.textColor = UIColor.init(red: 255, green: 255, blue: 255, alpha: 0.8)
            collaboDate.font = UIFont(name: "Mont", size: 14)
            collaboDate.text = "2019.09.28"
            view.addSubview(collaboDate)
            
            let collectionBoxBtn = UIButton(frame: CGRect(x: view.frame.width - 44, y: 20, width: 24, height: 20))
            collectionBoxBtn.setImage(UIImage(named: "icCollectionWhiteUnabled"), for: .normal)
            collectionBoxBtn.addTarget(self, action: #selector(collectionBoxAction), for: .touchUpInside)
            collectionBoxBtn.tag = 1000
            view.addSubview(collectionBoxBtn)
            
            scrollView.addSubview(view)
        }
    }
    
    func setImageView(_ view: UIImageView, imageTitle: String ) {
        view.image = UIImage(named: imageTitle)
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        view.isUserInteractionEnabled = true
    }
    
    @objc func collectionBoxAction() {
        let view = scrollView.viewWithTag(pageControl.currentPage)
        let button = view?.viewWithTag(1000) as! UIButton
        button.setImage(UIImage(named: "icCollectionWhite"), for: .normal)
    }
    
    @objc func buttonAction() {
        collaboDetailDelegate?.enterCollaboDetail()
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
