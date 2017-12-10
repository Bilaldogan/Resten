//
//  MainController.swift
//  Resten Glow
//
//  Created by Baran on 1.11.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit
import TabPageViewController

class MainController: BaseController {

    //Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        TabbarClass.createMainTabBar(tabView: tabbarView, tc: tc, viewController: self,selectedIndex: self.selectedIndex, categoryArray: categoryList)
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
    @IBOutlet weak var tabbarView: UIView!
    @IBOutlet weak var navBarView: UIView!
    var selectedIndex : Int = 0
    var categoryList = [CategoryList]()
    let tc = TabPageViewController.init()
    
}

extension MainController {
    
    func configure() {
        navBarView.addShadow()
    }
    
    
}

