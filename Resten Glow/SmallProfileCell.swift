//
//  SmallProfileCell.swift
//  Resten Glow
//
//  Created by bilal on 03/11/2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit
protocol SmallProfileCellDelegate {
    func editTapped()
}
class SmallProfileCell: UITableViewCell {

    var delegate  : SmallProfileCellDelegate?
    
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserMail: UILabel!
    
    @IBOutlet weak var lblPhoneNumber: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // Initialization code
    }
    @IBAction func editButtonTapped(sender: AnyObject) {
        delegate?.editTapped()
    }

    
    
}
