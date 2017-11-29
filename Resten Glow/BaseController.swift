//
//  BaseController.swift
//  Resten Glow
//
//  Created by bilal on 27/10/2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit
import Toast_Swift


class BaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func transitionToBack(){
        self.back(animated: true, isModal: true)
    }
    
    func blurEffect(customView: UIView){
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        //blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        customView.addSubview(blurEffectView)
    }
    
    func SHOW_SIC(){
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SICID") as! SIC
        popOverVC.view.tag = 101
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    func HIDE_SIC(customView: UIView){
        DispatchQueue.main.async {
            //print("Start remove sibview")
            if let viewWithTag = customView.viewWithTag(101) {
                viewWithTag.removeFromSuperview()
            }else{
                print("No!")
            }
        }
    }
    
    
    
    let paralaxHeader = ParalaxHeaderClass()
    let paralax_Header_Height = CalculateClass.calculateTableCellHeight(rate: CAH.TABLEVİEW_HEİGHT_RATE.rawValue)
}
