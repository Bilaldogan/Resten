//
//  PagerViewCell.swift
//  Resten Glow
//
//  Created by bilal on 27/10/2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit
import FSPagerView
class PagerViewCell: FSPagerViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    
    var isgradLayerAdded = false
    override public func layoutSubviews() {
        super.layoutSubviews()
        addGradLayerToImageView()
    }
    func addGradLayerToImageView() {
        if !isgradLayerAdded {
            let colorTop = UIColor.clear.cgColor
            let colorBottom = UIColor.black.cgColor
            let gradient = CAGradientLayer()
            gradient.frame = self.contentView.frame
            gradient.colors = [ colorTop, colorBottom]
            gradient.locations = [ 0.0, 1.0]
            self.backImageView.layer.addSublayer(gradient)
            isgradLayerAdded = true
        }
    }

}
