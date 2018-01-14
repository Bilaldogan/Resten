 //
//  AllOrderListController.swift
//  Resten Glow
//
//  Created by bilal on 18/12/2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit

class AllOrderListController: CollapsibleTableSectionViewController {

    @IBOutlet weak var customNavigation: CustomNavigationView!
    
    var allOrderService = AllOrderService()
    var tableViewData : AllOrderServiceResponseModel = AllOrderServiceResponseModel()
    var selectedSection : Int?
    override func viewDidLoad() {
        self.customNavigation.addShadow()
        self.isOrderController = true
        super.viewDidLoad()
        _tableView.register(UINib(nibName: "OrderDetailCell", bundle: nil), forCellReuseIdentifier: "orderDetailCell")
        self.customNavigation.navDelegate = self
        self.allOrderService.serviceDelegate = self
        self.allOrderService.connectService(memberId: UserPrefence.getUserId())
        self.SHOW_SIC()
        self.delegate = self

    }
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            selectedSection = 0
            _tableView.reloadData()
        case 1:
            selectedSection = 1
            _tableView.reloadData()
        default:
            break
        }
    }
    
 }
 
extension AllOrderListController : AllOrderServiceDelegate {
    func getResponse(response: AllOrderServiceResponseModel) {
        tableViewData = response
        _tableView.reloadData()
        HIDE_SIC(customView: self.view)
    }
    
    func getError(errorMessage: String) {
        print(errorMessage)
        HIDE_SIC(customView: self.view)
    }
    
    
}
extension AllOrderListController: CollapsibleTableSectionDelegate {
    
    func numberOfSections(_ tableView: UITableView) -> Int {
        if selectedSection == 0 {
            return tableViewData.completeOrders.count
        } else if selectedSection == 1 {
            return tableViewData.inCompleteOrders.count
        }
        return 0
    }
    
    func collapsibleTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedSection == 0 {
            return tableViewData.completeOrders[section].items.count
        } else if selectedSection == 1 {
            return tableViewData.inCompleteOrders[section].items.count
        }
        return 0
    }
    func collapsibleTableView(_ tableView: UITableView, OrderDataForHeaderInSection section: Int) -> AnyObject? {
        if selectedSection == 0 {
            return tableViewData.completeOrders[section] as AnyObject
        } else if selectedSection == 1 {
            return tableViewData.inCompleteOrders[section] as AnyObject
        }
        return SectionOrder() as AnyObject
        
    }
    func collapsibleTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: OrderDetailCell = tableView.dequeueReusableCell(withIdentifier: "orderDetailCell") as? OrderDetailCell {
            if selectedSection == 0 {
                cell.configureWith(data: tableViewData.completeOrders[indexPath.section].items[indexPath.row])
            } else if selectedSection == 1 {
                cell.configureWith(data: tableViewData.inCompleteOrders[indexPath.section].items[indexPath.row])
            }
            return cell
        }
        
        
        return UITableViewCell()
    }
    func collapsibleTableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableViewAutomaticDimension
    }
   
    func shouldCollapseByDefault(_ tableView: UITableView) -> Bool {
        return true
    }
    
 }
extension AllOrderListController : CustomNavigationViewDelegate {
    func backButtonTapped() {
        self.back()
    }
}
