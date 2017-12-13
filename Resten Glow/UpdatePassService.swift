//
//  UpdateGsmService.swift
//  Resten Glow
//
//  Created by bilal on 13/12/2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import Foundation
import SWXMLHash
class UpdatePassService : ConnectionDelegate
{
    
    let connection = PostConnection()
    var serviceDelegate : UpdatePassServiceDelegate?
    
    func connectService(newPass: String) {
        
        var soapMessage : String = "<?xml version='1.0' encoding='utf-8'?>"
        soapMessage += "<soap:Envelope xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/'>"
        soapMessage += "<soap:Body><UpdatePassService xmlns='http://tempuri.org/'>"
        soapMessage += "<AdminEmail>\(ADMIN.AdminEmail.rawValue)</AdminEmail>"
        soapMessage += "<AdminPass>\(ADMIN.AdminPass.rawValue)</AdminPass>"
        soapMessage += "<MemberId>\(UserPrefence.getUserId())</MemberId>"
        soapMessage += "<NewPass>\(newPass)</NewPass>"
        soapMessage += "</UpdatePassService>"
        soapMessage += "</soap:Body></soap:Envelope>"
        
        let serviceUrl : String = API.baseURL.rawValue + API.deleteAddress.rawValue
        connection.PostConnection(soapMessage: soapMessage, serviceUrl: serviceUrl)
    }
    
    func getJson(xmlData: XMLIndexer) {
        
        let path = xmlData["soap:Envelope"]
        let path2 = path["soap:Body"]
        let path3 = path2["UpdatePassServiceResponse"]
        let result = path3["UpdatePassServiceResult"]
        
        
        var message = ""
        
        if let Message = result["Message"].element?.text {
            message = Message
        }
        
        if let Error = result["Error"].element?.text {
        }
        
        if  self.serviceDelegate != nil {
            self.serviceDelegate?.getResponse(message: message)
        }
        
    }
    
    func getError(errMessage: String) {
        if  self.serviceDelegate != nil {
            self.serviceDelegate?.getErrorDeleteAddress(errorMessage: errMessage)
        }
    }
    
    init(){
        self.connection.delegate = self
    }
    
}
protocol UpdatePassServiceDelegate {
    func getResponse(message : String)
    func getErrorDeleteAddress(errorMessage : String)
}
