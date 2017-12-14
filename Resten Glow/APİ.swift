//
//  APİ.swift
//  NuPrive
//
//  Created by Baran on 11.11.2017.
//  Copyright © 2017 CaWeb. All rights reserved.
//

import Foundation

enum API : String {
    case baseURL = "http://servis.restandglow.com/RestenGlowService.asmx?op="

    case loginURL = "LoginService"
    case registerURL = "RegisterService"
    case getByMemberURL = "GetByMemberService"
    case updateProfile = "UpdateProfilService"
    case categoryListURL = "CategoryList"
    case productListURL = "ProductList"
    case productDetailURL = "ProductDetail"
    case additionalProductURL = "AdditionalProduct"
    case addressList = "UserAddressListService"
    case addAddress = "AddAddressService"
    case deleteAddress = "DeleteAddress"
    case updatePassword = "UpdatePassService"
}

enum ADMIN : String {
    case AdminEmail = "RestenGlowDevs"
    case AdminPass = "5N2Zt6vc"
}
