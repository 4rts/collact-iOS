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
    
    var genreArray = [
        ["name": "Image", "color": #colorLiteral(red: 0.9018599987, green: 0.0006837341934, blue: 0.1164185181, alpha: 1)],
        ["name": "Video", "color": #colorLiteral(red: 0.9478152394, green: 0.410014689, blue: 0, alpha: 1)],
        ["name": "Programming", "color": #colorLiteral(red: 0.9497713447, green: 0.7923770547, blue: 0.01942691952, alpha: 1)],
        ["name": "Music", "color": #colorLiteral(red: 0.3339171708, green: 0.8689348102, blue: 0, alpha: 1)],
        ["name": "Performance", "color": #colorLiteral(red: 0.00416468177, green: 0.71829319, blue: 0.8336349726, alpha: 1)],
        ["name": "Object", "color": #colorLiteral(red: 0, green: 0.2390471101, blue: 0.901499033, alpha: 1)],
        ["name": "Idea", "color": #colorLiteral(red: 0.378341198, green: 0, blue: 0.9022763371, alpha: 1)]
    ]
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
