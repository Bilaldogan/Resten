//
//  ParallaxHeaderClass.swift
//  Resten Glow
//
//  Created by Baran on 1.11.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import Foundation
import UIKit

class ParalaxHeaderClass {
   
    func createParalaxHeader(headerView : UIView, tableView: UITableView, tableHeaderHeight: CGFloat){
        var funcHeaderView = headerView
        funcHeaderView = tableView.tableHeaderView!
        
        var frame = tableView.tableHeaderView?.frame
        frame?.size.height = 1
        let selfheaderView : UIView = UIView(frame: frame!)
        tableView.tableHeaderView = selfheaderView
        tableView.addSubview(funcHeaderView)
        
        
        tableView.contentInset = UIEdgeInsets(top: tableHeaderHeight , left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -tableHeaderHeight)
        self.updateHeaderView(tableView: tableView, headerView: headerView, tableHeaderHeight: tableHeaderHeight)
        
    }
    
    func updateHeaderView(tableView: UITableView, headerView: UIView, tableHeaderHeight: CGFloat) {
        
        var headerReck = CGRect(x: 0, y: -tableHeaderHeight, width: tableView.bounds.width, height: tableHeaderHeight)
        
        if tableView.contentOffset.y < -tableHeaderHeight {
            headerReck.origin.y = tableView.contentOffset.y
            headerReck.size.height = -tableView.contentOffset.y
        }
        headerView.frame = headerReck
    }
    
}
