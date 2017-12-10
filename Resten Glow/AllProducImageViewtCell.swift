//
//  AllProducImageViewtCell.swift
//  Resten Glow
//
//  Created by Baran on 22.11.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit

class AllProducImageViewtCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(imageURL: String){
        productImageView.loadImage(url: imageURL)
    }
    
    @IBOutlet weak var productImageView: UIImageView!
    
}
