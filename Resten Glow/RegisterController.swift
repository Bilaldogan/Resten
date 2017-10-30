//
//  RegisterController.swift
//  Resten Glow
//
//  Created by bilal on 30/10/2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit

class RegisterController: BaseController {

    @IBOutlet weak var textFieldEmail: CustomTextField!
    @IBOutlet weak var textFieldPassword: CustomTextField!
    @IBOutlet weak var textFieldName: CustomTextField!
    @IBOutlet weak var textFieldSurname: CustomTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }



}
extension RegisterController{
    internal func textFieldRegexHelp() {
        
        if  textFieldEmail.text! == "" ||
            textFieldPassword.text! == "" ||
            textFieldName.text! == "" ||
            textFieldSurname.text! == "" {
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
