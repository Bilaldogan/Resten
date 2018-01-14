//
//  MyAccountController.swift
//  Resten Glow
//
//  Created by bilal on 03/11/2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit

class MyAccountController: BaseController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var customNavigation: CustomNavigationView!
    
    var addressListService = AddressListService()
    var deleteAddressService = DeleteAddressService()
    var userAddressList : [UserAddress] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavigation.navDelegate = self
        tableView.register(UINib(nibName: "SmallProfileCell", bundle: nil), forCellReuseIdentifier: "profileCell")
        tableView.register(UINib(nibName: "AddInfoCell", bundle: nil), forCellReuseIdentifier: "addInfoCell")
         tableView.register(UINib(nibName: "AdressCell", bundle: nil), forCellReuseIdentifier: "addressCell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        tableView.separatorStyle = .none
        self.customNavigation.navDelegate = self
        addressListService.serviceDelegate = self
        addressListService.connectService(memberID: UserPrefence.getUserId())
    }

   

}

extension MyAccountController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! SmallProfileCell
            cell.lblUserName.text = UserPrefence.getUserName() + " " + UserPrefence.getUserSurname()
            cell.lblUserMail.text = UserPrefence.getUserMail()
            cell.lblPhoneNumber.text = UserPrefence.getGSM()
            cell.delegate = self
            return cell
        } else if indexPath.section == 1 {
            if indexPath.row < userAddressList.count {
                let cell = tableView.dequeueReusableCell(withIdentifier: "addressCell", for: indexPath) as! AdressCell
                cell.configureWithItem(data:  self.userAddressList[indexPath.row], type: .address)
                return cell
            } else if indexPath.row == userAddressList.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "addInfoCell", for: indexPath) as! AddInfoCell
            return cell
            }
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                //let cell = tableView.dequeueReusableCell(withIdentifier: "addressCell", for: indexPath) as! AdressCell
                
               // return cell
                let cell = tableView.dequeueReusableCell(withIdentifier: "addInfoCell", for: indexPath) as! AddInfoCell
                cell.label.text = "ÖDEME YÖNTEMİ EKLE"
                return cell
            } else if indexPath.row == 1 {
//                let cell = tableView.dequeueReusableCell(withIdentifier: "addInfoCell", for: indexPath) as! AddInfoCell
//                cell.label.text = "ÖDEME YÖNTEMİ EKLE"
//                return cell
            }
        
        } else if indexPath.section == 3 && indexPath.row == 0 {
            let cell = UITableViewCell()
            cell.textLabel?.font = UIFont(name: "JosefinSans-Bold", size: 17)
            cell.textLabel?.textColor = ColorUtil.pink
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.text = "Şifre Değiştir"
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return UITableViewAutomaticDimension
        }
        else if indexPath.section == 1 {
            if indexPath.row < userAddressList.count {
                return UITableViewAutomaticDimension
            }
            else if indexPath.row == userAddressList.count {
                return CalculateClass.calculateTableCellHeight(rate: CAH.MY_ACCAOUNT_BUTTON_CELL_RATE.rawValue)
            }
        }
        else if indexPath.section == 2 {
            return CalculateClass.calculateTableCellHeight(rate: CAH.MY_ACCAOUNT_BUTTON_CELL_RATE.rawValue)
        }
        return UITableViewAutomaticDimension
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return userAddressList.count + 1
        } else if section == 2 {
            return 1
        } else if section == 3{
            return 1
        }
        return 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
       return 4
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch UIDevice.current.userInterfaceIdiom{
        case .pad:
            switch section {
            case 0:
                return 0
            case 1:
                return CalculateClass.calculateTableCellHeight(rate: CAH.MY_ACCAOUNT_BUTTON_CELL_RATE.rawValue)
            case 2:
                return CalculateClass.calculateTableCellHeight(rate: CAH.MY_ACCAOUNT_BUTTON_CELL_RATE.rawValue)
            case 3:
                return CalculateClass.calculateTableCellHeight(rate: CAH.MY_ACCAOUNT_BUTTON_CELL_RATE.rawValue) - 20
            default:
                return 0
            }
        case .phone:
            switch section {
            case 0:
                return 0
            case 1:
                return CalculateClass.calculateTableCellHeight(rate: CAH.MY_ACCAOUNT_BUTTON_CELL_RATE.rawValue)
            case 2:
                return CalculateClass.calculateTableCellHeight(rate: CAH.MY_ACCAOUNT_BUTTON_CELL_RATE.rawValue)
            case 3:
                return CalculateClass.calculateTableCellHeight(rate: CAH.MY_ACCAOUNT_BUTTON_CELL_RATE.rawValue) - 20
            default:
                return 0
            }
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView : UIView!
        var headerLabel : UILabel!
        
        switch UIDevice.current.userInterfaceIdiom{
        case .pad:
            headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 80))
            headerView.backgroundColor = ColorUtil.lightGray
            headerLabel = UILabel(frame: CGRect(x: headerView.frame.width * 0.05, y: 0, width: headerView.frame.width * 0.9, height: CalculateClass.calculateTableCellHeight(rate: CAH.MY_ACCAOUNT_BUTTON_CELL_RATE.rawValue)))
            headerLabel.backgroundColor = UIColor.clear
            headerLabel.textColor = ColorUtil.textDarkGray
            headerLabel.textAlignment = .left
            headerLabel.font = UIFont(name: "JosefinSans-Bold", size: 20)
            headerLabel.minimumScaleFactor = 6.0 / 10.0
        case .phone:
            headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 40))
            headerView.backgroundColor = ColorUtil.lightGray
            headerLabel = UILabel(frame: CGRect(x: headerView.frame.width * 0.05, y: 0, width: headerView.frame.width * 0.9, height: CalculateClass.calculateTableCellHeight(rate: CAH.MY_ACCAOUNT_BUTTON_CELL_RATE.rawValue)))
            headerLabel.textColor = ColorUtil.textDarkGray
            headerLabel.textAlignment = .left
            headerLabel.font = UIFont(name: "JosefinSans-Bold", size: 13)
            headerLabel.minimumScaleFactor = 6.0 / 10.0
        default:
            break
        }
        
        switch section {
        case 0:
            headerLabel.text = ""
        case 1:
            headerLabel.text = "ADRESLERİM"
            headerView.addSubview(headerLabel)
        case 2:
            headerLabel.text = "ÖDEME BİLGİLERİ"
            headerView.addSubview(headerLabel)
        case 3:
            headerLabel.text = " "
        default:
            break
        }
        
        return headerView
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && indexPath.row == userAddressList.count {
           self.goto(screenID: "addAdressControllerID")
        } else if indexPath.section == 2 && indexPath.row == 0 {
            self.goto(screenID: "addCardControllerID" )
        } else if indexPath.section == 3 && indexPath.row == 0 {
            self.goto(screenID: "ChangePasswordID")
        }
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
       if indexPath.section == 1 {
            if indexPath.row < userAddressList.count {
                return true
            }
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                return true
            }
        }
        return false
        
    }
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Sil"
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            if let cell = tableView.cellForRow(at: indexPath) as? AdressCell {
                self.deleteAddressService.serviceDelegate = self
                self.deleteAddressService.connectService(addressId: cell.id)
            }
        }
    }
}
extension MyAccountController : DeleteAddressServiceDelegate {
    func getErrorDeleteAddress(errorMessage: String) {
        
    }
    func getResponse(response: AddAddressResponse) {
        addressListService.connectService(memberID: UserPrefence.getUserId())
    }
}
extension MyAccountController : AddressListDelegate {
    func getResponse(response: UserAddressResponse) {
        userAddressList = response.addressList
        tableView.reloadData()
    }
    func getError(errorMessage: String) {
        
    }
}
extension MyAccountController : SmallProfileCellDelegate {
    func editTapped() {
        self.goto(screenID: "EditProfileID")
    }
}
extension MyAccountController : CustomNavigationViewDelegate {
    internal func backButtonTapped() {
        self.back()
    }

    
}
