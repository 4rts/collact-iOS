//
//  TodayArtistView.swift
//  collact
//
//  Created by minjae on 2019/10/13.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

class TodayArtistView: UIView {

    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var artistDescriptionLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let workCardCVC = UINib(nibName: "WorkCardCVC", bundle: nil)
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(workCardCVC, forCellWithReuseIdentifier: "WorkCard")
    }

}

extension TodayArtistView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorkCard", for: indexPath) as! WorkCardCVC
        cell.workImageView.image = UIImage(named: "demoImage2")
        return cell
    }
    
}

extension TodayArtistView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 240)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

