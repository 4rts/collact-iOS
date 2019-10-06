//
//  SignUp6VC.swift
//  collact
//
//  Created by minjae on 06/10/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit
import Lottie
import Spring

class SignUp6VC: BaseVC {

    @IBOutlet weak var loadingView: SpringView!
    @IBOutlet weak var scrollContainerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.setLoadingView()
        self.setScrollViewLayout()
    }
    
    func setLoadingView() {
        let animationView = AnimationView(name:"ProfileColor")
        animationView.frame = CGRect(x:0, y:0, width: self.view.frame.width - 72, height: 100)
        animationView.contentMode = .scaleAspectFill
        self.loadingView.addSubview(animationView)
        animationView.play()
        animationAction(animationObject: loadingView, animation: "FadeOut", curve: "EaseIn", duration: 0.3, delay: 2.2)
    }
    
    func setScrollViewLayout() {
        pageControl.isHidden = true
        pageControl.numberOfPages = genreArray.count
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = false
        
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: CGFloat(genreArray.count) * (48 + 40), height: 70)
        
        scrollView.decelerationRate = UIScrollView.DecelerationRate.fast
        self.scrollContainerView.backgroundColor = .none
        
        for i in 0 ..< genreArray.count {
            let view: UIView = UIView(frame: CGRect(x: CGFloat(i) * (48 + 8) + 16, y: 0, width: 48, height: 48))
            view.layer.masksToBounds = true
            view.layer.cornerRadius = 5
            view.isUserInteractionEnabled = true
            view.backgroundColor = UIColor.black
            view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(buttonAction)))
            scrollView.addSubview(view)
        }
    }
    @objc func buttonAction() {
        
    }
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
//        self.performSegue(withIdentifier: "NextStep", sender: nil)
    }
}

extension SignUp6VC: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / (self.view.frame.width - 32 ))
        pageControl.currentPage = Int(pageIndex)
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let width = self.view.frame.width - 32 + 8
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
