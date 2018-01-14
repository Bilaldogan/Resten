//
//  AdressCell.swift
//  Resten Glow
//
//  Created by bilal on 03/11/2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit

class AdressCell: UITableViewCell {

    @IBOutlet weak var imageViewIcon: UIImageView!
    @IBOutlet weak var labelAddressType: UILabel!
    @IBOutlet weak var labelAddress: UILabel!
    
    var id = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // Initialization code
    }
    func configureWithItem(data: UserAddress, type : AddressCellType) {
        if type == AddressCellType.creditCard {
            imageViewIcon.image = #imageLiteral(resourceName: "credit-card-icon")
            labelAddress.text = "4543 **** **** ****"
            labelAddressType.text = "Kredi Kartı"
        } else {
            imageViewIcon.image = #imageLiteral(resourceName: "home-icon")
            labelAddressType.text = data.Title
            labelAddress.text = data.Description
            id = data.Id
        }
    }

    
}
enum AddressCellType {
    case creditCard
    case address
    case eft
}
