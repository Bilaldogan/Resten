//
//  ChoseAddressController.swift
//  Resten Glow
//
//  Created by bilal on 18/12/2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit

class ChoseAddressController: BaseController {

    @IBOutlet weak var customNavigation: CustomNavigationView!
    @IBOutlet weak var tableView: UITableView!
    
    var addressListService = AddressListService()
    var userAddressList : [UserAddress] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        customNavigation.navDelegate = self
        tableView.register(UINib(nibName: "AddInfoCell", bundle: nil), forCellReuseIdentifier: "addInfoCell")
        tableView.register(UINib(nibName: "AdressCell", bundle: nil), forCellReuseIdentifier: "addressCell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        self.customNavigation.navDelegate = self
        addressListService.serviceDelegate = self
        addressListService.connectService(memberID: UserPrefence.getUserId())    }

  

}
extension ChoseAddressController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         if indexPath.section == 0 {
            if indexPath.row < userAddressList.count {
                let cell = tableView.dequeueReusableCell(withIdentifier: "addressCell", for: indexPath) as! AdressCell
                cell.configureWithItem(data:  self.userAddressList[indexPath.row], type: .address)
                return cell
            } else if indexPath.row == userAddressList.count {
                let cell = tableView.dequeueReusableCell(withIdentifier: "addInfoCell", for: indexPath) as! AddInfoCell
                return cell
            }
        }
        return UITableViewCell()
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return userAddressList.count + 1
        }
        return 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Adresler"
        }
        return ""
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == userAddressList.count {
            self.goto(screenID: "addAdressControllerID", animated: true, data: nil, isModal: true)
            //self.goto(screenID: "addAdressControllerID")
        }
    }

}

extension ChoseAddressController : AddressListDelegate {
    func getResponse(response: UserAddressResponse) {
        userAddressList = response.addressList
        tableView.reloadData()
    }
    func getError(errorMessage: String) {
        
    }
}

extension ChoseAddressController : CustomNavigationViewDelegate {
    internal func backButtonTapped() {
        self.back(animated: true, isModal: true)
    }
    
    
}
