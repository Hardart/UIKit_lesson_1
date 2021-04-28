//
//  TestButton.swift
//  less_1
//
//  Created by Артем Шакиров on 25.04.2021.
//

import UIKit





final class testButton: UIButton {
    

    let buttonIcon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    let buttonLabel: UILabel = {
        let text = UILabel()
        text.numberOfLines = 1
        text.textAlignment = .left
        text.font = .systemFont(ofSize: 16)
        return text
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(buttonIcon)
        addSubview(buttonLabel)
        clipsToBounds = true
        layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func layoutSubviews() {
        super.layoutSubviews()
        buttonLabel.sizeToFit()
        let iconSize: CGFloat = 20
        let iconX: CGFloat = 10
        buttonIcon.frame = CGRect(x: iconX,
                                  y: (frame.size.height - iconSize) / 2,
                                  width: iconSize,
                                  height: iconSize)
        buttonLabel.frame = CGRect(x: iconSize + iconX + 5,
                                   y: 0,
                                   width: buttonLabel.frame.size.width,
                                   height: frame.size.height)
        
        
        
    }
    
    
    
}
