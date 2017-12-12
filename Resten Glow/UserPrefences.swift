//
//  UserPrefences.swift
//  NuPrive
//
//  Created by Baran on 13.11.2017.
//  Copyright © 2017 CaWeb. All rights reserved.
//

import Foundation
class UserPrefence {
    static let userDefaults = UserDefaults.standard
    
    static func setUserMail(mail : String) {
        self.userDefaults.setValue(mail, forKey: self.mail)
    }
    static func getUserMail() -> String {
        if let mail = userDefaults.value(forKeyPath: self.mail) as? String {
            return mail
        }
        return ""
    }
    static func removeUserMail(){
        UserDefaults.standard.removeObject(forKey: self.mail)
    }
    
    static func setUserLoginStatus(isLogin : Bool) {
        self.userDefaults.setValue(isLogin, forKey: isLoginned)
    }
    static func isUserLoginned() -> Bool {
        if let status = userDefaults.value(forKeyPath: isLoginned) as? Bool {
            return status
        }
        return false
    }
    
    static func setUserId(id: String) {
        self.userDefaults.set(id, forKey: userID)
    }
    static func getUserId() -> String {
        if let id = userDefaults.value(forKeyPath: userID) as? String {
            return id
        }
        return ""
    }
    static func removeUserId(){
        UserDefaults.standard.removeObject(forKey: userID)
    }
    
    
    static func setOneSignalId(id: String) {
        self.userDefaults.set(id, forKey: oneSignalUserId)
    }
    static func getOneSignalId() -> String {
        if let id = userDefaults.value(forKeyPath: oneSignalUserId) as? String {
            return id
        }
        return ""
    }
    static func removeoneSignalUserId(){
        UserDefaults.standard.removeObject(forKey: oneSignalUserId)
    }
    
    
    static func removeUserName(){
        UserDefaults.standard.removeObject(forKey: name)
    }
  
    static func setUserName(id: String) {
        self.userDefaults.set(id, forKey: name)
    }
    static func getUserName() -> String {
        if let id = userDefaults.value(forKeyPath: name) as? String {
            return id
        }
        return ""
    }
    static func setUserSurname(surname: String) {
        self.userDefaults.set(surname, forKey: self.surname)
    }
    static func getUserSurname() -> String {
        if let surname = userDefaults.value(forKeyPath: self.surname) as? String {
            return surname
        }
        return ""
    }
    static func setGSM(id: String) {
        self.userDefaults.set(id, forKey: gsm)
    }
    static func getGSM() -> String {
        if let id = userDefaults.value(forKeyPath: gsm) as? String {
            return id
        }
        return ""
    }
    static func removeGSM(){
        UserDefaults.standard.removeObject(forKey: gsm)
    }
    
    
    private static let gsm = "gsm"
    private static let name = "name"
    private static let surname = "surname"
    private static let mail = "userMail"
    private static let password = "userPassword"
    private static let isLoginned = "isLoginned"
    private static let userID = "userID"
    private static let oneSignalUserId = "oneSignalUserId"
 
}
