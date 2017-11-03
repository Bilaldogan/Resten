//
//  CalculateClass.swift
//  Resten Glow
//
//  Created by Baran on 1.11.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import Foundation
import UIKit

class CalculateClass : NSObject {
    
    class func calculateTableCellHeight(rate : CGFloat) -> CGFloat {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        return screenWidth * rate
    }
    
    class func calculateContentInset(rate : CGFloat) -> CGFloat {
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        return screenHeight * rate
    }
    
}
