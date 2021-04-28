//
//  customCollectionViewController.swift
//  less_1
//
//  Created by Артем Шакиров on 12.04.2021.
//

import UIKit

class photosCVC: UIViewController {

    
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

extension photosCVC: UICollectionViewDataSource, UICollectionViewDelegate  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectCellID, for: indexPath) as? customCollectionViewCell else {return UICollectionViewCell()}
        cell.configure(image: photos[indexPath.item])
        return cell
    }
    

    
    
    
}


extension photosCVC: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (customCollectView.frame.width-4) / 3
       
        return CGSize(width: size, height: size)
    }
//    
}
