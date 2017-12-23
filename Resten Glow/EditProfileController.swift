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
    
    var updateService = UpdateProfileService()
    
    var shouldAttemptFormat: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        self.customNavigation.navDelegate = self
        
        self.textFieldName.text = UserPrefence.getUserName()
        self.textFieldSurname.text = UserPrefence.getUserSurname()
        self.textFielfEmail.text = UserPrefence.getUserMail()
        self.textFieldPhoneNumber.text = UserPrefence.getGSM()
        self.textFieldPhoneNumber.addTarget(self, action: #selector(self.formatPhoneNumber(_:)), for: .editingChanged)
    }
    
    @IBAction func updateProfileTapped(_ sender: UIButton) {
        textFieldRegexHelp()
    }
    
    func startUpdateProfileService() {
        self.updateService.serviceDelegate = self
        var sendModel = UpdateProfileSendModel()
        sendModel.Email = textFielfEmail.text!
        sendModel.Pass = ""
        sendModel.Name = textFieldName.text!
        sendModel.SurName = textFieldSurname.text!
        sendModel.Gsm = UserPrefence.getGSM()
        sendModel.MemberId = UserPrefence.getUserId()
        self.updateService.connectService(model: sendModel)
        self.SHOW_SIC()

    }

}
extension EditProfileController : RegisterDelegate {
    func getError(errorMessage: String) {
        print(errorMessage)
        self.HIDE_SIC(customView: self.view)
    }
    func getResponse(response: RegisterResponseModel) {
        print(response)
        self.HIDE_SIC(customView: self.view)
        if response.Error == "true" {
            self.view.makeToast(response.Message)
        }
        else{
            UserPrefence.setUserId(id: response.Id)
            UserPrefence.setGSM(id: response.Gsm)
            UserPrefence.setUserName(id: response.Name)
            UserPrefence.setUserSurname(surname: response.SurName)
            UserPrefence.setUserMail(mail: response.Email)
            UserPrefence.setUserLoginStatus(isLogin: true)
            self.goto(screenID: ScrennID.ROOT_CONTROLLER_ID.rawValue)
        }
    }
}
extension EditProfileController : CustomNavigationViewDelegate {
    func backButtonTapped() {
        self.back()
    }
}
extension EditProfileController {
    internal func textFieldRegexHelp() {
        
        if  textFielfEmail.text! == "" ||
            textFieldName.text! == "" ||
            textFieldSurname.text! == "" ||
            textFieldPhoneNumber.text! == "" {
            self.view.makeToast("Lütfen tüm boş alanları doldurunuz.")
            //Popup çağır
        } else if RegexClass.isValidEmail(testStr: self.textFielfEmail.text!) == false {
            self.view.makeToast("Lütfen geçerli bir email adresi giriniz.")
            //Popup çağır
        } else if RegexClass.validatePhone(value: self.textFieldPhoneNumber.text!) == false {
            self.view.makeToast("Lütfen geçerli bir telefon numarası giriniz.")

        } else{
            self.startUpdateProfileService()
            //doğru yoldasın
        }
    }
}
extension EditProfileController : UITextFieldDelegate {
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
