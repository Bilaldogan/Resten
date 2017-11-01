//
//  HairController.swift
//  Resten Glow
//
//  Created by Baran on 1.11.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit

class HairController: BaseController {

    //Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Call Delegate
        self.tableViewDelegate()
        //Create Paralax Header
        paralaxHeader.createParalaxHeader(headerView: tableHeaderView, tableView: hairTableView, tableHeaderHeight: paralax_Header_Height)
        
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
    @IBOutlet weak var hairTableView: UITableView!
    
}

extension HairController {
    
    func sizingSetting(){
        self.tableHeaderView.setHeight(height: paralax_Header_Height)
    }
    
    func tableViewDelegate(){
        self.hairTableView.delegate = self
        self.hairTableView.dataSource = self
    }
    
}
