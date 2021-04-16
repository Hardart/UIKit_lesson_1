//
//  customCollectionViewController.swift
//  less_1
//
//  Created by Артем Шакиров on 12.04.2021.
//

import UIKit

class customCollectionViewController: UIViewController {

    
    @IBOutlet weak var customCollectView: UICollectionView!
    
    let collectCell = "customCollectionCell"
    var titleCell = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customCollectView.register(UINib(nibName: "customCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: collectCell)
        customCollectView.dataSource = self
        customCollectView.delegate = self
        
    }
 

}

extension customCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate  {
    

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectCell, for: indexPath) as? customCollectionViewCell else {return UICollectionViewCell()}
        
        cell.configure(title:  titleCell + String(indexPath.item + 1))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
    
    
}


extension customCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 130)
    }
}
