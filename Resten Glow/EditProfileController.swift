//
//  EditProfileController.swift
//  Resten Glow
//
//  Created by bilal on 03/11/2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit

class EditProfileController: BaseController {

    @IBOutlet weak var customNavigation: CustomNavigationView!
    @IBOutlet weak var textFieldName: CustomTextField!
    @IBOutlet weak var textFieldSurname: CustomTextField!
    @IBOutlet weak var textFieldPhoneNumber: CustomTextField!
    @IBOutlet weak var textFielfEmail: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customNavigation.navDelegate = self
        // Do any additional setup after loading the view.
    }


}
extension EditProfileController : CustomNavigationViewDelegate {
    func backButtonTapped() {
        self.back()
    }
}
