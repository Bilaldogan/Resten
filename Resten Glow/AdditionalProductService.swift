//
//  AdditionalProductService.swift
//  Resten Glow
//
//  Created by Baran on 14.12.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import Foundation
import SWXMLHash

class AdditionalProductService : ConnectionDelegate
{
    
    let connection = PostConnection()
    var serviceDelegate : AdditionalProductDelegate?
    
    func connectService(category : String)
    {
        var soapMessage : String = "<?xml version='1.0' encoding='utf-8'?>"
        soapMessage += "<soap:Envelope xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/'>"
        soapMessage += "<soap:Body><AdditionalProduct xmlns='http://tempuri.org/'>"
        soapMessage += "<AdminEmail>\(ADMIN.AdminEmail.rawValue)</AdminEmail>"
        soapMessage += "<AdminPass>\(ADMIN.AdminPass.rawValue)</AdminPass>"
        soapMessage += "<Category>\(category)</Category>"
        soapMessage += "</AdditionalProduct>"
        soapMessage += "</soap:Body></soap:Envelope>"
        
        let serviceUrl : String = API.baseURL.rawValue + API.additionalProductURL.rawValue
        connection.PostConnection(soapMessage: soapMessage, serviceUrl: serviceUrl)
    }
    
    func getJson(xmlData: XMLIndexer) {
        
        let path = xmlData["soap:Envelope"]
        let path2 = path["soap:Body"]
        let path3 = path2["AdditionalProductResponse"]
        let result = path3["AdditionalProductResult"]

        var responseData : AdditionalProductResponse = AdditionalProductResponse()
        
        for item in result["ProductList"]["ProductVM"].all {
            var list : AdditionalProductList = AdditionalProductList()
            
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
            
            responseData.AdditionalList.append(list)
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

protocol AdditionalProductDelegate {
    func getResponse(response : AdditionalProductResponse)
    func getError(errorMessage : String)
}

struct AdditionalProductResponse {
    var AdditionalList = [AdditionalProductList]()
    var Message = ""
    var Error = ""
}

struct AdditionalProductList {
    var Id = ""
    var ProductName = ""
    var Description = ""
    var Category = ""
    var Price = ""
    var OperationTime = ""
    var HowToPrepare = ""
}



