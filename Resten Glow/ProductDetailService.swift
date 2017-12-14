//
//  ProductDetailService.swift
//  Resten Glow
//
//  Created by Baran on 13.12.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import Foundation
import SWXMLHash

class ProductDetailService : ConnectionDelegate
{
    
    let connection = PostConnection()
    var serviceDelegate : ProductDetailDelegate?
    
    func connectService(productID : String)
    {
        var soapMessage : String = "<?xml version='1.0' encoding='utf-8'?>"
        soapMessage += "<soap:Envelope xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/'>"
        soapMessage += "<soap:Body><ProductDetail xmlns='http://tempuri.org/'>"
        soapMessage += "<AdminEmail>\(ADMIN.AdminEmail.rawValue)</AdminEmail>"
        soapMessage += "<AdminPass>\(ADMIN.AdminPass.rawValue)</AdminPass>"
        soapMessage += "<ProductId>\(productID)</ProductId>"
        soapMessage += "</ProductDetail>"
        soapMessage += "</soap:Body></soap:Envelope>"
        
        let serviceUrl : String = API.baseURL.rawValue + API.productDetailURL.rawValue
        connection.PostConnection(soapMessage: soapMessage, serviceUrl: serviceUrl)
    }
    
    func getJson(xmlData: XMLIndexer) {
        
        let path = xmlData["soap:Envelope"]
        let path2 = path["soap:Body"]
        let path3 = path2["ProductDetailResponse"]
        let result = path3["ProductDetailResult"]
        let productPath = result["Product"]
        
        print(path)
        var responseData : ProductDetailResponse = ProductDetailResponse()
        print(result)
        
        for item in result["GetInspiredList"]["GetInspiredVM"].all {
            var list = InspritList()
            if let ImagePath = item["ImagePath"].element?.text {
                list.ImagePath = ImagePath
            }
            responseData.inspritList.append(list)
        }
        for item in result["ProductList"]["ProductVM"].all {
            var list : ProductDetailList = ProductDetailList()
            
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
            
            responseData.otherProductList.append(list)
        }
        
        if let Id = productPath["Id"].element?.text {
            responseData.Id = Id
        }
        
        
        
        if let HowToPrepare = productPath["HowToPrepare"].element?.text {
            responseData.HowToPrepare = HowToPrepare
        }
        
        if let ProductName = productPath["ProductName"].element?.text {
            responseData.ProductName = ProductName
        }
        
        if let Description = productPath["Description"].element?.text {
            responseData.Description = Description
        }
        
        if let Category = productPath["Category"].element?.text {
            responseData.Category = Category
        }
        
        if let Price = productPath["Price"].element?.text {
            responseData.Price = Price
        }
        
        if let OperationTime = productPath["OperationTime"].element?.text {
            responseData.OperationTime = OperationTime
        }
        
        if let Message = productPath["Message"].element?.text {
            responseData.Message = Message
        }
        
        if let Error = productPath["Error"].element?.text {
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

protocol ProductDetailDelegate {
    func getResponse(response : ProductDetailResponse)
    func getError(errorMessage : String)
}

struct ProductDetailResponse {
    var otherProductList = [ProductDetailList]()
    var inspritList = [InspritList]()
    var Id = ""
    var ProductName = ""
    var Description = ""
    var Category = ""
    var Price = ""
    var OperationTime = ""
    var Message = ""
    var Error = ""
    var HowToPrepare = ""
}

struct ProductDetailList {
    var Id = ""
    var ProductName = ""
    var Description = ""
    var Category = ""
    var Price = ""
    var OperationTime = ""
}
struct InspritList{
    var ImagePath = ""
}


