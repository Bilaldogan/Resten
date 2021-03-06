//
//  ForgotPasswordController.swift
//  Resten Glow
//
//  Created by bilal on 27/10/2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit

class ForgotPasswordController: BaseController {

    @IBOutlet weak var textFieldEmail: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
    textFieldRegexHelp()
    }


}
extension ForgotPasswordController {
    internal func textFieldRegexHelp() {
        
        if  textFieldEmail.text! == "" {
            self.view.makeToast("Lütfen tüm boş alanları doldurunuz.")
            //Popup çağır
        }
        else if RegexClass.isValidEmail(testStr: self.textFieldEmail.text!) == false {
            self.view.makeToast("Lütfen doğru bir email adresi giriniz.")
            //Popup çağır
        }
        else{
            //doğru yoldasın
        }
    }

}
