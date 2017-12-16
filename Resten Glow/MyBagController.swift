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
        startService()
        coreDataChecked()
        // Do any additional setup after loading the view.
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonAct(_ sender: Any) {
        self.transitionToBack()
    }
    
    @IBAction func selectAddressButtonAct(_ sender: Any) {
    }
    
    @IBAction func selectDateButtonAct(_ sender: Any) {
        self.goto(screenID: ScrennID.DATE_CONTROLLER_ID.rawValue, animated: true, data: nil, isModal: true)
    }
    @IBAction func acceptMyBagAct(_ sender: Any) {
    }
    
    
    
    @IBOutlet weak var productTableView: UITableView!
    
    //Sepet doluysa
    @IBOutlet weak var bagHelperView: UIView!
    @IBOutlet weak var bagTopHelperView: UIView!
    @IBOutlet weak var topTimeLabel: UILabel!
    
    
    //Service veriable
    var categoryService = CategoryListService()
    //Response Model
    var categoryList = [CategoryList]()
    
    
}

extension MyBagController {
    
    func tableViewConfigure(){
        productTableView.delegate = self
        productTableView.dataSource = self
        productTableView.separatorStyle = .none
    }
    func startService(){
        categoryService.serviceDelegate = self
        categoryService.connectService()
        SHOW_SIC()
    }
    func configure(){
        if CoreDataSupporter.fetchToBag() != nil {
            categoryService.serviceDelegate = self
            categoryService.connectService()
            SHOW_SIC()
        }
        else{
            
        }
    }
    func coreDataChecked(){
        if CoreDataSupporter.fetchToBag() != nil {
            var totalTime : Int = 0
            for item in CoreDataSupporter.fetchToBag()! {
                totalTime += Int(item.time)!
            }
            topTimeLabel.text = String(totalTime) + " dk"
            self.bagHelperView.isHidden = false
            self.bagTopHelperView.isHidden = false
        }
        else{
            self.bagHelperView.isHidden = true
            self.bagTopHelperView.isHidden = true
        }
    }
    
}
