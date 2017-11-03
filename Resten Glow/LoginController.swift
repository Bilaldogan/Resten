//
//  LoginController.swift
//  Resten Glow
//
//  Created by bilal on 27/10/2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit

class LoginController: BaseController {

    @IBOutlet weak var textFieldEmail: CustomTextField!
    @IBOutlet weak var textFieldPassword: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillDisappear(_ animated: Bool) {
        if (navigationController?.topViewController != self) {
            navigationController?.navigationBar.isHidden = false
            navigationController?.navigationBar.tintColor = ColorUtil.textGray
            
            let backItem = UIBarButtonItem()
            backItem.title = ""
            navigationItem.backBarButtonItem = backItem
        }
        super.viewWillDisappear(animated)
    }
    @IBAction func loginButtonTApped(_ sender: UIButton) {
        textFieldRegexHelp()
    }
}
extension LoginController {
    internal func textFieldRegexHelp() {
        
            if  textFieldEmail.text! == "" || textFieldPassword.text! == "" {
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
