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
    @IBOutlet weak var textFieldConfirmPassword: CustomTextField!
    @IBOutlet weak var textFieldName: CustomTextField!
    @IBOutlet weak var textFieldSurname: CustomTextField!
    @IBOutlet weak var textFieldPhoneNumber: CustomTextField!
    
    var shouldAttemptFormat: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        self.textFieldPhoneNumber.addTarget(self, action: #selector(self.formatPhoneNumber(_:)), for: .editingChanged)
        // Do any additional setup after loading the view.
    }

    @IBAction func registerButtonTapped(_ sender: UIButton) {
        textFieldRegexHelp()
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
            self.view.makeToast("Lütfen geçerli bir email adresi giriniz.")
            //Popup çağır
        }
        else if self.textFieldPassword.text != self.textFieldConfirmPassword.text {
            self.view.makeToast("Girdiğiniz şifreler aynı olmalı")
        }
        else if RegexClass.validatePhone(value: self.textFieldPhoneNumber.text!) == false {
            self.view.makeToast("Lütfen geçerli bir telefon numarası giriniz")
        }
        else{
            //doğru yoldasın
        }
    }

}
extension RegisterController : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == self.textFieldPhoneNumber{
            let nsString = textField.text as NSString?
            let resultString: String = nsString!.replacingCharacters(in: range, with:string)
            let oldString: String = self.textFieldPhoneNumber.text!
            let oldCount = oldString.characters.count
            let newCount = resultString.characters.count
            shouldAttemptFormat = newCount > oldCount
            return true//newCount < 15
        }else{
            return true
        }
    }
    
}
