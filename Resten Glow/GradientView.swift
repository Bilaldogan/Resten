//
//  GradientView.swift
//  Resten Glow
//
//  Created by Baran on 2.11.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var startColor: UIColor = UIColor.white {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var endColor: UIColor = UIColor.black {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var isHorizontal: Bool = false {
        didSet{
            setupView()
        }
    }
    
    private func setupView(){

        let colours:Array = [startColor.cgColor, endColor.cgColor]
        guard let gradientLayer = self.layer as? CAGradientLayer else {
            return;
        }
        
        gradientLayer.colors = colours.map { $0 }
        
        
        if (isHorizontal){
            gradientLayer.endPoint = CGPoint(x: 0.9, y: 0.4)
        }else{
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        }

     
        
        
        self.setNeedsDisplay()

    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
}


