//
//  MenuCustomCell.swift
//  Resten Glow
//
//  Created by Baran on 2.11.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit

class MenuCustomCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        self.selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    @IBOutlet weak var customImageView: UIImageView!
    @IBOutlet weak var customLabel: UILabel!
    
    
}
