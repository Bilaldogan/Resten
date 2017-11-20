//
//  ContactUsController.swift
//  Resten Glow
//
//  Created by Baran on 3.11.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import UIKit

class ContactUsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navBarView.navDelegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBOutlet weak var navBarView: CustomNavigationView!
    
}
extension ContactUsController : CustomNavigationViewDelegate {
    
    func backButtonTapped() {
        self.back()
    }
    
    
}
