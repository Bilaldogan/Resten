//
//  PDTableViewExt.swift
//  Resten Glow
//
//  Created by Baran on 2.11.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import Foundation
import UIKit

extension ProductDetailController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionCount
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if inspritEmpty && otherProductEmpty {
            switch section {
            case 0:
                return 1
            default:
                return 0
            }
        }
        else if inspritEmpty && !otherProductEmpty {
            switch section {
            case 0:
                return 1
            case 1:
                return productDetailResponse.otherProductList.count
            default:
                return 0
            }
        }
        else if !inspritEmpty && otherProductEmpty {
            switch section {
            case 0:
                return 1
            case 1:
                return productDetailResponse.inspritList.count
            default:
                return 0
            }
        }
        else if !inspritEmpty && !otherProductEmpty {
            switch section {
            case 0:
                return 1
            case 1:
                return productDetailResponse.otherProductList.count
            case 2:
                return productDetailResponse.inspritList.count
            default:
                return 0
            }
        }
        else{
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if inspritEmpty && otherProductEmpty {
            switch indexPath.section {
            case 0:
                let cell = Bundle.main.loadNibNamed("HowToPrepareCell", owner: self, options: nil)?.first as! HowToPrepareCell
                cell.howToPreapereLabel.text = productDetailResponse.HowToPrepare
                return cell
            default:
                let cell = Bundle.main.loadNibNamed("ProductCell", owner: self, options: nil)?.first as! ProductCell
                return cell
            }
        }
        else if inspritEmpty && !otherProductEmpty {
            switch indexPath.section {
            case 0:
                let cell = Bundle.main.loadNibNamed("HowToPrepareCell", owner: self, options: nil)?.first as! HowToPrepareCell
                cell.howToPreapereLabel.text = productDetailResponse.HowToPrepare
                return cell
            case 1:
                let cell = Bundle.main.loadNibNamed("ProductCell", owner: self, options: nil)?.first as! ProductCell
                cell.cellConfigureForDetail(Product: productDetailResponse.otherProductList[indexPath.row])
                return cell
            default:
                let cell = Bundle.main.loadNibNamed("ProductCell", owner: self, options: nil)?.first as! ProductCell
                return cell
            }
        }
        else if !inspritEmpty && otherProductEmpty {
            switch indexPath.section  {
            case 0:
                let cell = Bundle.main.loadNibNamed("HowToPrepareCell", owner: self, options: nil)?.first as! HowToPrepareCell
                cell.howToPreapereLabel.text = productDetailResponse.HowToPrepare
                return cell
            case 1:
                let cell = Bundle.main.loadNibNamed("InspritationCell", owner: self, options: nil)?.first as! InspritationCell
                if indexPath.row == 0 {
                    cell.titleLabel.text = "İLHAM AL!"
                    cell.descLabel.text = "Kılavuzumuzdan bir stil seçin veya kendi stilinizi oluşturun"
                }
                else{
                    cell.titleLabel.text = ""
                    cell.descLabel.text = ""
                }
                cell.insImageView.loadImage(url: productDetailResponse.inspritList[indexPath.row].ImagePath)
                return cell
            default:
                let cell = Bundle.main.loadNibNamed("ProductCell", owner: self, options: nil)?.first as! ProductCell
                return cell
            }
        }
        else if !inspritEmpty && !otherProductEmpty {
            switch indexPath.section {
            case 0:
                let cell = Bundle.main.loadNibNamed("HowToPrepareCell", owner: self, options: nil)?.first as! HowToPrepareCell
                cell.howToPreapereLabel.text = productDetailResponse.HowToPrepare
                return cell
            case 1:
                let cell = Bundle.main.loadNibNamed("ProductCell", owner: self, options: nil)?.first as! ProductCell
                cell.cellConfigureForDetail(Product: productDetailResponse.otherProductList[indexPath.row])
                return cell
            case 2:
                let cell = Bundle.main.loadNibNamed("InspritationCell", owner: self, options: nil)?.first as! InspritationCell
                if indexPath.row == 0 {
                    cell.titleLabel.text = "İLHAM AL!"
                    cell.descLabel.text = "Kılavuzumuzdan bir stil seçin veya kendi stilinizi oluşturun"
                }
                else{
                    cell.titleLabel.text = ""
                    cell.descLabel.text = ""
                }
                cell.insImageView.loadImage(url: productDetailResponse.inspritList[indexPath.row].ImagePath)
                return cell
            default:
                let cell = Bundle.main.loadNibNamed("ProductCell", owner: self, options: nil)?.first as! ProductCell
                return cell
            }
        }
        else{
            let cell = Bundle.main.loadNibNamed("ProductCell", owner: self, options: nil)?.first as! ProductCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if inspritEmpty && otherProductEmpty {
           
        }
        else if inspritEmpty && !otherProductEmpty {
            switch indexPath.section {
            case 1:
                self.startOtherProductService(productID: productDetailResponse.otherProductList[indexPath.row].Id)
            default:
                break
            }
        }
        else if !inspritEmpty && otherProductEmpty {

        }
        else if !inspritEmpty && !otherProductEmpty {
            switch indexPath.section {
            case 1:
                self.startOtherProductService(productID: productDetailResponse.otherProductList[indexPath.row].Id)
            default:
                break
            }
        }
        else{
            
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if inspritEmpty && otherProductEmpty {
            switch indexPath.section {
            case 0:
                return UITableViewAutomaticDimension
            default:
                return 0
            }
        }
        else if inspritEmpty && !otherProductEmpty {
            switch indexPath.section {
            case 0:
                return UITableViewAutomaticDimension
            case 1:
                return CalculateClass.calculateTableCellHeight(rate: CAH.MAİN_TABLEVİEW_CELL_RATE.rawValue)
            default:
                return 0
            }
        }
        else if !inspritEmpty && otherProductEmpty {
            switch indexPath.section {
            case 0:
                return UITableViewAutomaticDimension
            case 1:
                if indexPath.row == 0 {
                    return CalculateClass.calculateTableCellHeight(rate: CAH.INSPRATATION_CELL_IMAGES_RATE.rawValue)
                }
                else{
                    return CalculateClass.calculateTableCellHeight(rate: CAH.INSPRATATION_CELL_WITHOUT_RATE.rawValue)
                }
            default:
                return 0
            }
        }
        else if !inspritEmpty && !otherProductEmpty {
            switch indexPath.section {
            case 0:
                return UITableViewAutomaticDimension
            case 1:
                return CalculateClass.calculateTableCellHeight(rate: CAH.MAİN_TABLEVİEW_CELL_RATE.rawValue)
            case 2:
                if indexPath.row == 0 {
                    return CalculateClass.calculateTableCellHeight(rate: CAH.INSPRATATION_CELL_IMAGES_RATE.rawValue)
                }
                else{
                    return CalculateClass.calculateTableCellHeight(rate: CAH.INSPRATATION_CELL_WITHOUT_RATE.rawValue)
                }
            default:
                return 0
            }
        }
        else{
            return 0
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
                    case 1:
                        return 80
                    default:
                        return 0
                }
            case .phone:
                switch section {
                case 0:
                    return 0
                case 1:
                    return 40
                default:
                    return 0
                }
            default:
                return 0
            }
        }
    
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            var headerView : UIView!
            //var headerSmallView : UIView!
            var headerLabel : UILabel!
            
            switch UIDevice.current.userInterfaceIdiom{
            case .pad:
                headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 80))
                headerView.backgroundColor = ColorUtil.lightGray
