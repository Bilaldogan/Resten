//
//  OderHeaderView.swift
//  Resten Glow
//
//  Created by bilal on 19/12/2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit


@IBDesignable class OderHeaderView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    
    @IBOutlet weak var appointmentDate: UILabel!
    @IBOutlet weak var lblTotalPrice: UILabel!
    @IBOutlet weak var lblOrderCode: UILabel!
    
    var delegate: CollapsibleTableViewHeaderDelegate?
    var section: Int = 0
    
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
    
    func tapHeader(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let cell = gestureRecognizer.view as? OderHeaderView else {
            return
        }
        
        _ = delegate?.toggleSection(cell.section)
    }
    func configure(with data : SectionOrder) {
        self.lblOrderCode.text = data.productCode
        self.lblTotalPrice.text = data.totalPrice
        self.appointmentDate.text = data.orderDate
    }
    func xibSetup() {
        contentView = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        contentView.frame = bounds
        
        // Make the view stretch with containing view
        contentView.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(contentView)
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(OderHeaderView.tapHeader(_:))))
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "OrderHeaderView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
}
