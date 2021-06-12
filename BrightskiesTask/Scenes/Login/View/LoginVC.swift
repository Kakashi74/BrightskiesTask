//
//  LoginVC.swift
//  BrightskiesTask
//
//  Created by Ahmed on 6/8/21.
//  Copyright © 2021 eramint.com. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTF : UITextField!
    @IBOutlet weak var passwordTF : UITextField!
    @IBOutlet var allTextFields : [UITextField]!
    var presenter : LoginPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.HideKeyboard()
        presenter = LoginPresenter()
        presenter?.attachView(view: self)
        
        #if DEBUG
        emailTF.text = ""
        passwordTF.text = ""
        #endif
    }
    
    @IBAction func showHidePassButton(_ sender: UIButton) {
        if sender.isSelected == true {
            sender.isSelected = false
            self.passwordTF.isSecureTextEntry = false
            sender.setImage(UIImage(named: "unlockPass"), for: .normal)
        }else{
            sender.isSelected = true
            self.passwordTF.isSecureTextEntry = true
            sender.setImage(UIImage(named: "lockPass"), for: .normal)
        }
    }
    
    @IBAction func LoginBtnPressed(_ sender: Any){
        for textField in self.allTextFields where textField.text!.isEmpty {
            textField.shake()
            return
        }
        
        presenter?.ValidateUser(email: emailTF.text!, pass: passwordTF.text!)
    }
    
}
