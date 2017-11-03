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
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "SmallProfileCell", bundle: nil), forCellReuseIdentifier: "profileCell")
        tableView.register(UINib(nibName: "AddInfoCell", bundle: nil), forCellReuseIdentifier: "addInfoCell")
         tableView.register(UINib(nibName: "AdressCell", bundle: nil), forCellReuseIdentifier: "addressCell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
    }

   

}
extension MyAccountController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0 {
            return  tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! SmallProfileCell
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "addressCell", for: indexPath) as! AdressCell
                return cell
            } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "addInfoCell", for: indexPath) as! AddInfoCell
            return cell
            }
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "addressCell", for: indexPath) as! AdressCell
                cell.configureWithItem(type: .creditCard)
                return cell
            } else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "addInfoCell", for: indexPath) as! AddInfoCell
                cell.label.text = "ÖDEME YÖNTEMİ EKLE"
                return cell
            }
        
        }
        return UITableViewCell()
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 2
        } else if section == 2 {
            return 2
        } else if section == 3{
            return 1
        }
        return 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
       return 3
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Adresleri"
        } else if section == 2 {
            return "Ödeme Bilgileri"
        }
        return ""
    }
    
}
