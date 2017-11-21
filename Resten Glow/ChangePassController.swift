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
    @IBOutlet weak var textFieldConfirmNewPassword: CustomTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationView.navDelegate = self
      
    }

   
    @IBAction func changePassTapped(_ sender: UIButton) {
        textFieldRegexHelp()
    }
   

    
}
extension ChangePassController : CustomNavigationViewDelegate {
    func backButtonTapped() {
        self.back()
    }
    
}
extension ChangePassController {
    internal func textFieldRegexHelp() {
        
        if  textFieldNewPass.text! == "" || textFieldOldPass.text! == "" || textFieldConfirmNewPassword.text! == "" {
            self.view.makeToast("Lütfen tüm boş alanları doldurunuz.")
            //Popup çağır
        }
        else if textFieldOldPass.text! !=  textFieldConfirmNewPassword.text!  {
            self.view.makeToast("Girdiğiniz şifreler aynı olmalı.")
            //Popup çağır
        }
        else{
            //doğru yoldasın
        }
    }
}
