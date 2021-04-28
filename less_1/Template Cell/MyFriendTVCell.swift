//
//  MyFriendTVCell.swift
//  less_1
//
//  Created by Артем Шакиров on 19.04.2021.
//

import UIKit

class MyFriendTVCell: UITableViewCell {
    
    static let id = "MyFriendTVCell"
    
    private let friendAvatar: UIImageView = {
        let avatar = UIImageView()
        avatar.contentMode = .scaleAspectFill
        avatar.clipsToBounds = true
        return avatar
    }()
    
     let avatarShadow: UIView = {
        let shadow = UIView()
        shadow.layer.shadowOffset = CGSize(width: 0, height: 0)
        shadow.layer.shadowOpacity = 0.4
        shadow.layer.shadowRadius = 3
        shadow.backgroundColor = .white
        return shadow
    }()
    
    private let friendNameLabel: UILabel = {
        let name = UILabel()
        return name
    }()
    
    private let friendAgeLabel: UILabel = {
        let age = UILabel()
        age.textColor = .systemGray
        age.font = UIFont.systemFont(ofSize: 15)
        return age
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(avatarShadow)
        avatarShadow.addSubview(friendAvatar)
        contentView.addSubview(friendNameLabel)
        contentView.addSubview(friendAgeLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(name: String, age: String, avatar: UIImage?){
        friendAvatar.image = avatar
        friendNameLabel.text = name
        friendAgeLabel.text = age
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        friendAvatar.image = nil
        friendNameLabel.text = nil
        friendAgeLabel.text = nil
    }
    
    
    override func layoutSubviews(){
        super.layoutSubviews()
        
        let cellHeight = contentView.frame.size.height
        let imageHeight = CGFloat(50)
        let height = (cellHeight - imageHeight)
        friendAvatar.frame = CGRect(x: 0, y: 0, width: imageHeight, height: imageHeight)
        friendAvatar.layer.cornerRadius = imageHeight / 2
        
        avatarShadow.frame = CGRect(x: 5, y: height / 2, width: imageHeight, height: imageHeight)
        avatarShadow.layer.cornerRadius = imageHeight / 2
        
        friendNameLabel.frame = CGRect(x: imageHeight + 15, y: 5, width: 100, height: 20)
        friendAgeLabel.frame = CGRect(x: imageHeight + 15, y: 25, width: 200, height: 20)
        
    }
}
