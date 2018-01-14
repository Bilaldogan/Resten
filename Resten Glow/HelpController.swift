//
//  HelpController.swift
//  Resten Glow
//
//  Created by bilal on 26/11/2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit

class HelpController: BaseController {

    @IBOutlet weak var customNavigaiton: CustomNavigationView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customNavigaiton.addShadow()
        self.customNavigaiton.bottomView.isHidden = true
        self.customNavigaiton.navDelegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func instaTapped(_ sender: UIButton) {
    }
    @IBAction func twitterTapped(_ sender: UIButton) {
    }
    @IBAction func faceTapped(_ sender: UIButton) {
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if let title = sender.currentTitle {
            switch title {
            case "REZERVASYON":
                category = .rezervation
            case "ÖDEME":
                category = .payment
            case "ÜRÜNLER":
                category = .products
            case "HİZMETLER":
                category = .services
            default:break
            }
            self.goto(screenID: "detailHelpControllerID", data: title as AnyObject)
        }
    }
 
    @IBAction func contactButtonTapped(_ sender: UIButton) {
        self.goto(screenID: "ContactAsPopUpContollerID", animated: false, data: true as? AnyObject, isModal: true)
    }
    

}
extension HelpController : CustomNavigationViewDelegate {
    internal func backButtonTapped() {
        self.back()
    }
}
