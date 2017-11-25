//
//  TabbarClass.swift
//  Resten Glow
//
//  Created by Baran on 1.11.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import Foundation
import TabPageViewController

class TabbarClass {
    
    
    class func createMainTabBar(tabView : UIView, tc : TabPageViewController, viewController : UIViewController, selectedIndex: Int){
       
        let vcHair = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HairControllerID") as! HairController
        tc.tabItems.append((vcHair, "SAÇ"))
        
        let vcMakeup = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MakeupControllerID") as! MakeupController
        tc.tabItems.append((vcMakeup, "MAKYAJ"))
        
        let vcNails = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NailsControllerID") as! NailsController
        tc.tabItems.append((vcNails, "TIRNAK"))
        
        //let vcBrow = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BrowControllerID") as! BrowController
        //tc.tabItems.append((vcBrow, "KAŞ"))
        
        let vcWedding = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WeddingControllerID") as! WeddingController
        tc.tabItems.append((vcWedding, "DÜĞÜN"))
        
        var option = TabPageOption()
        option.tabMargin = 10.0
        option.tabWidth = (tabView.width / 4)
        option.tabHeight = 45
        option.fontSize = 13.0
        //option.tabBackgroundColor = ColorUtil.backGroundColor
        //option.pageBackgoundColor =  ColorUtil.backGroundColor
        option.currentColor = ColorUtil.pink
        option.defaultColor = ColorUtil.textDarkGray
        option.lineColor = ColorUtil.pink
        
        //option.tabWidth = view.frame.width / CGFloat(tc.tabItems.count)
        option.hidesTabBarOnSwipe = true
        
        
        tc.option = option
        tc.view.frame = CGRect(x: 0, y: 0, width: tabView.frame.width, height: tabView.frame.height)
        viewController.addChildViewController(tc)
        tabView.addSubview(tc.view)
        tc.displayControllerWithIndex(selectedIndex, direction: .forward, animated: false)
    }
    
    
    
}
