//
//  customCollectionViewCell.swift
//  less_1
//
//  Created by Артем Шакиров on 12.04.2021.
//

import UIKit

class customCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var collectLabel: UILabel!
    @IBOutlet weak var collectImage: UIImageView!
    
    func clearCell(){
        collectLabel.text = nil
        collectImage.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        clearCell()
    }
    
    override func prepareForReuse() {
        clearCell()
    }
    
    func configure(title: String, image: UIImage) {
        collectLabel.text = title
        collectImage.image = image
    }

}
