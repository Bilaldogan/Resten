//
//  MBCTableViewExt.swift
//  Resten Glow
//
//  Created by Baran on 22.11.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import Foundation
import UIKit

extension MyBagController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if CoreDataSupporter.fetchToBag() != nil {
            return 2
        }
        else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if CoreDataSupporter.fetchToBag() != nil {
            switch section {
            case 0:
                return (CoreDataSupporter.fetchToBag()?.count)!
            case 1:
                return self.categoryList.count
            default:
                return 0
            }
        }
        else{
            return self.categoryList.count
        }
       
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if CoreDataSupporter.fetchToBag() != nil {
            switch indexPath.section {
            case 0:
                let cell = Bundle.main.loadNibNamed("BagProductCell", owner: self, options: nil)?.first as! BagProductCell
                cell.productName.text = CoreDataSupporter.fetchToBag()?[indexPath.row].name
                cell.productPrice.text = (CoreDataSupporter.fetchToBag()?[indexPath.row].price)! + "₺"
                return cell
            case 1:
                let cell = Bundle.main.loadNibNamed("LittleAddProductCell", owner: self, options: nil)?.first as! LittleAddProductCell
                cell.productButton.setTitle(self.categoryList[indexPath.row].CategoryName + " EKLE", for: .normal)
                return cell
            default:
                let cell = Bundle.main.loadNibNamed("ProductCell", owner: self, options: nil)?.first as! ProductCell
                return cell
            }
        }
        else{
            switch indexPath.section {
            case 0:
                let cell = Bundle.main.loadNibNamed("AddProductCell", owner: self, options: nil)?.first as! AddProductCell
                cell.productButton.setTitle(self.categoryList[indexPath.row].CategoryName, for: .normal)
                return cell
            default:
                let cell = Bundle.main.loadNibNamed("ProductCell", owner: self, options: nil)?.first as! ProductCell
                return cell
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if CoreDataSupporter.fetchToBag() != nil {
            switch indexPath.section {
            case 0:break
            case 1:
                self.goto(screenID: "MyBagPopupControllerID", animated: false, data: self.categoryList[indexPath.row].CategoryName as AnyObject, isModal: true)
            default:
                break
            }
        }
        else{
            switch indexPath.section {
            case 0:
                self.goto(screenID: "MyBagPopupControllerID", animated: false, data: self.categoryList[indexPath.row].CategoryName as AnyObject, isModal: true)
            default:
               break
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if CoreDataSupporter.fetchToBag() != nil {
            switch indexPath.section {
            case 0:
                return CalculateClass.calculateTableCellHeight(rate: CAH.MY_BAG_TABLEVİEW_CELL_RATE.rawValue)
            case 1:
                return CalculateClass.calculateTableCellHeight(rate: CAH.MY_BAG_TABLEVİEW_CELL_RATE.rawValue)
            default:
                return 0
            }
        }
        else{
            switch indexPath.section {
            case 0:
                return CalculateClass.calculateTableCellHeight(rate: CAH.MY_BAG_TABLEVİEW_CELL_RATE.rawValue)
            default:
                return 0
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch UIDevice.current.userInterfaceIdiom{
        case .pad:
            switch section {
            case 2:
                return 5
            default:
                return 0.0001
            }
        case .phone:
            switch section {
            case 2:
                return 15
            default:
                return 0.0001
            }
        default:
            return 0.0001
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        var footerView : UIView!
        
        switch UIDevice.current.userInterfaceIdiom{
        case .pad:
            footerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 15))
            footerView.backgroundColor = ColorUtil.lightGray
            
        case .phone:
            footerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 5))
            footerView.backgroundColor = ColorUtil.lightGray
            
        default:
            break
        }
        return footerView
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch UIDevice.current.userInterfaceIdiom{
        case .pad:
            switch section {
            case 0:
                return 0
            default:
                return 0
            }
        case .phone:
            switch section {
            case 0:
                return 0
            default:
                return 0
            }
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView : UIView!
        var headerSmallView : UIView!
        var headerLabel : UILabel!
        
        switch UIDevice.current.userInterfaceIdiom{
        case .pad:
            headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 80))
            headerView.backgroundColor = ColorUtil.lightGray
            headerSmallView = UIView(frame: CGRect(x: self.view.frame.width * 0.3, y: 80, width: self.view.frame.width * 0.7, height: 1.0))
            headerSmallView.backgroundColor = ColorUtil.purple
            
            headerLabel = UILabel(frame: CGRect(x: headerView.frame.width * 0.05, y: 0, width: headerView.frame.width * 0.9, height: 80))
            headerLabel.backgroundColor = UIColor.clear
            headerLabel.textColor = ColorUtil.purple
            headerLabel.textAlignment = .right
            headerLabel.font = UIFont(name: "JosefinSans-BoldItalic", size: 20)
            headerLabel.minimumScaleFactor = 6.0 / 10.0
        case .phone:
            headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 40))
            headerView.backgroundColor = ColorUtil.lightGray
            headerSmallView  = UIView(frame: CGRect(x: self.view.frame.width * 0.3, y: 40, width: self.view.frame.width * 0.7, height: 1.0))
            headerSmallView.backgroundColor = ColorUtil.purple
            
            headerLabel = UILabel(frame: CGRect(x: headerView.frame.width * 0.05, y: 0, width: headerView.frame.width * 0.9, height: 40))
            headerLabel.textColor = ColorUtil.purple
            headerLabel.textAlignment = .right
            headerLabel.font = UIFont(name: "JosefinSans-BoldItalic", size: 13)
            headerLabel.minimumScaleFactor = 6.0 / 10.0
        default:
            break
        }
        
        switch section {
        case 0:
            headerLabel.text = ""
        case 1:
            headerLabel.text = "İSTEĞE GÖRE HİZMETLER"
            headerView.addSubview(headerSmallView)
            headerView.addSubview(headerLabel)
        default:
            break
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        if CoreDataSupporter.fetchToBag() != nil {
            switch indexPath.section {
            case 0:
                return true
            default:
                return false
            }
        }
        else{
            return false
        }
    }
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Sil"
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            CoreDataSupporter.removeSelectedData(objectID: (CoreDataSupporter.fetchToBag()?[indexPath.row].id)!)
            if CoreDataSupporter.fetchToBag() == nil {
                self.startService()
            }
            else{
                productTableView.reloadData()
            }
            coreDataChecked()
        }
    }
    
    
}


