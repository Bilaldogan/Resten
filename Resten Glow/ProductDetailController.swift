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
        self.topBarView.navDelegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //StoryBoard veriable
    
    @IBOutlet weak var topBarView: CustomNavigationView!
    @IBOutlet weak var productDetailTableView: UITableView!
    
}

extension ProductDetailController {
   
    func tableViewDelegate(){
        self.productDetailTableView.delegate = self
        self.productDetailTableView.dataSource = self
        self.productDetailTableView.rowHeight = UITableViewAutomaticDimension
        self.productDetailTableView.estimatedRowHeight = 300
        self.productDetailTableView.contentInset = UIEdgeInsets(top: CalculateClass.calculateContentInset(rate: CAH.PRODUCT_DETAİL_TABLEVİEW_CONTENT_RATE.rawValue), left: 0, bottom: 0, right: 0)
    }
    
    func configure(){
        //self.topBarView.layer.backgroundColor = 0
    }
    
}

extension ProductDetailController : CustomNavigationViewDelegate {
    func backButtonTapped() {
        DispatchQueue.main.async() {
            self.navigationController?.popViewController(animated: true)
        }
    }
}

