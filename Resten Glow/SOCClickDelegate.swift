//
//  SOCClickDelegate.swift
//  Resten Glow
//
//  Created by Baran on 16.12.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import Foundation

extension ServiceOptionController : clickAdditionalProductDelegate {
    
    func aditionalChecked(Checked boolen: Bool, Properties item: AdditionalProductList) {
        if boolen {
            productTotalPrice.addProductTotalPrice(price: Int(item.Price)!, time: Int(item.OperationTime)!, name: item.ProductName)
            var product = ProductStructure()
            product.category_id = item.Category
            product.desc = item.Description
            product.id = item.Id
            product.name = item.ProductName
            product.price = item.Price
            product.time = item.OperationTime
            productArray.append(product)
        }
        else{
            productTotalPrice.removeProductTotalPrice(price: Int(item.Price)!, time: Int(item.OperationTime)!, name: item.ProductName)
            var count = 0
            for productItem in productArray {
                if productItem.id == item.Id {
                    productArray.remove(at: count)
                }
                count += 1
            }
        }
        priceAndTimeLabel.text = String(productTotalPrice.price) + " ₺ ● " + String(productTotalPrice.time) + " dk"
    }
    
}
