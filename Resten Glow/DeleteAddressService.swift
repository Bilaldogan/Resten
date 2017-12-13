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
        
//        if let Message = path4["Message"].element?.text {
//            if Message == "Daha önce adres eklenmemiştir." {
//                if  self.serviceDelegate != nil {
//                    self.serviceDelegate?.getResponse(response: responseData)
//                    return
//                }
//            }
//            responseData.meesage = Message
//        }
//
//        if let Error = path4["Error"].element?.text {
//            responseData.error = Error
//        }
//
//        for address in result["AddressVM"].all {
//            var userAddress = UserAddress()
//
//            if address["Id"].element?.text != nil{
//                guard let id = address["Id"].element?.text else {
//                    print("address address id Error...")
//                    return
//                }
//                userAddress.Id = id
//            }
//
//            if address["Description"].element?.text != nil{
//                guard let description = address["Description"].element?.text else {
//                    print("address address id Error...")
//                    return
//                }
//                userAddress.Description = description
//            }
//
//            if address["Description"].element?.text != nil{
//                guard let description = address["Description"].element?.text else {
//                    print("address address id Error...")
//                    return
//                }
//                userAddress.Description = description
//            }
//            responseData.addressList.append(userAddress)
//        }
//
        
        
        
        
        
        if  self.serviceDelegate != nil {
            //self.serviceDelegate?.getResponse(response: responseData)
        }
        
    }
    
    func getError(errMessage: String) {
        if  self.serviceDelegate != nil {
           // self.serviceDelegate?.getError(errorMessage: errMessage)
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
