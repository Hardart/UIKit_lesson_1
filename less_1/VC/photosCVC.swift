//
//  customCollectionViewController.swift
//  less_1
//
//  Created by Артем Шакиров on 12.04.2021.
//

import UIKit

class customCollectionViewController: UIViewController {

    
    @IBOutlet weak var customCollectView: UICollectionView!
    
    let collectCellID = "customCollectionCell"
    var photos = [UIImage]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        customCollectView.register(UINib(nibName: "customCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: collectCellID)
        customCollectView.dataSource = self
        customCollectView.delegate = self
        
    }
 
}

extension customCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectCellID, for: indexPath) as? customCollectionViewCell else {return UICollectionViewCell()}
        cell.configure(title:  "Photo \(indexPath.row + 1)", image: photos[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}


extension customCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 130)
    }
    
}
