//
//  AllOrderService.swift
//  Resten Glow
//
//  Created by bilal on 18/12/2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import Foundation
import SWXMLHash
class AllOrderService : ConnectionDelegate
{
    
    let connection = PostConnection()
    var serviceDelegate : AllOrderServiceDelegate?
    
    func connectService(memberId : String)
    {
        var soapMessage : String = "<?xml version='1.0' encoding='utf-8'?>"
        soapMessage += "<soap:Envelope xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/'>"
        soapMessage += "<soap:Body><GetByOrder xmlns='http://tempuri.org/'>"
        soapMessage += "<AdminEmail>\(ADMIN.AdminEmail.rawValue)</AdminEmail>"
        soapMessage += "<AdminPass>\(ADMIN.AdminPass.rawValue)</AdminPass>"
        soapMessage += "<MemberId>\(memberId)</MemberId>"
        soapMessage += "</GetByOrder>"
        soapMessage += "</soap:Body></soap:Envelope>"
        
        let serviceUrl : String = API.baseURL.rawValue + API.getOrderBy.rawValue
        connection.PostConnection(soapMessage: soapMessage, serviceUrl: serviceUrl)
    }
    
    func getJson(xmlData: XMLIndexer) {
        
        let path = xmlData["soap:Envelope"]
        let path2 = path["soap:Body"]
        let path3 = path2["GetByOrderResponse"]
        let result = path3["GetByOrderResult"]
        
        var responseData : AllOrderServiceResponseModel = AllOrderServiceResponseModel()
        
        if let Message = result["OrderVM"]["Message"].element?.text {
            responseData.message = Message
        }
        if let Error =  result["OrderVM"]["Error"].element?.text {
            responseData.error = Error
        }
        for item in result["OrderList"]["OrderList"].all {
            var list = SectionOrder()
            
            if let productCode = item["Code"].element?.text {
                list.productCode = productCode
            }
            if let totalPrice = item["TotalPrice"].element?.text {
                list.totalPrice = totalPrice
            }
            if let appointmentDate = item["AppointmentDate"].element?.text {
                list.orderDate = appointmentDate
            }
            if let product = item["Product"].element?.text {
                list.product = product
            }
            for producItem in item["ProductVM"].all {
                var productlist = ItemOrder()
                if let productName = producItem["ProductName"].element?.text {
                    productlist.productName = productName
                }
                if let description = producItem["Description"].element?.text {
                    productlist.description = description
                }
                if let category = producItem["Category"].element?.text {
                    productlist.category = category
                }
                if let price = producItem["Price"].element?.text {
                    productlist.price = price
                }
                if let operationTime = producItem["OperationTime"].element?.text {
                    productlist.operationTime = operationTime
                }
                list.items.append(productlist)
            }
            if let orderStatus = item["OrderStatus"].element?.text, orderStatus == "pending" {
                responseData.inCompleteOrders.append(list)
            } else if let orderStatus = item["OrderStatus"].element?.text, orderStatus == "done" {
                 responseData.completeOrders.append(list)
            }
        }
        if responseData.inCompleteOrders.count > 0 {
            responseData.numberOfRowsInSection.append(responseData.inCompleteOrders.count)
        }
        if responseData.completeOrders.count > 0 {
            responseData.numberOfRowsInSection.append(responseData.completeOrders.count)
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
protocol AllOrderServiceDelegate {
    func getResponse(response : AllOrderServiceResponseModel)
    func getError(errorMessage : String)
}
public struct AllOrderServiceResponseModel {
    public var completeOrders: [SectionOrder] = []
    public var inCompleteOrders: [SectionOrder] = []
    public var numberOfRowsInSection :[Int] = []
    public var message : String = ""
    public var error : String = ""
}

public struct ItemOrder {
    public var productName: String = ""
    public var description: String = ""
    public var category : String = ""
    public var price : String = ""
    public var operationTime : String = ""
    
}

public struct SectionOrder {
    public var productCode: String = ""
    public var totalPrice : String = ""
    public var orderDate : String = ""
    public var product : String = ""
    public var items: [ItemOrder] = []
    
}
