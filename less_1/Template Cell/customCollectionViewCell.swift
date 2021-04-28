//
//  customCollectionViewCell.swift
//  less_1
//
//  Created by Артем Шакиров on 12.04.2021.
//

import UIKit

class customCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var collectImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var countLikesLabel: UILabel!
    
    var isLiked = false
    
    func clearCell(){
        collectImage.image = nil
        setLikeButtons()
    }
    
    func setLikeButtons() {
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.tintColor = .systemGray
        countLikesLabel.text = "7"
        countLikesLabel.textColor = .systemGray
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clearCell()
    }
    
    override func prepareForReuse() {
        clearCell()
    }
    
    @IBAction func likeButtonTap(_ sender: Any) {
        if !isLiked {
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            likeButton.tintColor = .systemRed
            let addLike = Int(countLikesLabel.text!)! + 1
            countLikesLabel.text = String(addLike)
            countLikesLabel.textColor = .systemRed
        } else {
            setLikeButtons()
        }
        isLiked = !isLiked
    }
    
    func configure(image: UIImage) {
        collectImage.image = image
        
    }

}
