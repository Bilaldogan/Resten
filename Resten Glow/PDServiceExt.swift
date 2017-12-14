//
//  PDServiceExt.swift
//  Resten Glow
//
//  Created by Baran on 13.12.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import Foundation

extension ProductDetailController : ProductDetailDelegate {
    
    func getError(errorMessage: String) {
        print(errorMessage)
        HIDE_SIC(customView: self.view)
    }
    func getResponse(response: ProductDetailResponse) {
        //print(response)
        if response.Error == "false" {
            productDetailResponse = response
            self.productName.text = response.ProductName
            self.priceAndTimeLabel.text = response.Price + " ₺ ● " + response.OperationTime + " dk"
            
            if response.inspritList.count != 0 {
                sectionCount += 1
                inspritEmpty = false
            }
            if response.otherProductList.count == 1 && response.otherProductList[0].Price == "0" {
                
            }
            else{
                sectionCount += 1
                otherProductEmpty = false
            }
            productDetailTableView.reloadData()
        }
        else{
            self.view.makeToast(response.Message)
        }
        HIDE_SIC(customView: self.view)
    }
    
}
