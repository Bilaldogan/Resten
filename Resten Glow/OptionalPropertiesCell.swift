//
//  OptionalPropertiesCell.swift
//  Resten Glow
//
//  Created by Baran on 2.11.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit

class OptionalPropertiesCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func aditionalCheckButton(_ sender: UISwitch) {
        if clickDelegate != nil {
            clickDelegate?.aditionalChecked(Checked: sender.isOn, Properties: additionalProduct)
        }
    }
    
    func configure(Product item: AdditionalProductList){
        priceAndTimeLabel.text = item.Price + "₺" + " ● " + item.OperationTime + " dk"
        productName.text = item.ProductName
        descLabel.text = item.Description
    }
    
    @IBOutlet weak var priceAndTimeLabel: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    var additionalProduct = AdditionalProductList()
    
    var clickDelegate : clickAdditionalProductDelegate?
}
