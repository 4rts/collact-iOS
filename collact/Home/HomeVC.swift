//
//  HomeVC.swift
//  collact
//
//  Created by minjae on 29/09/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

class HomeVC: BaseVC {

    @IBOutlet weak var artistButton: UIButton!
    @IBOutlet weak var collaboButton: UIButton!
    @IBOutlet weak var artistView: UIView!
    @IBOutlet weak var collaboView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewType: ViewType = .ARTIST
    var myArtistCollectionCount = 9 / 3
    let artistCardCVC = UINib(nibName: "ArtistCardCVC", bundle: nil)
    let collaboCardCVC = UINib(nibName: "CollaboCardCVC", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setCollectionView()
    }

    func setCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(artistCardCVC, forCellWithReuseIdentifier: "ArtistCard")
        self.collectionView.register(collaboCardCVC, forCellWithReuseIdentifier: "CollaboCard")
        self.setContraint(collectionView, value: CGFloat(160 * myArtistCollectionCount))
    }
    
    @IBAction func changeToView(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            self.artistButton.setTitleColor(UIColor.gray15, for: .normal)
            self.artistView.isHidden = false
            self.collaboButton.setTitleColor(UIColor.black, for: .normal)
            self.collaboView.isHidden = true
            self.viewType = .ARTIST
        case 1:
            self.artistButton.setTitleColor(UIColor.black, for: .normal)
            self.artistView.isHidden = true
            self.collaboButton.setTitleColor(UIColor.gray15, for: .normal)
            self.collaboView.isHidden = false
            self.viewType = .COLLABO
        default:
            break
        }
    }
    
}
extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if viewType == .ARTIST {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArtistCard", for: indexPath) as! ArtistCardCVC
            cell.backgroundColor = UIColor.red
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollaboCard", for: indexPath) as! CollaboCardCVC
            cell.backgroundColor = UIColor.blue
            return cell
        }
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let artistCardWidth = (self.view.frame.width - 60) / 3
        let collaboCardWidth = (self.view.frame.width - 56) / 2
        if viewType == .ARTIST {
            return CGSize(width: artistCardWidth, height: 160)
        } else {
            return CGSize(width: collaboCardWidth, height: 160)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
}
