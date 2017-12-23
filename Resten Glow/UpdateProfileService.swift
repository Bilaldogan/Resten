//
//  UpdateProfileService.swift
//  Resten Glow
//
//  Created by bilal on 04/12/2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import Foundation
import SWXMLHash

class UpdateProfileService : ConnectionDelegate
{
    
    let connection = PostConnection()
    var serviceDelegate : RegisterDelegate?
    
    func connectService(model : UpdateProfileSendModel)
    {
        connection.delegate = self

        var soapMessage : String = "<?xml version='1.0' encoding='utf-8'?>"
        soapMessage += "<soap:Envelope xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/'>"
        soapMessage += "<soap:Body><UpdateProfilService xmlns='http://tempuri.org/'>"
        soapMessage += "<AdminEmail>\(ADMIN.AdminEmail.rawValue)</AdminEmail>"
        soapMessage += "<AdminPass>\(ADMIN.AdminPass.rawValue)</AdminPass>"
        soapMessage += "<Email>\(model.Email)</Email>"
        soapMessage += "<Pass>\(model.Pass)</Pass>"
        soapMessage += "<Name>\(model.Name)</Name>"
        soapMessage += "<SurName>\(model.SurName)</SurName>"
        soapMessage += "<MemberId>\(model.MemberId)</MemberId>"
        soapMessage += "<Gsm>\(model.Gsm)</Gsm>"
        soapMessage += "</UpdateProfilService>"
        soapMessage += "</soap:Body></soap:Envelope>"
        
        let serviceUrl : String = API.baseURL.rawValue + API.updateProfile.rawValue
        connection.PostConnection(soapMessage: soapMessage, serviceUrl: serviceUrl)
    }
    
    func getJson(xmlData: XMLIndexer) {
        
        let path = xmlData["soap:Envelope"]
        let path2 = path["soap:Body"]
        let path3 = path2["UpdateProfilServiceResponse"]
        let result = path3["UpdateProfilServiceResult"]
        
        
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

//Delegate ve Response Register İle aynı
struct UpdateProfileSendModel {
    var Email = ""
    var Pass = ""
    var Name = ""
    var SurName = ""
    var MemberId = ""
    var Gsm = ""
}


