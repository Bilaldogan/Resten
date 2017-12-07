//
//  AddAddressService.swift
//  Resten Glow
//
//  Created by bilal on 04/12/2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import Foundation
import SWXMLHash
class AddAddressService : ConnectionDelegate
{
    
    let connection = PostConnection()
    var serviceDelegate : AddAddressDelegate?
    
    func connectService(model : AddAddressSendModel)
    {
        var soapMessage : String = "<?xml version='1.0' encoding='utf-8'?>"
        soapMessage += "<soap:Envelope xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/'>"
        soapMessage += "<soap:Body><RegisterService xmlns='http://tempuri.org/'>"
        soapMessage += "<AdminEmail>\(ADMIN.AdminEmail.rawValue)</AdminEmail>"
        soapMessage += "<AdminPass>\(ADMIN.AdminPass.rawValue)</AdminPass>"
        soapMessage += "<MemberId>\(model.MemberId)</MemberId>"
        soapMessage += "<Description>\(model.Description)</Description>"
        soapMessage += "<Title>\(model.Title)</Title>"
        soapMessage += "</RegisterService>"
        soapMessage += "</soap:Body></soap:Envelope>"
        
        let serviceUrl : String = API.baseURL.rawValue + API.registerURL.rawValue
        connection.PostConnection(soapMessage: soapMessage, serviceUrl: serviceUrl)
    }
    
    func getJson(xmlData: XMLIndexer) {
        
        let path = xmlData["soap:Envelope"]
        let path2 = path["soap:Body"]
        let path3 = path2["AddAddressServiceResponse"]
        let result = path3["AddAddressServiceResult"]
        
        
        var responseData : AddAddressResponse = AddAddressResponse()
        
        if let Id = result["Id"].element?.text {
            responseData.Id = Id
        }
        
        if let Title = result["Title"].element?.text {
            responseData.Title = Title
        }
        
        if let Description = result["Description"].element?.text {
            responseData.Description = Description
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

protocol AddAddressDelegate {
    func getResponse(response : AddAddressResponse)
    func getError(errorMessage : String)
}

struct AddAddressResponse {
    var Id = ""
    var Title = ""
    var Description = ""
    var Message = ""
    var Error = ""
}

struct AddAddressSendModel {
    var MemberId = ""
    var Description = ""
    var Title = ""
}


