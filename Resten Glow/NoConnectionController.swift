//
//  NoConnectionController.swift
//  Resten Glow
//
//  Created by bilal on 08/12/2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit

class NoConnectionController: BaseController {

    @IBOutlet weak var customNavigation: CustomNavigationView!
    override func viewDidLoad() {
        self.isNoConnection = true
        super.viewDidLoad()
        self.customNavigation.navDelegate = self
    }

  
}
extension NoConnectionController : CustomNavigationViewDelegate {
    func backButtonTapped() {
        self.back()
    }
    
    
}
