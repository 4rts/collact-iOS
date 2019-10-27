//
//  SwipeCardView.swift
//  collact
//
//  Edited by minjae on 2019/10/28.
//  Created by Osama Naeem on 2019/03/16.
//  Copyright © 2019 NexThings. All rights reserved.
//

import UIKit

protocol SwipeCardsDelegate {
    func swipeDidEnd(on view: SwipeCardView)
}

class SwipeCardView: UIView {
    
    //MARK: - Properties
    var artWorkImageView: UIImageView!
    var descriptionView: UIView!
    var linkTextLabel: UILabel!
    var linkButton: UIButton!
    var titleTextLabel: UILabel!
    var descriptionTextLabel: UILabel!
    
    var dataSource: SwipeCardModel? {
        didSet {
//            swipeView.backgroundColor = dataSource?.bgColor
//            label.text = dataSource?.text
//            guard let image = dataSource?.image else { return }
//            imageView.image = UIImage(named: image)
        }
    }
    var viewSize: CGSize!
    var tapFlag: Bool = false
    var delegate: SwipeCardsDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configureViewSize()
        configureArtWorkImageView()
        configureDescriptionView()
        configureLinkTextLabel()
        configureLinkButton()
        configureDescriptionTextLabel()
        configureTitleTextLabel()
        configureTapGesture()
        configurePanGestureOnCards()
        
        artWorkImageView.image = UIImage(named: "demoImage1")
        linkTextLabel.text = "https://www.instagram.com/p/B3MFSSQpDJn/"
        titleTextLabel.text = "제목없음 (2019.07)"
        descriptionTextLabel.text = "날아오르는 봉황과 빨간 새를 은은한 느낌으로 보여주며 특유의 질감과 기법을 사용하여 표현하였다. 아름다운 표현이다. 붓글씨를 활용했다."
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configuration
    
    func configureViewSize() {
        if UIDevice.current.isiPhoneXS || UIDevice.current.isiPhoneXSMAX  {
            viewSize = CGSize(width: 280, height: 420)
        } else {
            viewSize = CGSize(width: 233, height: 340)
        }
    }
    
    func configureArtWorkImageView() {
        artWorkImageView = UIImageView()
        artWorkImageView.contentMode = .scaleAspectFit
        artWorkImageView.layer.cornerRadius = 5
        artWorkImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(artWorkImageView)
        
        artWorkImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        artWorkImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        artWorkImageView.widthAnchor.constraint(equalToConstant: viewSize.width).isActive = true
        artWorkImageView.heightAnchor.constraint(equalToConstant: viewSize.height).isActive = true
    }
    
    func configureDescriptionView() {
        descriptionView = UIView()
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.isHidden = true
        tapFlag = true
        descriptionView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        descriptionView.layer.cornerRadius = 5
        addSubview(descriptionView)
        
        descriptionView.topAnchor.constraint(equalTo: artWorkImageView.topAnchor).isActive = true
        descriptionView.leadingAnchor.constraint(equalTo: artWorkImageView.leadingAnchor).isActive = true
        descriptionView.trailingAnchor.constraint(equalTo: artWorkImageView.trailingAnchor).isActive = true
        descriptionView.bottomAnchor.constraint(equalTo: artWorkImageView.bottomAnchor).isActive = true
    }
    
