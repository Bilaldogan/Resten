//
//  CollapsibleTableViewHeader.swift
//  CollapsibleTableSectionViewController
//
//  Created by Yong Su on 7/20/17.
//  Copyright © 2017 jeantimex. All rights reserved.
//

import UIKit

protocol CollapsibleTableViewHeaderDelegate {
    func toggleSection(_ section: Int)
}

open class CollapsibleTableViewHeader: UITableViewHeaderFooterView {
    
    var delegate: CollapsibleTableViewHeaderDelegate?
    var section: Int = 0
    
    let titleLabel = UILabel()
    let seperatorView = UIView()
    override public init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        // Content View
        contentView.backgroundColor = UIColor.white
        
        // Title label
        contentView.addSubview(titleLabel)
        //titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.textColor = UIColor(red: 34.0 / 255.0 , green: 34.0 / 255.0, blue: 34.0 / 255.0, alpha: 1.0)
        titleLabel.font = UIFont(name: "JosefinSans-Regular", size: 16.0)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = NSLayoutConstraint(item: titleLabel, attribute: NSLayoutAttribute.top, relatedBy: .equal,
                                               toItem: self.contentView, attribute: NSLayoutAttribute.top,
                                               multiplier: 1.0, constant: 35.0)
        let leadingConstraint = NSLayoutConstraint(item: titleLabel, attribute: NSLayoutAttribute.leading, relatedBy: .equal,
                                               toItem: self.contentView, attribute: NSLayoutAttribute.leading,
                                               multiplier: 1.0, constant: 25.0)
        let trailingConstraint = NSLayoutConstraint(item: titleLabel, attribute:  NSLayoutAttribute.trailing , relatedBy: .equal,
                                               toItem: self.contentView, attribute: NSLayoutAttribute.trailing ,
                                               multiplier: 1.0, constant: -25.0)
        let bottomConstraint = NSLayoutConstraint(item: titleLabel, attribute: NSLayoutAttribute.bottom, relatedBy: .equal,
                                               toItem: self.contentView, attribute: NSLayoutAttribute.bottom,
                                               multiplier: 1.0, constant: -35.0)
        
        self.contentView.addConstraints([topConstraint, leadingConstraint, trailingConstraint, bottomConstraint])
        titleLabel.numberOfLines = 0
        
        
        contentView.addSubview(seperatorView)
        seperatorView.backgroundColor = UIColor(hex: 000000, alpha: 0.7)
        seperatorView.translatesAutoresizingMaskIntoConstraints = false
        let topViewtopConstraint = NSLayoutConstraint(item: seperatorView, attribute: NSLayoutAttribute.top, relatedBy: .equal,
                                               toItem: self.contentView, attribute: NSLayoutAttribute.top,
                                               multiplier: 1.0, constant: 0.0)
        let topViewleadingConstraint = NSLayoutConstraint(item: seperatorView, attribute: NSLayoutAttribute.leading, relatedBy: .equal,
                                                   toItem: self.contentView, attribute: NSLayoutAttribute.leading,
                                                   multiplier: 1.0, constant: 25.0)
        let topViewtrailingConstraint = NSLayoutConstraint(item: seperatorView, attribute:  NSLayoutAttribute.trailing , relatedBy: .equal,
                                                    toItem: self.contentView, attribute: NSLayoutAttribute.trailing ,
                                                    multiplier: 1.0, constant: -25.0)
        let topViewbottomConstraint = NSLayoutConstraint(item: seperatorView, attribute: NSLayoutAttribute.height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 1.0)
        
        self.contentView.addConstraints([topViewtopConstraint, topViewleadingConstraint, topViewtrailingConstraint, topViewbottomConstraint])
        
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CollapsibleTableViewHeader.tapHeader(_:))))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func tapHeader(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let cell = gestureRecognizer.view as? CollapsibleTableViewHeader else {
            return
        }
        
        _ = delegate?.toggleSection(cell.section)
    }
    
    
}

extension UIColor {
    
    convenience init(hex:Int, alpha:CGFloat = 1.0) {
        self.init(
            red:   CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8)  / 255.0,
            blue:  CGFloat((hex & 0x0000FF) >> 0)  / 255.0,
            alpha: alpha
        )
    }
    
}

extension UIView {
    
    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
        self.layer.add(animation, forKey: nil)
    }
    
}


