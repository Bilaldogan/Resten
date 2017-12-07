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
    var loginService = LoginService()
    
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
    func startLoginService(){
        self.loginService.serviceDelegate = self
        var sendModel = LoginSendModel()
        sendModel.email = textFieldEmail.text!
        sendModel.pass = textFieldPassword.text!
        self.loginService.connectService(model: sendModel)
        self.SHOW_SIC()
    }
    
    @IBAction func loginButtonTApped(_ sender: UIButton) {
        self.goto(screenID: ScrennID.ROOT_CONTROLLER_ID.rawValue)
        textFieldRegexHelp()
    }
    
    
}
extension LoginController {
    internal func textFieldRegexHelp() {
            if  textFieldEmail.text! == "" || textFieldPassword.text! == "" {
                self.view.makeToast("Lütfen tüm boş alanları doldurunuz.")
            }
            else if RegexClass.isValidEmail(testStr: self.textFieldEmail.text!) == false {
                self.view.makeToast("Lütfen doğru bir email adresi giriniz.")
            }
            else{
                self.startLoginService()
            }
    }
}

//Service Extension..

extension LoginController : LoginDelegate {
    func getError(errorMessage: String) {
        print(errorMessage)
        self.HIDE_SIC(customView: self.view)
    }
    func getResponse(response: LoginResponseModel) {
        print(response)
        self.HIDE_SIC(customView: self.view)
        if response.Error == "true" {
            self.view.makeToast(response.Message)
        }
        else{
            UserPrefence.setUserId(id: response.Id)
            UserPrefence.setGSM(id: response.Gsm)
            UserPrefence.setUserName(id: response.Name)
            UserPrefence.setUserMail(mail: response.Email)
            UserPrefence.setUserLoginStatus(isLogin: true)
            self.goto(screenID: ScrennID.ROOT_CONTROLLER_ID.rawValue)
        }
    }
}

