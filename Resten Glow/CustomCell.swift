//
//  CustomCell.swift
//  Examples
//
//  Created by Yong Su on 7/24/17.
//  Copyright © 2017 jeantimex. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    let nameLabel = UILabel()
    let seperatorView = UIView()
    // MARK: Initalizers
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let marginGuide = contentView.layoutMarginsGuide
        // configure nameLabel
        contentView.addSubview(nameLabel)
        nameLabel.font = UIFont(name: "JosefinSans-Regular", size: 15.0)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        nameLabel.numberOfLines = 0
        /*
         contentView.addSubview(seperatorView)
        seperatorView.backgroundColor = UIColor.black
        seperatorView.translatesAutoresizingMaskIntoConstraints = false
        seperatorView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0.0).isActive = true
        seperatorView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 10.0).isActive = true
        seperatorView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: -10.0).isActive = true
        seperatorView.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        */
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
