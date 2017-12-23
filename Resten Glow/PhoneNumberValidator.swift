//
//  PhoneNumberValidator.swift
//  Resten Glow
//
//  Created by bilal on 02/11/2017.
//  Copyright © 2017 bilal. All rights reserved.
//

import Foundation
import UIKit
extension RegisterController {

// MARK: - phone number formatting

    func formatPhoneNumber(_ sender : CustomTextField) {
    // this value is determined when textField shouldChangeCharactersInRange is called on a phone
    // number cell - if a user is deleting characters we don't want to try to format it, otherwise
    // using the current logic below certain deletions will have no effect
    if !self.shouldAttemptFormat {
        return
    }
    
    // here we are leveraging some of the objective-c NSString functions to help parse and modify
    // the phone number... first we strip anything that's not a number from the textfield, and then
    // depending on the current value we appen5d formatting characters to make it pretty
    let currentValue: NSString = sender.text! as NSString
    let strippedValue : NSString = currentValue.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression , range: NSMakeRange(0, currentValue.length)) as NSString
       var formattedString: NSString = ""
    if strippedValue.length == 0 {
        formattedString = "";
    }
    else if strippedValue.length < 3 {
        formattedString = "(" + (strippedValue as String) as NSString
    }
    else if strippedValue.length == 3 {
        formattedString = "(" + (strippedValue as String) + ") " as NSString
    }
    else if strippedValue.length < 6 {
        formattedString = "(" + strippedValue.substring(to: 3) + ") " + strippedValue.substring(from: 3) as NSString
    }
    else if strippedValue.length == 6 {
        formattedString = "(" + strippedValue.substring(to: 3) + ") " + strippedValue.substring(from: 3) + "-" as NSString
    }
    else if strippedValue.length <= 10 {
        formattedString = "(" + strippedValue.substring(to: 3) + ") " + strippedValue.substring(with: NSMakeRange(3, 3)) + "-" + strippedValue.substring(from: 6) as NSString
    }
    else if strippedValue.length >= 11 {
        formattedString = "(" + strippedValue.substring(to: 3) + ") " + strippedValue.substring(with: NSMakeRange(3, 3)) + "-" + strippedValue.substring(with: NSMakeRange(6, 4)) as NSString
    }
    sender.text = formattedString as String
}

}
extension EditProfileController {
    
    // MARK: - phone number formatting
    
    func formatPhoneNumber(_ sender : CustomTextField) {
        // this value is determined when textField shouldChangeCharactersInRange is called on a phone
        // number cell - if a user is deleting characters we don't want to try to format it, otherwise
        // using the current logic below certain deletions will have no effect
        if !self.shouldAttemptFormat {
            return
        }
        
        // here we are leveraging some of the objective-c NSString functions to help parse and modify
        // the phone number... first we strip anything that's not a number from the textfield, and then
        // depending on the current value we appen5d formatting characters to make it pretty
        let currentValue: NSString = sender.text! as NSString
        let strippedValue : NSString = currentValue.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression , range: NSMakeRange(0, currentValue.length)) as NSString
        var formattedString: NSString = ""
        if strippedValue.length == 0 {
            formattedString = "";
        }
        else if strippedValue.length < 3 {
            formattedString = "(" + (strippedValue as String) as NSString
        }
        else if strippedValue.length == 3 {
            formattedString = "(" + (strippedValue as String) + ") " as NSString
        }
        else if strippedValue.length < 6 {
            formattedString = "(" + strippedValue.substring(to: 3) + ") " + strippedValue.substring(from: 3) as NSString
        }
        else if strippedValue.length == 6 {
            formattedString = "(" + strippedValue.substring(to: 3) + ") " + strippedValue.substring(from: 3) + "-" as NSString
        }
        else if strippedValue.length <= 10 {
            formattedString = "(" + strippedValue.substring(to: 3) + ") " + strippedValue.substring(with: NSMakeRange(3, 3)) + "-" + strippedValue.substring(from: 6) as NSString
        }
        else if strippedValue.length >= 11 {
            formattedString = "(" + strippedValue.substring(to: 3) + ") " + strippedValue.substring(with: NSMakeRange(3, 3)) + "-" + strippedValue.substring(with: NSMakeRange(6, 4)) as NSString
        }
        sender.text = formattedString as String
    }
    
}
    
