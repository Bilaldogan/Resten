//
//  HairController.swift
//  Resten Glow
//
//  Created by Baran on 1.11.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit
import TabPageViewController

class TabbarChildController: BaseController {

    //Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Call Delegate
        self.tableViewDelegate()
        //Create Paralax Header
        paralaxHeader.createParalaxHeader(headerView: tableHeaderView, tableView: hairTableView, tableHeaderHeight: paralax_Header_Height)
        configure()
        self.startService()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.sizingSetting()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func startService(){
        self.productService.serviceDelegate = self
        self.productService.connectService(categoryName: categoryName)
        SHOW_SIC()
    }
    
    
    //Storyboard Veriable
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var tableHeaderView: UIView!
    @IBOutlet weak var hairTableView: UITableView!
    
    //
    var hairStructure : HairStruct = HairStruct()
    var categoryName = ""
    var categoryImageURL = ""
    
    //Service veriable
    var productService = ProductService()
    //Service Response Model
    var productResponse = ProductResponse()
}

extension TabbarChildController {
    
    func configure(){
        self.headerImageView.loadImage(url: categoryImageURL)
    }
    
    func sizingSetting(){
        self.tableHeaderView.setHeight(height: paralax_Header_Height)
        
    }
    
    func tableViewDelegate(){
        self.hairTableView.delegate = self
        self.hairTableView.dataSource = self
    }
    
}

extension TabbarChildController : ProductDelegate {
    func getResponse(response: ProductResponse) {
        if response.Error == "false" {
            self.productResponse = response
            hairTableView.reloadData()
        }
        else{
            self.view.makeToast(response.Message)
        }
        HIDE_SIC(customView: self.view)
    }
    
    func getError(errorMessage: String) {
        print(errorMessage)
        HIDE_SIC(customView: self.view)
    }
    
    
}
