//
//  NewsCVCell.swift
//  less_1
//
//  Created by Артем Шакиров on 23.04.2021.
//

import UIKit


class NewsCVCell: UICollectionViewCell {
    
    
    static let id = "NewsCVCell"
    var isLiked = false
    var isComment = false
    var likeButtonSize: CGFloat = 18
    var commentButtonSize: CGFloat = 15
    
    private let newsPhoto: UIImageView = {
        let photo = UIImageView()
        photo.contentMode = .scaleAspectFill
        photo.clipsToBounds = true
        return photo
    }()
    
    private let newsTitle: UILabel = {
        let title = UILabel()
        return title
    }()
    
    private let newsText: UILabel = {
        let text = UILabel()
        text.numberOfLines = 3
        return text
    }()
    
    private let likeButton: UIButton = {
        let btn = UIButton()
        
        return btn
    }()
    
    private let likeCount: UILabel = {
        let count = UILabel()
        count.numberOfLines = 1
        count.text = "0"
        return count
    }()
    
    private let addComment: UIButton = {
        let comment = UIButton()
        return comment
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(newsTitle)
        contentView.addSubview(newsPhoto)
        contentView.addSubview(newsText)
        contentView.addSubview(likeButton)
        contentView.addSubview(likeCount)
        contentView.addSubview(addComment)
        
        setButton(btn: likeButton, name: "heart", size: likeButtonSize, color: .systemGray)
        setButton(btn: addComment, name: "bubble.left", size: commentButtonSize, color: .systemGray)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setButton(btn: UIButton, name: String, size: CGFloat, color: UIColor) {
        let config = UIImage.SymbolConfiguration(pointSize: size, weight: .thin)
        let image = UIImage(systemName: name, withConfiguration: config)
        btn.setImage(image, for: .normal)
        btn.tintColor = color
    }
    
    public func configure(_ image: UIImage?, title: String, text: String){
        newsPhoto.image = image
        newsText.text = text
        newsTitle.text = title
    }
    

    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        newsPhoto.image = nil
        newsText.text = nil
        newsTitle.text = nil
    }
        
    
    override func layoutSubviews(){
        super.layoutSubviews()
        
        let imageSize = contentView.frame.size.width
        let vertical: CGFloat = 10
        
        newsTitle.frame = CGRect(x: 5, y: vertical, width: imageSize - 10, height: 20)
        newsTitle.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        
        
        newsText.frame = CGRect(x: 5, y: vertical + 20, width: imageSize - 10, height: 65)
        newsText.font = UIFont.systemFont(ofSize: 14)
        
        
        
        newsPhoto.frame = CGRect(x: 0,
                                 y: vertical + newsTitle.frame.height + newsText.frame.height,
                                 width: imageSize,
                                 height: imageSize - (vertical + newsTitle.frame.height + newsText.frame.height + 25))
        
        
        likeButton.frame = CGRect(x: 5,
                                  y: vertical + newsTitle.frame.height + newsText.frame.height + newsPhoto.frame.height,
                                  width: 25,
                                  height: 25)
        
        likeCount.frame = CGRect(x: 5 + likeButton.frame.width,
                                  y: vertical + newsTitle.frame.height + newsText.frame.height + newsPhoto.frame.height,
                                  width: 25,
                                  height: 25)
        
        addComment.frame = CGRect(x: 5 + likeButton.frame.width + likeCount.frame.width,
                                  y: vertical + newsTitle.frame.height + newsText.frame.height + newsPhoto.frame.height,
                                  width: 25,
                                  height: 25)
        
        likeCount.textColor = .systemGray
        
        likeButton.addTarget(self, action: #selector(tapLikeButton), for: .touchUpInside)
        addComment.addTarget(self, action: #selector(tapAddComment), for: .touchUpInside)
        
    }
    
    
    @objc func tapLikeButton() {
        
        if !isLiked {
            setButton(btn: likeButton, name: "heart.fill", size: likeButtonSize, color: .systemRed)
            likeCount.text = "1"
            likeCount.textColor = .systemRed
        } else {
            setButton(btn: likeButton, name: "heart", size: likeButtonSize, color: .systemGray)
            likeCount.text = "0"
            likeCount.textColor = .systemGray
        }

        isLiked = !isLiked
    }
    
    @objc func tapAddComment() {
        if !isComment {
            setButton(btn: addComment, name: "bubble.left.fill", size: commentButtonSize, color: .black)
        } else {
            setButton(btn: addComment, name: "bubble.left", size: commentButtonSize, color: .systemGray)
        }
        isComment = !isComment
    }
}

