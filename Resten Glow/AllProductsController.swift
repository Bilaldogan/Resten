//
//  AllProductsController.swift
//  Resten Glow
//
//  Created by Baran on 22.11.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit

class AllProductsController: BaseController {
    
    //Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        tableViewConfigure()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Story Board Veriable
    
    @IBOutlet weak var allProductTableView: UITableView!
    @IBOutlet weak var navBarView: UIView!
    var productImageArray = [#imageLiteral(resourceName: "HairHeader"),#imageLiteral(resourceName: "MakeupHeader"),#imageLiteral(resourceName: "NailsHeader"),#imageLiteral(resourceName: "WeddingHeader")]
    
    
}
extension AllProductsController {
    func configure() {
        navBarView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05).cgColor
        navBarView.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        navBarView.layer.shadowOpacity = 0.5
        navBarView.layer.shadowRadius = 0.0
        navBarView.layer.masksToBounds = false
    }
    
    func tableViewConfigure(){
        allProductTableView.delegate = self
        allProductTableView.dataSource = self
        allProductTableView.separatorStyle = .none
    }
    
    
}

extension AllProductsController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productImageArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("AllProducImageViewtCell", owner: self, options: nil)?.first as! AllProducImageViewtCell
        cell.productImageView.image = productImageArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: ScrennID.MAIN_CONTROLLER_ID.rawValue) as! MainController
        vc.selectedIndex = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CalculateClass.calculateTableCellHeight(rate: CAH.PRODUCT_IMAGE_CELL_RATE.rawValue)
    }
}







