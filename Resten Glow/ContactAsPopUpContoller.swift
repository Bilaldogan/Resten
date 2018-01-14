//
//  ContactAsPopUpContoller.swift
//  Resten Glow
//
//  Created by bilal on 11/01/2018.
//  Copyright © 2018 bilal. All rights reserved.
//

import UIKit
import MessageUI

class ContactAsPopUpContoller: BaseController,MFMailComposeViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.shadowViewBottomConstraint.constant = -self.shadowView.frame.height
    }
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            self.shadowViewBottomConstraint.constant = 0
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    @IBAction func closePopupAct(_ sender: UIButton) {
        self.back(animated: true, isModal: true)
    }
    @IBAction func callUs(_ sender: UIButton) {
    }
    @IBAction func emailUsTapped(_ sender: UIButton) {
//        var emailTitle = "Feedback"
//        var toRecipents = ["friend@stackoverflow.com"]
//        var mc: MFMailComposeViewController = MFMailComposeViewController()
//        mc.mailComposeDelegate = self
//        mc.setSubject(emailTitle)
//        mc.setToRecipients(toRecipents)
//        
//        self.present(mc, animated: true, completion: nil)
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case .cancelled:
            print("Mail cancelled")
        case .saved:
            print("Mail saved")
        case .sent:
            print("Mail sent")
        case .failed:
            print("Mail sent failure: \(error)")
        
        }
        self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var blurView: UIView!
    @IBOutlet weak var shadowViewBottomConstraint: NSLayoutConstraint!
    
    
}

extension ContactAsPopUpContoller {
    func configure(){
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        self.blurView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        self.blurEffect(customView: blurView)
        self.shadowView.addShadow(location: .top)
    }
    
}




