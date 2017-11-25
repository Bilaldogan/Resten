//
//  MyBagController.swift
//  Resten Glow
//
//  Created by Baran on 22.11.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit

class MyBagController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConfigure()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonAct(_ sender: Any) {
        self.transitionToBack()
    }
    
    
    @IBOutlet weak var productTableView: UITableView!
    var addProductNameArray = ["SAÇ EKLE","MAKYAJ EKLE","TIRNAK EKLE","DÜĞÜN EKLE"]
}

extension MyBagController {
    
    func tableViewConfigure(){
        productTableView.delegate = self
        productTableView.dataSource = self
        productTableView.separatorStyle = .none
    }
    
}
