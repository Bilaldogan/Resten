//
//  SOCServiceExt.swift
//  Resten Glow
//
//  Created by Baran on 14.12.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import Foundation

extension ServiceOptionController : AdditionalProductDelegate {
    
    func getError(errorMessage: String) {
        print(errorMessage)
        HIDE_SIC(customView: self.view)
    }
    func getResponse(response: AdditionalProductResponse) {
        print(response)
        HIDE_SIC(customView: self.view)
    }
}
