//
//  RegisterService.swift
//  Resten Glow
//
//  Created by Baran on 29.11.2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import Foundation
import SWXMLHash

class RegisterService : ConnectionDelegate
{
    
    let connection = PostConnection()
    var serviceDelegate : RegisterDelegate?
    
    func connectService(model : RegisterSendModel)
    {
        var soapMessage : String = "<?xml version='1.0' encoding='utf-8'?>"
        soapMessage += "<soap:Envelope xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/'>"
        soapMessage += "<soap:Body><RegisterService xmlns='http://tempuri.org/'>"
        soapMessage += "<AdminEmail>\(ADMIN.AdminEmail.rawValue)</AdminEmail>"
        soapMessage += "<AdminPass>\(ADMIN.AdminPass.rawValue)</AdminPass>"
        soapMessage += "<Email>\(model.Email)</Email>"
        soapMessage += "<Pass>\(model.Pass)</Pass>"
        soapMessage += "<Name>\(model.Name)</Name>"
        soapMessage += "<SurName>\(model.SurName)</SurName>"
        soapMessage +=  "<Phone>\(model.PhoneNumber)</Phone>"
        soapMessage += "</RegisterService>"
        soapMessage += "</soap:Body></soap:Envelope>"
        
        let serviceUrl : String = API.baseURL.rawValue + API.registerURL.rawValue
        connection.PostConnection(soapMessage: soapMessage, serviceUrl: serviceUrl)
    }
    
    func getJson(xmlData: XMLIndexer) {
        
        let path = xmlData["soap:Envelope"]
        let path2 = path["soap:Body"]
        let path3 = path2["RegisterServiceResponse"]
        let result = path3["RegisterServiceResult"]
        
        
        var responseData : RegisterResponseModel = RegisterResponseModel()
        
        if let Id = result["Id"].element?.text {
            responseData.Id = Id
        }
        
        if let Email = result["Email"].element?.text {
            responseData.Email = Email
        }
        
        if let Pass = result["Pass"].element?.text {
            responseData.Pass = Pass
        }
        
        if let Gsm = result["Gsm"].element?.text {
            responseData.Gsm = Gsm
        }
        
        if let Name = result["Name"].element?.text {
            responseData.Name = Name
        }
        
        if let SurName = result["SurName"].element?.text {
            responseData.SurName = SurName
        }
        
        if let CreatedDate = result["CreatedDate"].element?.text {
            responseData.CreatedDate = CreatedDate
        }
        
        if let Status = result["Status"].element?.text {
            responseData.Status = Status
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

protocol RegisterDelegate {
    func getResponse(response : RegisterResponseModel)
    func getError(errorMessage : String)
}

struct RegisterResponseModel {
    var Id = ""
    var Email = ""
    var Pass = ""
    var Gsm = ""
    var Name = ""
    var SurName = ""
    var CreatedDate = ""
    var Status = ""
    var Message = ""
    var Error = ""
}

struct RegisterSendModel {
    var Email = ""
    var Pass = ""
    var Name = ""
    var SurName = ""
    var PhoneNumber = ""
}


