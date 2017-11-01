//
//  MUCTableViewExt.swift
//  Resten Glow
//
//  Created by Baran on 1.11.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import Foundation
import UIKit

extension MakeupController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return makeupStructure.makeUpList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("ProductCell", owner: self, options: nil)?.first as! ProductCell
        cell.cellConfigure(Product: makeupStructure.makeUpList[indexPath.row])
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return CalculateClass.calculateTableCellHeight(rate: CAH.MAİN_TABLEVİEW_CELL_RATE.rawValue)
        
    }
    
    //    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    //        return
    //    }
    
    //    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //
    //    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        paralaxHeader.updateHeaderView(tableView: makeUpTableView, headerView: tableHeaderView, tableHeaderHeight: paralax_Header_Height)
    }
    
    
    
}



