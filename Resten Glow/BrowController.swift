//
//  BrowController.swift
//  Resten Glow
//
//  Created by Baran on 1.11.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit
import TabPageViewController

class BrowController: BaseController {

    //Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Call Delegate
        self.tableViewDelegate()
        //Create Paralax Header
        paralaxHeader.createParalaxHeader(headerView: tableHeaderView, tableView: browTableView, tableHeaderHeight: paralax_Header_Height)
       
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.sizingSetting()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Storyboard Veriable
    @IBOutlet weak var tableHeaderView: UIView!
    @IBOutlet weak var browTableView: UITableView!
    
    //
    var browStructure : BrowStruct = BrowStruct()
    
}

extension BrowController {
    
    func sizingSetting(){
        self.tableHeaderView.setHeight(height: paralax_Header_Height)
        
    }
    
    func tableViewDelegate(){
        self.browTableView.delegate = self
        self.browTableView.dataSource = self
    }
    
}

