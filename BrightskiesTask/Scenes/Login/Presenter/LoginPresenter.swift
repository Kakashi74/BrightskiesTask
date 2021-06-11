//
//  LoginPresenter.swift
//  Task
//
//  Created by Ahmed on 5/31/21.
//  Copyright © 2021 eramint.com. All rights reserved.
//

import Foundation

class LoginPresenter {
    
    weak var view: LoginVC?
    init() {
    }
    
    func attachView(view:LoginVC){
        self.view = view
    }
    
    func detachView() {
        view = nil
    }
    
    func ValidateUser(email : String , pass : String){
        let isEmailValid =  Validator.emailValidation(text: email)
        let isPassValid = Validator.passwordValidation(text: pass)
        
        if isEmailValid && isPassValid == true {
            Login(email: email, pass: pass)
        } else {
            if !isEmailValid {
                view?.showAlert(withTitle: "Error", withMessage: "Your Name is not valid")
            }
            if !isPassValid{
                view?.showAlert(withTitle: "Error", withMessage: "Your Password is not valid")
            }
        }
    }
    
    func Login(email: String , pass: String){
        if email == "ahmedshanab74@gmail.com" && pass == "123456Asd"{
            view?.changeRoot(identifire: "TabVC")
        } else {
            view?.showAlert(withTitle: "Error", withMessage: "User Doesn't Match")
        }
         
    }
}
