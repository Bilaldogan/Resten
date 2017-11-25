//
//  ProductDetailController.swift
//  Resten Glow
//
//  Created by Baran on 2.11.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit

class ProductDetailController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewDelegate()
        self.configure()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backButtonAct(_ sender: Any) {
        self.transitionToBack()
    }
    
    @IBAction func addToBagButtonAct(_ sender: Any) {
        self.goto(screenID: ScrennID.SERVICEOPTION_CONTROLLER_ID.rawValue)
    }
    
    //StoryBoard veriable
    @IBOutlet weak var topBarView: UIView!
    @IBOutlet weak var productDetailTableView: UITableView!
    
}

extension ProductDetailController {
   
    func tableViewDelegate(){
        self.productDetailTableView.delegate = self
        self.productDetailTableView.dataSource = self
        self.productDetailTableView.separatorStyle = .none
        self.productDetailTableView.rowHeight = UITableViewAutomaticDimension
        self.productDetailTableView.estimatedRowHeight = 300
        self.productDetailTableView.contentInset = UIEdgeInsets(top: CalculateClass.calculateContentInset(rate: CAH.PRODUCT_DETAİL_TABLEVİEW_CONTENT_RATE.rawValue), left: 0, bottom: 0, right: 0)
    }
    
    func configure(){
        self.topBarView.backgroundColor = UIColor(white: 1, alpha: 0.0)
        self.topBarView.addShadow()
    }
    
}


