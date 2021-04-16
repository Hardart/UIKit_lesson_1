//
//  cusomTableViewCell.swift
//  less_1
//
//  Created by Артем Шакиров on 12.04.2021.
//

import UIKit

class cusomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
        
    
    func clearCell(){
        titleLabel.text = nil
        descLabel.text = nil
        myImageView.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clearCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        clearCell()
    }
    
    func configure(title: String?, description: String?, image: UIImage?) {
        titleLabel.text = title
        descLabel.text = description
        myImageView.image = image
    }
}
