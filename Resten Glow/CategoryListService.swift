//
//  CategoryListService.swift
//  Resten Glow
//
//  Created by Baran on 7.12.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import Foundation
import SWXMLHash

class CategoryListService : ConnectionDelegate
{
    
    let connection = PostConnection()
    var serviceDelegate : CategoryListDelegate?
    
    func connectService()
    {
        var soapMessage : String = "<?xml version='1.0' encoding='utf-8'?>"
        soapMessage += "<soap:Envelope xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/'>"
        soapMessage += "<soap:Body><CategoryList xmlns='http://tempuri.org/'>"
        soapMessage += "<AdminEmail>\(ADMIN.AdminEmail.rawValue)</AdminEmail>"
        soapMessage += "<AdminPass>\(ADMIN.AdminPass.rawValue)</AdminPass>"
        soapMessage += "</CategoryList>"
        soapMessage += "</soap:Body></soap:Envelope>"
        
        let serviceUrl : String = API.baseURL.rawValue + API.categoryListURL.rawValue
        connection.PostConnection(soapMessage: soapMessage, serviceUrl: serviceUrl)
    }
    
    func getJson(xmlData: XMLIndexer) {
        
        let path = xmlData["soap:Envelope"]
        let path2 = path["soap:Body"]
        let path3 = path2["CategoryListResponse"]
        let result = path3["CategoryListResult"]
        
        print(result)
        var responseData : CategoryListResponseModel = CategoryListResponseModel()
        
        for item in result["CategoryList"]["CategoryList"].all {
            var list : CategoryList = CategoryList()

            if item["CategoryName"].element?.text != nil{
                guard let CategoryName = item["CategoryName"].element?.text else {
                    print("item CategoryName Error...")
                    return
                }
                list.CategoryName = CategoryName
            }
            
            if item["Id"].element?.text != nil{
                guard let Id = item["Id"].element?.text else {
                    print("item Id Error...")
                    return
                }
                list.Id = Id
            }
            
            if item["ImagePath"].element?.text != nil{
                guard let ImagePath = item["ImagePath"].element?.text else {
                    print("item ImagePath Error...")
                    return
                }
                list.ImagePath = ImagePath
            }
        
            responseData.categoryList.append(list)
        }
        
        if result["Error"].element?.text != nil{
            guard let Error = result["Error"].element?.text else {
                print("item Error Error...")
                return
            }
            responseData.Error = Error
        }
        
        if result["Message"].element?.text != nil{
            guard let Message = result["Message"].element?.text else {
                print("item Message Error...")
                return
            }
            responseData.Message = Message
        }
        
        if  self.serviceDelegate != nil {
            self.serviceDelegate?.getResponse(response: responseData)
        }
        
    }
    
    func getError(errMessage: String) {
        if  self.serviceDelegate != nil {
            self.serviceDelegate?.getError(errorMessage: errMessage)
        }
    }
    
    init(){
        self.connection.delegate = self
    }
    
}

protocol CategoryListDelegate {
    func getResponse(response : CategoryListResponseModel)
    func getError(errorMessage : String)
}

struct CategoryListResponseModel {
    var categoryList : [CategoryList] = []
    var Error = ""
    var Message = ""
}

struct CategoryList {
    var CategoryName = ""
    var Id = ""
    var ImagePath = ""
}
