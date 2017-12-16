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
    
    @IBAction func addToBagAction(_ sender: UIButton) {
        var mainProduct = ProductStructure()
        mainProduct.category_id = productResponse.Category
        mainProduct.desc = productResponse.Description
        mainProduct.id = productResponse.Id
        mainProduct.name = productResponse.ProductName
        mainProduct.price = productResponse.Price
        mainProduct.time = productResponse.OperationTime
        CoreDataSupporter.addProduct(product: mainProduct)
        for additionalProduct in productArray {
            CoreDataSupporter.addProduct(product: additionalProduct)
        }
        self.goto(screenID: ScrennID.MY_BAG_CONTROLLER_ID.rawValue)
    }
    
    
    //StoryBoard Veriable
    @IBOutlet weak var priceAndTimeLabel: UILabel!
    @IBOutlet weak var serviceOptionTableView: UITableView!
    
    //Service veriable
    var additionalProductService = AdditionalProductService()
    //Service responseModel
    var additionalResponseModel = AdditionalProductResponse()
    var productResponse = ProductDetailResponse()
    
    //Controller price
    var productTotalPrice = ProductTotalPrice()
    //Products
    var productArray = [ProductStructure]()
    
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
            self.addProductTotalPrice(price: Int(self.productResponse.Price)!, time: Int(self.productResponse.OperationTime)!, name: self.productResponse.ProductName)
            priceAndTimeLabel.text = productResponse.Price + " ₺ ● " + productResponse.OperationTime + " dk"
            additionalProductService.connectService(category: "Ek Hizmet")
            SHOW_SIC()
        }
    }
    
    func addProductTotalPrice(price: Int, time: Int, name: String){
        productTotalPrice.price = price
        productTotalPrice.time = time
        productTotalPrice.productNameArray.append(name)
    }
    
    
}

struct ProductTotalPrice {
    var price : Int = 0
    var time : Int = 0
    var productNameArray = [String]()
    
    mutating func addProductTotalPrice(price: Int, time: Int, name: String){
        self.price += price
        self.time += time
        self.productNameArray.append(name)
    }
    
    mutating func removeProductTotalPrice(price: Int, time: Int, name: String){
        self.price -= price
        self.time -= time
        var count = 0
        for item in productNameArray {
            if item == name {
                productNameArray.remove(at: count)
            }
            count += 1
        }
    }
}
