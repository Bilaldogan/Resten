//
//  DeleteAddressService.swift
//  Resten Glow
//
//  Created by bilal on 12/12/2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import Foundation
import SWXMLHash
class DeleteAddressService : ConnectionDelegate
{
    
    let connection = PostConnection()
    var serviceDelegate : DeleteAddressServiceDelegate?
    
    func connectService(addressId: String) {
        
        var soapMessage : String = "<?xml version='1.0' encoding='utf-8'?>"
        soapMessage += "<soap:Envelope xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/'>"
        soapMessage += "<soap:Body><DeleteAddress xmlns='http://tempuri.org/'>"
        soapMessage += "<AdminEmail>\(ADMIN.AdminEmail.rawValue)</AdminEmail>"
        soapMessage += "<AdminPass>\(ADMIN.AdminPass.rawValue)</AdminPass>"
        soapMessage += "<MemberId>\(UserPrefence.getUserId())</MemberId>"
        soapMessage += "<AddressId>\(addressId)</AddressId>"
        soapMessage += "</DeleteAddress>"
        soapMessage += "</soap:Body></soap:Envelope>"
        
        let serviceUrl : String = API.baseURL.rawValue + API.deleteAddress.rawValue
        connection.PostConnection(soapMessage: soapMessage, serviceUrl: serviceUrl)
    }
    
    func getJson(xmlData: XMLIndexer) {
        
        let path = xmlData["soap:Envelope"]
        let path2 = path["soap:Body"]
        let path3 = path2["DeleteAddressResponse"]
        let result = path3["DeleteAddressResult"]
        
        
        var responseData = AddAddressResponse()
        
        if let Title = result["Title"].element?.text {
          responseData.Title = Title
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
            self.serviceDelegate?.getErrorDeleteAddress(errorMessage: errMessage)
        }
    }
    
    init(){
        self.connection.delegate = self
    }
    
}
protocol DeleteAddressServiceDelegate {
    func getResponse(response : AddAddressResponse)
    func getErrorDeleteAddress(errorMessage : String)
}
