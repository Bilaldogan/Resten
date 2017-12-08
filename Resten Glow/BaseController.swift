//
//  BaseController.swift
//  Resten Glow
//
//  Created by bilal on 27/10/2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit
import Toast_Swift
import Reachability

class BaseController: UIViewController {
    var isNoConnection = false
    
    var reachability =  Reachability()!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupReachability()
    }
   
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: Notification.Name("reachabilityChanged"), object: reachability)
    }
    
    
    func transitionToBack(){
        self.back(animated: true, isModal: false)
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
    
    func setupReachability() {
        if isNoConnection {
            return
        }
        NotificationCenter.default.addObserver(self, selector: #selector(internetChanged(note:)), name: Notification.Name("reachabilityChanged") , object: reachability)
        do{
            try reachability.startNotifier()
        } catch {
            print("could not start notifier")
        }
    }
    func internetChanged(note: Notification) {
        let reachability = note.object as! Reachability
        if reachability.isReachable {
            print("REachable")
        } else {
            DispatchQueue.main.async {
                if !self.isNoConnection {
                self.goto(screenID: "noConnectionControllerID")
                }
            }
        }
    }
    let paralaxHeader = ParalaxHeaderClass()
    let paralax_Header_Height = CalculateClass.calculateTableCellHeight(rate: CAH.TABLEVİEW_HEİGHT_RATE.rawValue)
}
