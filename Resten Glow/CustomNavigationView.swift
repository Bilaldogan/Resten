//
//  CustomNavigationView.swift
//  Resten Glow
//
//  Created by bilal on 01/11/2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit
@objc protocol CustomNavigationViewDelegate :class {
    func backButtonTapped()
}

@IBDesignable class CustomNavigationView: UIView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak   var navDelegate: NSObject?
    var delegate: CustomNavigationViewDelegate? { return navDelegate as? CustomNavigationViewDelegate }

    @IBInspectable var title: String? {
        get {
            return titleLabel.text
        }
        set {
            titleLabel.text = newValue
        }
    }
    
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
        
        
        //let colours:Array = [startColor.cgColor, endColor.cgColor]
        let colours:Array = [ColorUtil.lightYellow,ColorUtil.highLightYellow,ColorUtil.lightPurple,ColorUtil.highlightPurple]
        
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
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        delegate?.backButtonTapped()
    }
    func xibSetup() {
        contentView = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        contentView.frame = bounds
        
        // Make the view stretch with containing view
        contentView.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(contentView)
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CustomNavigationView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
}
