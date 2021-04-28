//
//  NewsVC.swift
//  less_1
//
//  Created by Артем Шакиров on 23.04.2021.
//

import UIKit

class NewsVC: UIViewController {
    
    let users = DataStorage.shared.users

    let newsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.register(NewsCVCell.self, forCellWithReuseIdentifier: NewsCVCell.id)
        return cv
    }()
    
    let searchController: UISearchController = {
        let searchField = UISearchController()
        return searchField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = searchController
        newsCollectionView.delegate = self
        newsCollectionView.dataSource = self
        view.addSubview(newsCollectionView)
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        newsCollectionView.frame = view.bounds
    }

    

}


extension NewsVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = newsCollectionView.dequeueReusableCell(withReuseIdentifier: NewsCVCell.id, for: indexPath) as! NewsCVCell
        cell.configure(users[indexPath.item].avatar, title: "Новость дня", text: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
        
        
        return cell
    }

    
    
}

extension NewsVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = view.frame.width
        return CGSize(width: size, height: size)
    }
}



