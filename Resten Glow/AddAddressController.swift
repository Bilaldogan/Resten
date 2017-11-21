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

    @IBOutlet weak var districtView: CustomView!
    @IBOutlet weak var lblDistrict: UILabel!
    @IBOutlet weak var lblAdressDetail: CustomTextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customNavigation.navDelegate = self
        addTappedTo()
    }
    @IBAction func saveAdressTapped(_ sender: Any) {
        self.back()
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
extension AddAddressController : CustomNavigationViewDelegate {
    func backButtonTapped() {
        self.back()
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
        controller.view.frame = CGRect(x: self.view.bounds.minX + 30 , y: self.view.bounds.minY + 60 , width: self.view.bounds.width - 60 , height: self.view.bounds.height - 100 )
        controller.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // tell the childviewcontroller it's contained in it's parent
        controller.didMove(toParentViewController: self)
        controller.delegate = self
    }
}