    func configureLinkTextLabel() {
        linkTextLabel = UILabel()
        linkTextLabel.translatesAutoresizingMaskIntoConstraints = false
        linkTextLabel.textColor = .white
        linkTextLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        linkTextLabel.numberOfLines = 0
        descriptionView.addSubview(linkTextLabel)
        
        linkTextLabel.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 20).isActive = true
        linkTextLabel.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant: 20).isActive = true
    }
    
    func configureLinkButton() {
        linkButton = UIButton()
        linkButton.setImage(UIImage(named: "icLink"), for: .normal)
        linkButton.contentEdgeInsets.left = 12
        linkButton.contentEdgeInsets.right = 20
        linkButton.contentEdgeInsets.top = 21
        linkButton.contentEdgeInsets.bottom = 21
        linkButton.translatesAutoresizingMaskIntoConstraints = false
        linkButton.addTarget(self, action: #selector(openSiteLink), for: .touchUpInside)
        descriptionView.addSubview(linkButton)
        
        linkButton.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 0).isActive = true
        linkButton.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor, constant: 0).isActive = true
        linkButton.leadingAnchor.constraint(equalTo: linkTextLabel.trailingAnchor, constant: 0).isActive = true
    }
    
    func configureDescriptionTextLabel() {
        descriptionTextLabel = UILabel()
        descriptionTextLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextLabel.textColor = .white
        descriptionTextLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        descriptionTextLabel.numberOfLines = 0
        descriptionView.addSubview(descriptionTextLabel)
        
        descriptionTextLabel.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: -20).isActive = true
        descriptionTextLabel.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant: 20).isActive = true
        descriptionTextLabel.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor, constant: -20).isActive = true
    }
    
    func configureTitleTextLabel() {
        titleTextLabel = UILabel()
        titleTextLabel.translatesAutoresizingMaskIntoConstraints = false
        titleTextLabel.textColor = .white
        titleTextLabel.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        titleTextLabel.numberOfLines = 0
        descriptionView.addSubview(titleTextLabel)
        
        titleTextLabel.bottomAnchor.constraint(equalTo: descriptionTextLabel.topAnchor, constant: -16).isActive = true
        titleTextLabel.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant: 20).isActive = true
        titleTextLabel.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor, constant: -20).isActive = true
    }
    
    func configureTapGesture() {
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapGesture)))
    }
    
    func configurePanGestureOnCards() {
        self.isUserInteractionEnabled = true
        addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture)))
    }
    //MARK: - Handlers
    @objc func openSiteLink() {
        if let url = URL(string: linkTextLabel.text ?? "") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    @objc func handlePanGesture(sender: UIPanGestureRecognizer){
        let card = sender.view as! SwipeCardView
        let point = sender.translation(in: self)
        let centerOfParentContainer = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        card.center = CGPoint(x: centerOfParentContainer.x + point.x, y: centerOfParentContainer.y + point.y)
        
        switch sender.state {
        case .ended:
            if card.center.x > 350 {
                delegate?.swipeDidEnd(on: card)
                UIView.animate(withDuration: 0.2) {
                    card.center = CGPoint(x: centerOfParentContainer.x + point.x + 200, y: centerOfParentContainer.y + point.y + 75)
                    card.alpha = 0
                    self.layoutIfNeeded()
                }
                return
            } else if card.center.x < 60 {
                delegate?.swipeDidEnd(on: card)
                UIView.animate(withDuration: 0.2) {
                    card.center = CGPoint(x: centerOfParentContainer.x + point.x - 200, y: centerOfParentContainer.y + point.y + 75)
                    card.alpha = 0
                    self.layoutIfNeeded()
                }
                return
            } else if card.center.y > 400 {
                delegate?.swipeDidEnd(on: card)
                UIView.animate(withDuration: 0.2) {
                  card.center = CGPoint(x: centerOfParentContainer.x + point.x, y: centerOfParentContainer.y + point.y + 300)
                  card.alpha = 0
                  self.layoutIfNeeded()
                }
                return
            } else if card.center.y < 40 {
                delegate?.swipeDidEnd(on: card)
                UIView.animate(withDuration: 0.2) {
                  card.center = CGPoint(x: centerOfParentContainer.x + point.x, y: centerOfParentContainer.y + point.y - 300)
                  card.alpha = 0
                  self.layoutIfNeeded()
                }
                return
            }
            UIView.animate(withDuration: 0.2) {
                card.transform = .identity
                card.center = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
                self.layoutIfNeeded()
            }
        case .changed:
            let rotation = tan(point.x / (self.frame.width * 2.0))
            card.transform = CGAffineTransform(rotationAngle: rotation)
            
        default:
            break
        }
    }
    
    @objc func handleTapGesture(sender: UITapGestureRecognizer) {
        tapFlag = !tapFlag
        if tapFlag {
            descriptionView.isHidden = true
        } else {
            descriptionView.isHidden = false
        }
    }

}
