//
//  LittleAddProductCell.swift
//  Resten Glow
//
//  Created by Baran on 24.12.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit

class LittleAddProductCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var productButton: CustomButton!
    
}
