//
//  ProductCell.swift
//  Resten Glow
//
//  Created by Baran on 1.11.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit
import Font_Awesome_Swift

class ProductCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        arrowImageView.setFAIconWithName(icon: .FAAngleRight, textColor: ColorUtil.textDarkGray)
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellConfigure(Product item : ProductList){
        titleLabel.text = item.ProductName
        DescLabel.text = item.Description
        priceLabel.text = item.Price
    }
    
    @IBOutlet weak var arrowImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var DescLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
}
