//
//  Validator.swift
//  Task
//
//  Created by Ahmed on 5/31/21.
//  Copyright © 2021 eramint.com. All rights reserved.
//

import Foundation


struct Validator {
    static func emailValidation(text:String)->Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        guard emailTest.evaluate(with: text )else {
            return false
            
        }
        
        return true
    }
    
    
    
    static func phoneNumberValidation(text:String)-> Bool {
        guard text.count >= 10 else {
            return false
        }
        return true
    }
    
    static func nameValidation(text:String)-> Bool {
        guard text.count >= 3 else {
            return false
        }
        return true
    }
    
    
    static func emptyValidation(text:String)-> Bool {
        guard text.count > 0 else {
            return false
        }
        return true
    }
    
    static func passwordValidation(text:String)-> Bool {
        guard text.count >= 8 else {
            return false
        }
        return true
    }
    
    
}
