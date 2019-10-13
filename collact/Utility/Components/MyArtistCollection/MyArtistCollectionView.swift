//
//  MyArtistCollectionView.swift
//  collact
//
//  Created by minjae on 2019/10/13.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

class MyArtistCollectionView: UIView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func setCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
}

extension MyArtistCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}

extension MyArtistCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return 
    }
}
