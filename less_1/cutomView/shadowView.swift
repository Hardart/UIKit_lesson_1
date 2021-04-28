//
//  shadowView.swift
//  less_1
//
//  Created by Артем Шакиров on 20.04.2021.
//

import UIKit

@IBDesignable class shadowView: UIView {

    @IBInspectable var color: UIColor = UIColor.black {
        didSet {
            self.updateColor()
        }
    }
    @IBInspectable var radius: CGFloat = 1 {
        didSet {
            self.updateRadius()
            
        }
    }
    @IBInspectable var offset: CGSize = CGSize(width: 2, height: 2) {
        didSet {
            self.updateOffset()
        }
    }
    
    @IBInspectable var opacity: Float = 1 {
        didSet {
            self.updateOpacity()
            
        }
    }
    
    
    func updateColor(){
        self.layer.shadowColor = color.cgColor
    }
    
    func updateRadius(){
        self.layer.shadowRadius = radius
    }
    
    func updateOffset(){
        self.layer.shadowOffset = offset
    }
    
    func updateOpacity(){
        self.layer.shadowOpacity = opacity
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
