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
        startService()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func closeButtonAction(_ sender: Any) {
        self.transitionToBack()
    }
    //StoryBoard Veriable
    @IBOutlet weak var priceAndTimeLabel: UILabel!
    @IBOutlet weak var serviceOptionTableView: UITableView!
    
    //Service veriable
    var additionalProductService = AdditionalProductService()
    //Service responseModel
    var additionalResponseModel = AdditionalProductResponse()
    var productResponse = ProductDetailResponse()
    
}

extension ServiceOptionController {
   
    func tableViewConfigure(){
        serviceOptionTableView.delegate = self
        serviceOptionTableView.dataSource = self
        serviceOptionTableView.separatorStyle = .none
        serviceOptionTableView.rowHeight = UITableViewAutomaticDimension
        serviceOptionTableView.estimatedRowHeight = 300
    }
    
    func startService(){
        additionalProductService.serviceDelegate = self
        if let productResponse = self.data as? ProductDetailResponse {
            self.productResponse = productResponse
            priceAndTimeLabel.text = productResponse.Price + " ₺ ● " + productResponse.OperationTime + " dk"
            additionalProductService.connectService(category: productResponse.Category)
            SHOW_SIC()
        }
    }
}
