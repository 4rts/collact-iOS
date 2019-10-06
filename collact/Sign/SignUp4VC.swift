//
//  SignUp4VC.swift
//  collact
//
//  Created by minjae on 06/10/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

class SignUp4VC: BaseVC {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var itemArray = [
        ["name": "Image", "color": #colorLiteral(red: 0.9018599987, green: 0.0006837341934, blue: 0.1164185181, alpha: 1)],
        ["name": "Video", "color": #colorLiteral(red: 0.9478152394, green: 0.410014689, blue: 0, alpha: 1)],
        ["name": "Programming", "color": #colorLiteral(red: 0.9497713447, green: 0.7923770547, blue: 0.01942691952, alpha: 1)],
        ["name": "Music", "color": #colorLiteral(red: 0.3339171708, green: 0.8689348102, blue: 0, alpha: 1)],
        ["name": "Performance", "color": #colorLiteral(red: 0.00416468177, green: 0.71829319, blue: 0.8336349726, alpha: 1)],
        ["name": "Object", "color": #colorLiteral(red: 0, green: 0.2390471101, blue: 0.901499033, alpha: 1)],
        ["name": "Idea", "color": #colorLiteral(red: 0.378341198, green: 0, blue: 0.9022763371, alpha: 1)]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }

    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setInterestStackView() {

    }
}

extension SignUp4VC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemArray.count + 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SignUp4Title", for: indexPath) as! SignUp4TitleCVC
            return cell
        case itemArray.count + 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SignUp4ActionButton", for: indexPath) as! SignUp4ActionButtonCVC
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SignUp4Item", for: indexPath) as! SignUp4ItemCVC
            cell.setItemView(item: itemArray[indexPath.row - 1])
            return cell
        }
    }
}

extension SignUp4VC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.row {
        case 0:
            return CGSize(width: self.view.frame.width, height: 145)
        case itemArray.count + 1:
            return CGSize(width: self.view.frame.width, height: 150)
        default:
            return CGSize(width: self.view.frame.width, height: 60)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

class SignUp4TitleCVC: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
}

class SignUp4ItemCVC: UICollectionViewCell {
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemView: UIView!
    
    var isCheck: Bool = false
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.pickItemAction)))
    }
    
    func setItemView(item: [String:Any]) {
        self.textLabel.text = item["name"] as? String
        self.textLabel.textColor = item["color"] as? UIColor
        self.textLabel.alpha = 0.2
        
    }
    
    @objc func pickItemAction() {
        self.isCheck = !self.isCheck
        if self.isCheck {
            self.imageView.isHidden = false
            self.itemView.backgroundColor = #colorLiteral(red: 0.9763678908, green: 0.976531446, blue: 0.9763450027, alpha: 1)
            self.textLabel.alpha = 1
        } else {
            self.imageView.isHidden = true
            self.itemView.backgroundColor = #colorLiteral(red: 0.9998950362, green: 1, blue: 0.9998714328, alpha: 1)
            self.textLabel.alpha = 0.2
        }
    }
}

class SignUp4ActionButtonCVC: UICollectionViewCell {
    @IBOutlet weak var nextStepButton: UIButton!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.nextStepButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(nextStepAction)))
    }
    
    @objc func nextStepAction() {
        
    }
    
}
