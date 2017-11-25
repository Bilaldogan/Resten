//
//  ServiceOptionController.swift
//  Resten Glow
//
//  Created by Baran on 22.11.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit

class ServiceOptionController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConfigure()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func closeButtonAction(_ sender: Any) {
        self.transitionToBack()
    }
    
    @IBOutlet weak var serviceOptionTableView: UITableView!
}

extension ServiceOptionController {
   
    func tableViewConfigure(){
        serviceOptionTableView.delegate = self
        serviceOptionTableView.dataSource = self
        serviceOptionTableView.separatorStyle = .none
        serviceOptionTableView.rowHeight = UITableViewAutomaticDimension
        serviceOptionTableView.estimatedRowHeight = 300
    }
    
}
