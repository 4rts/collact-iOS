//
//  HomeVC.swift
//  collact
//
//  Created by minjae on 29/09/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

protocol CollaboDetailDelegate {
    func enterCollaboDetail()
}

class HomeVC: BaseVC {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var artistButton: UIButton!
    @IBOutlet weak var collaboButton: UIButton!
    @IBOutlet weak var artistView: UIView!
    @IBOutlet weak var collaboView: UIView!
    @IBOutlet weak var svBorderView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var mainBannerLabel: UILabel!
    @IBOutlet weak var myCollaboLabel: UILabel!
    
    var viewType: ViewType = .ARTIST
    let artistCardCVC = UINib(nibName: "ArtistCardCVC", bundle: nil)
    let collaboCardCVC = UINib(nibName: "CollaboCardCVC", bundle: nil)
    let myArtistCount = Int(ceil(14 / 3))
    let mycollaboCount = Int(ceil(14 / 2))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.delegate = self
        self.setCollectionView()
        self.setRecentlyCollaboView()
        self.setTodayArtistView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }

    func setTodayArtistView() {
        let view = Bundle.main.loadNibNamed("TodayArtistView", owner: self, options: nil)?.first as! TodayArtistView
        view.frame = CGRect(x: 0, y: 0, width: artistView.frame.width, height: 330)
        artistView.addSubview(view)
    }
    
    func setRecentlyCollaboView() {
        let view = Bundle.main.loadNibNamed("RecentlyCollaboView", owner: self, options: nil)?.first as! RecentlyCollaboView
        view.frame = CGRect(x: 0, y: 0, width: collaboView.frame.width, height: 280)
        view.collaboDetailDelegate = self
        collaboView.addSubview(view)
    }
    
    
    func setCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(artistCardCVC, forCellWithReuseIdentifier: "ArtistCard")
        self.collectionView.register(collaboCardCVC, forCellWithReuseIdentifier: "CollaboCard")
        if viewType == .ARTIST {
            self.setConstraint(collectionView, value: CGFloat(160 * myArtistCount + 50))
        } else {
            self.setConstraint(collectionView, value: CGFloat(160 * mycollaboCount + 50))
        }
    }
    
    @IBAction func changeToView(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            self.artistButton.setTitleColor(UIColor.black, for: .normal)
            self.artistView.isHidden = false
            self.collaboButton.setTitleColor(UIColor.black15, for: .normal)
            self.mainBannerLabel.text = "Today's Image artists"
            self.myCollaboLabel.text = "My artist collection"
            self.collaboView.isHidden = true
            self.viewType = .ARTIST
        case 1:
            self.artistButton.setTitleColor(UIColor.black15, for: .normal)
            self.artistView.isHidden = true
            self.collaboButton.setTitleColor(UIColor.black, for: .normal)
            self.mainBannerLabel.text = "Latest Collaboration"
            self.myCollaboLabel.text = "My collabo collection"
            self.collaboView.isHidden = false
            self.viewType = .COLLABO
        default:
            break
        }
        if viewType == .ARTIST {
            self.setConstraint(collectionView, value: CGFloat(16 * myArtistCount))
        } else {
            self.setConstraint(collectionView, value: CGFloat(160 * mycollaboCount))
        }
        collectionView.reloadData()
    }
    
}
extension HomeVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if viewType == .ARTIST {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArtistCard", for: indexPath) as! ArtistCardCVC
            setConstraint(cell.imageView, value: (self.collectionView.frame.width - 16) / 3)
            cell.imageView.image = UIImage(named: "demo_Image_artist_\(Int.random(in: 1 ..< 41))")
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollaboCard", for: indexPath) as! CollaboCardCVC
            setConstraint(cell.imageContainer, value: (self.collectionView.frame.width - 8) / 2)
            cell.leftImageView.image = UIImage(named: "demo_Image_artist_\(Int.random(in: 1 ..< 41))")
            cell.rightImageView.image = UIImage(named: "demo_Image_artist_\(Int.random(in: 1 ..< 41))")
            return cell
        }
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let artistCardWidth = (self.collectionView.frame.width - 16) / 3
        let collaboCardWidth = (self.collectionView.frame.width - 8) / 2
        if viewType == .ARTIST {
            return CGSize(width: artistCardWidth, height: 160)
        } else {
            return CGSize(width: collaboCardWidth, height: 160)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

extension HomeVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if viewType == .ARTIST {
            if offsetY < 330 {
                svBorderView.isHidden = true
            } else {
                svBorderView.isHidden = false
            }
        } else {
            if offsetY < 280 {
                svBorderView.isHidden = true
            } else {
                svBorderView.isHidden = false
            }
        }
    }
}

extension HomeVC: CollaboDetailDelegate {
    func enterCollaboDetail() {
        self.performSegue(withIdentifier: "CollaboDetail", sender: nil)
    }
}

