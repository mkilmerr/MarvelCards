//
//  CreateAccountViewController.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 06/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
   let createAccountView = CreateAccountView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createAccountView.addAllElementsInCreateAccountController(self.view)
        
        self.view.backgroundColor = UIColor(red: 224/255, green: 32/255, blue: 48/255, alpha: 1)
        
        createAccountView.emailTextField.delegate = self
        createAccountView.nameTextField.delegate = self
        createAccountView.passwordTextField.delegate = self
        createAccountView.confirmTextField.delegate = self

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        

    }


}

extension CreateAccountViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let isEmpty = self.verifyIfFieldsAreEmpty(email: createAccountView.emailTextField, name: createAccountView.nameTextField, password: createAccountView.passwordTextField, confirmPassword: createAccountView.confirmTextField)
             
             print(isEmpty)
        
        let samePassword = self.samePasswordAndConfirmPassword(password: createAccountView.passwordTextField, confirmPassword: createAccountView.confirmTextField)
        
        if samePassword {
            if let email = createAccountView.emailTextField.text, let password = createAccountView.passwordTextField.text, let confirmPassword = createAccountView.confirmTextField.text{
               
                CreateAccountService.shared.createAccount(email: email, password: password)
            }
        }
        return true
        
     
    }
    
    
    func samePasswordAndConfirmPassword(password:UITextField, confirmPassword:UITextField) -> Bool{
        if let passwordText = password.text{
            if let confirmPasswordText = confirmPassword.text{
                if passwordText != confirmPasswordText{
                    return false
                }else{
                    return true
                }
            }
        }
        
        return Bool()
    }
    
    func verifyIfFieldsAreEmpty(email:UITextField, name:UITextField, password:UITextField, confirmPassword:UITextField) -> Bool{
        if email.text!.isEmpty && name.text!.isEmpty && password.text!.isEmpty && confirmPassword.text!.isEmpty{
            return false
        }else{
            return true
        }
    }
}
