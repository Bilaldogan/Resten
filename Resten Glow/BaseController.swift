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

    let paralaxHeader = ParalaxHeaderClass()
   
    let paralax_Header_Height = CalculateClass.calculateTableCellHeight(rate: CAH.TABLEVİEW_HEİGHT_RATE.rawValue)
}
