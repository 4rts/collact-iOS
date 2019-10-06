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

    let genreCell = UINib(nibName: "GenrePickerCVC", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(genreCell, forCellWithReuseIdentifier: "GenrePicker")
    }

    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func nextButtonAction(_ sender: Any) {
        self.performSegue(withIdentifier: "NextStep", sender: nil)
    }
}

extension SignUp4VC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genreArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenrePicker", for: indexPath) as! GenrePickerCVC
        cell.setItemView(item: genreArray[indexPath.row])
        return cell
    }
}

extension SignUp4VC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width - 72, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
