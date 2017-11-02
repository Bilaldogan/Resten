//
//  CustomButton.swift
//  App To Rich
//
//  Created by bilal on 30/09/17.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var imageColor: UIColor = UIColor.white {
        didSet {
            let buttonImage = self.image(for: .normal)
            self.setImage(buttonImage?.withRenderingMode(.alwaysTemplate), for: .normal)
            self.tintColor = imageColor
        }
    }
    
        
    
    
}
