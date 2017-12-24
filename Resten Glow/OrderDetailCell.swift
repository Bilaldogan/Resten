//
//  OrderDetailCell.swift
//  Resten Glow
//
//  Created by bilal on 19/12/2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit

class OrderDetailCell: UITableViewCell {

    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblOperationTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureWith(data: ItemOrder) {
        lblPrice.text = data.price
        lblCategory.text = data.category
        lblDescription.text = data.operationTime
        lblProductName.text = data.productName
        lblOperationTime.text = data.operationTime
        self.layoutIfNeeded()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
