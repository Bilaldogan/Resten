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
    
    
    class func createMainTabBar(tabView : UIView, tc : TabPageViewController, viewController : UIViewController, selectedIndex: Int, categoryArray: [CategoryList]){
       
        for category in categoryArray {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabbarChildControllerID") as! TabbarChildController
            tc.tabItems.append((vc, category.CategoryName))
            vc.categoryName = category.CategoryName
            vc.categoryImageURL = category.ImagePath
        }
            
        var option = TabPageOption()
        option.tabMargin = 10.0
        if categoryArray.count > 4 {
            option.tabWidth = (tabView.width / 4)
        }
        else{
            option.tabWidth = (tabView.width / CGFloat(categoryArray.count))
        }
        
        option.tabHeight = 45
        option.fontSize = 13.0
        //option.tabBackgroundColor = ColorUtil.backGroundColor
        //option.pageBackgoundColor =  ColorUtil.backGroundColor
        option.currentColor = ColorUtil.pink
        option.defaultColor = ColorUtil.textDarkGray
        option.lineColor = ColorUtil.pink
        
        //option.tabWidth = view.frame.width / CGFloat(tc.tabItems.count)
        //option.hidesTabBarOnSwipe = true
        
        
        tc.option = option
        tc.view.frame = CGRect(x: 0, y: 0, width: tabView.frame.width, height: tabView.frame.height)
        viewController.addChildViewController(tc)
        tabView.addSubview(tc.view)
        tc.displayControllerWithIndex(selectedIndex, direction: .forward, animated: false)
    }
    
    
    
}
