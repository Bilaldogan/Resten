//
//  MBCServiceExt.swift
//  Resten Glow
//
//  Created by Baran on 15.12.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import Foundation

extension MyBagController : CategoryListDelegate {
    
    func getError(errorMessage: String) {
        print(errorMessage)
        HIDE_SIC(customView: self.view)
    }
    
    func getResponse(response: CategoryListResponseModel) {
        if response.Error == "false" {
            if CoreDataSupporter.fetchToBag() != nil {
                var count = 0
                self.categoryList = response.categoryList
                for product in CoreDataSupporter.fetchToBag()! {
                    for category in self.categoryList {
                        if product.category_id == category.CategoryName {
                            self.categoryList.remove(at: count)
                        }
                        count += 1
                    }
                    count = 0
                }
                self.productTableView.reloadData()
            }
            else{
                self.categoryList = response.categoryList
                self.productTableView.reloadData()
            }
        }
        else{
            self.view.makeToast(response.Message)
        }
        HIDE_SIC(customView: self.view)
    }
    
}
