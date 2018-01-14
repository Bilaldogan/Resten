//
//  AddAddressController.swift
//  Resten Glow
//
//  Created by bilal on 21/11/2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit

class AddAddressController: BaseController {
    @IBOutlet weak var customNavigation: CustomNavigationView!

    @IBOutlet weak var textFiedlAddressTittle: CustomTextField!
    @IBOutlet weak var districtView: CustomView!
    @IBOutlet weak var lblDistrict: UILabel!
    @IBOutlet weak var lblAdressDetail: CustomTextView!
    
    var addAddressService = AddAddressService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customNavigation.navDelegate = self
        addTappedTo()
    }
    @IBAction func saveAdressTapped(_ sender: Any) {
       textFieldRegexHelp()
        
    }
    func startAddAddressService () {
        self.addAddressService.serviceDelegate = self
        var sendModel = AddAddressSendModel()
        sendModel.Title = textFiedlAddressTittle.text!
        sendModel.Description = lblAdressDetail.text! + lblDistrict.text!
        sendModel.MemberId = UserPrefence.getUserId()
        self.addAddressService.connectService(model: sendModel)
        self.SHOW_SIC()
    }
    func addTappedTo() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(districtViewTapped))
        self.districtView.isUserInteractionEnabled = true
        self.districtView.addGestureRecognizer(tapGesture)
        lblAdressDetail.placeholder = "Mahalle, sokak, cadde ve diğer bilgileri giriniz."
    }
    
    func districtViewTapped() {
        self.addDistrictVC()
    }
}

extension AddAddressController : AddAddressDelegate {
    func getError(errorMessage: String) {
        self.HIDE_SIC(customView: self.view)
    }
    func getResponse(response: AddAddressResponse) {
        self.HIDE_SIC(customView: self.view)
        self.back()
        //Buraya delegaye ekleyerek bir önceki sayfada tableview reload edilecek.
    }
}

extension AddAddressController : CustomNavigationViewDelegate {
    func backButtonTapped() {
        self.back()
    }
}
extension AddAddressController{
    internal func textFieldRegexHelp() {
        
        if  lblDistrict.text! == "" ||
            lblAdressDetail.text! == ""  ||
            textFiedlAddressTittle.text! == "" {
            self.view.makeToast("Lütfen tüm boş alanları doldurunuz.")
            //Popup çağır
        }
        else{
            self.startAddAddressService()
            //doğru yoldasın
        }
    }
    
}
extension AddAddressController : DistrictListDelegate {
    func districtSelected(selectedDistrict: String) {
        self.lblDistrict.text = selectedDistrict
    }
    func addDistrictVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller: DistrictListController = storyboard.instantiateViewController(withIdentifier: "districtControllerID") as! DistrictListController
        //add as a childviewcontroller
        addChildViewController(controller)
        // Add the child's View as a subview
        self.view.addSubview(controller.view)
        controller.view.frame = CGRect(x: self.view.bounds.minX + 20 , y: self.view.bounds.minY + 40 , width: self.view.bounds.width - 40 , height: self.view.bounds.height - 60 )
        controller.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // tell the childviewcontroller it's contained in it's parent
        controller.didMove(toParentViewController: self)
        controller.delegate = self
    }
}
