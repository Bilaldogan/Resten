//
//  MainController.swift
//  Resten Glow
//
//  Created by Baran on 1.11.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit
import TabPageViewController

class MainController: UIViewController {

    //Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        TabbarClass.createMainTabBar(tabView: tabbarView, tc: tc, viewController: self)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
   //Story Board Veriable
    @IBOutlet weak var tabbarView: UIView!
    
    let tc = TabPageViewController.create()
    
}
