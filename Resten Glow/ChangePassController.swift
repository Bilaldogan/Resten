//
//  ChangePassController.swift
//  Resten Glow
//
//  Created by bilal on 01/11/2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit

class ChangePassController: UIViewController {

    @IBOutlet weak var navigationView: CustomNavigationView!
    @IBOutlet weak var textFieldNewPass: CustomTextField!
    @IBOutlet weak var textFieldOldPass: CustomTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

   
    @IBAction func changePassTapped(_ sender: UIButton) {
    }
   

    
}
extension ChangePassController : CustomNavigationViewDelegate {
    func backButtonTapped() {
        print("backTapped")
        //back Action
    }
    
}
