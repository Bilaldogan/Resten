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
        

        // configure nameLabel
        contentView.addSubview(nameLabel)
        nameLabel.font = UIFont(name: "JosefinSans-Regular", size: 13.0)
        nameLabel.textColor = UIColor(red: 34.0/255.0, green: 34.0/255.0, blue: 34.0/255.0, alpha: 0.6)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = NSLayoutConstraint(item: nameLabel, attribute: NSLayoutAttribute.top, relatedBy: .equal,
                                               toItem: self.contentView, attribute: NSLayoutAttribute.top,
                                               multiplier: 1.0, constant: 2.0)
        let leadingConstraint = NSLayoutConstraint(item: nameLabel, attribute: NSLayoutAttribute.leading, relatedBy: .equal,
                                                   toItem: self.contentView, attribute: NSLayoutAttribute.leading,
                                                   multiplier: 1.0, constant: 25.0)
        let trailingConstraint = NSLayoutConstraint(item: nameLabel, attribute:  NSLayoutAttribute.trailing , relatedBy: .equal,
                                                    toItem: self.contentView, attribute: NSLayoutAttribute.trailing ,
                                                    multiplier: 1.0, constant: -25.0)
        let bottomConstraint = NSLayoutConstraint(item: nameLabel, attribute: NSLayoutAttribute.bottom, relatedBy: .equal,
                                                  toItem: self.contentView, attribute: NSLayoutAttribute.bottom,
                                                  multiplier: 1.0, constant: -10.0)
        
        self.contentView.addConstraints([topConstraint, leadingConstraint, trailingConstraint, bottomConstraint])
        nameLabel.numberOfLines = 0
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
