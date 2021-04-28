//
//  TestTableCell.swift
//  less_1
//
//  Created by Артем Шакиров on 22.04.2021.
//

import UIKit

class TestTableCell: UITableViewCell {
    
    static let id = "TestTableCell"
    
    var countryLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    var cityLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont.systemFont(ofSize: 16)
        name.textAlignment = .left
        return name
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(countryLabel)
        addSubview(cityLabel)
        
        
        countryLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        countryLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        countryLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        countryLabel.rightAnchor.constraint(equalTo: cityLabel.leftAnchor).isActive = true
        
        
        cityLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cityLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        cityLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        cityLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()

        countryLabel.text = nil
        cityLabel.text = nil
    }
    

    
}