//                headerSmallView = UIView(frame: CGRect(x: self.view.frame.width * 0.3, y: 80, width: self.view.frame.width * 0.7, height: 1.0))
//                headerSmallView.backgroundColor = ColorUtil.purple
                
                headerLabel = UILabel(frame: CGRect(x: headerView.frame.width * 0.05, y: 0, width: headerView.frame.width * 0.9, height: 80))
                headerLabel.backgroundColor = UIColor.clear
                headerLabel.textColor = ColorUtil.textDarkGray
                headerLabel.textAlignment = .left
                headerLabel.font = UIFont(name: "JosefinSans-Bold", size: 20)
                headerLabel.minimumScaleFactor = 6.0 / 10.0
            case .phone:
                headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 40))
                headerView.backgroundColor = ColorUtil.lightGray
                
                
                headerLabel = UILabel(frame: CGRect(x: headerView.frame.width * 0.05, y: 0, width: headerView.frame.width * 0.9, height: 40))
                headerLabel.textColor = ColorUtil.textDarkGray
                headerLabel.textAlignment = .left
                headerLabel.font = UIFont(name: "JosefinSans-Bold", size: 13)
                headerLabel.minimumScaleFactor = 6.0 / 10.0
            default:
               break
            }
           
            if inspritEmpty && !otherProductEmpty {
                switch section {
                case 0:
                    headerLabel.text = ""
                case 1:
                    headerLabel.text = "İLGİLİ HİZMETLERİMİZ"
//                    headerView.addSubview(headerSmallView)
                    headerView.addSubview(headerLabel)
                default:
                    break
                }
            }
            else if !inspritEmpty && !otherProductEmpty {
                switch section {
                case 0:
                    headerLabel.text = ""
                case 1:
                    headerLabel.text = "İLGİLİ HİZMETLERİMİZ"
//                   headerView.addSubview(headerSmallView)
                    headerView.addSubview(headerLabel)
                default:
                    break
                }
            }
            
           return headerView
        }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if productDetailTableView.contentOffset.y >= 0 {
            UIView.animate(withDuration: 0.8, animations: {
                self.topBarView.backgroundColor = UIColor(white: 1, alpha: 1.0)
            })
        }
        else{
            UIView.animate(withDuration: 0.8, animations: {
                self.topBarView.backgroundColor = UIColor(white: 1, alpha: 0.0)
            })
        }
    }
    
    
    
}



