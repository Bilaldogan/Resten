//
//  InspritationCell.swift
//  Resten Glow
//
//  Created by Baran on 3.11.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit

class InspritationCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var insImageView: UIImageView!
    
}
