//
//  ProductService.swift
//  Resten Glow
//
//  Created by Baran on 8.12.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import Foundation
import SWXMLHash

class ProductService : ConnectionDelegate
{
    
    let connection = PostConnection()
    var serviceDelegate : ProductDelegate?
    
    func connectService(categoryName : String)
    {
        var soapMessage : String = "<?xml version='1.0' encoding='utf-8'?>"
        soapMessage += "<soap:Envelope xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/'>"
        soapMessage += "<soap:Body><ProductList xmlns='http://tempuri.org/'>"
        soapMessage += "<AdminEmail>\(ADMIN.AdminEmail.rawValue)</AdminEmail>"
        soapMessage += "<AdminPass>\(ADMIN.AdminPass.rawValue)</AdminPass>"
        soapMessage += "<Category>\(categoryName)</Category>"
        soapMessage += "</ProductList>"
        soapMessage += "</soap:Body></soap:Envelope>"
        
        let serviceUrl : String = API.baseURL.rawValue + API.productListURL.rawValue
        connection.PostConnection(soapMessage: soapMessage, serviceUrl: serviceUrl)
    }
    
    func getJson(xmlData: XMLIndexer) {
        
        let path = xmlData["soap:Envelope"]
        let path2 = path["soap:Body"]
        let path3 = path2["ProductListResponse"]
        let result = path3["ProductListResult"]
        
        
        var responseData : ProductResponse = ProductResponse()
        
        print(result)
        for item in result["ProductList"]["ProductVM"].all {
            var list : ProductList = ProductList()

            if let Id = item["Id"].element?.text {
                list.Id = Id
            }
           
            if let ProductName = item["ProductName"].element?.text {
                list.ProductName = ProductName
            }
            
            if let Description = item["Description"].element?.text {
                list.Description = Description
            }
            
            if let Category = item["Category"].element?.text {
                list.Category = Category
            }
            
            if let Price = item["Price"].element?.text {
                list.Price = Price
            }
            
            if let OperationTime = item["OperationTime"].element?.text {
                list.OperationTime = OperationTime
            }
           
            responseData.productList.append(list)
        }
        
        if let Message = result["Message"].element?.text {
            responseData.Message = Message
        }
        
        if let Error = result["Error"].element?.text {
            responseData.Error = Error
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

protocol ProductDelegate {
    func getResponse(response : ProductResponse)
    func getError(errorMessage : String)
}

struct ProductResponse {
    var productList = [ProductList]()
    var Message = ""
    var Error = ""
}

struct ProductList {
    var Id = ""
    var ProductName = ""
    var Description = ""
    var Category = ""
    var Price = ""
    var OperationTime = ""
}



