//
//  TestVC.swift
//  less_1
//
//  Created by Артем Шакиров on 22.04.2021.
//

import UIKit

class TestVC: UIViewController {
    
    let isLiked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let width = view.frame.size.width
        
        
        let iconButton = testButton(frame: CGRect(x: (width - 300) / 2, y: 200, width: 120, height: 50))
        view.addSubview(iconButton)
//        iconButton.configure(with: btnWithIcon(icon: UIImage(systemName: "heart") , text: "1000"))
        iconButton.backgroundColor = .cyan
        iconButton.addTarget(self, action: #selector(tapLikeButton), for: .touchUpInside)
    }
    
    @objc func tapLikeButton(sender: UIButton) {
//        if !isLiked {
//
//
//            let addLike = Int()! + 1
//        } else {
//
//        }
//        isLiked = !isLiked
//    }
        
        print()
    }
}

