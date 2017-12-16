//
//  BagProductCell.swift
//  Resten Glow
//
//  Created by Baran on 16.12.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit

class BagProductCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
}
