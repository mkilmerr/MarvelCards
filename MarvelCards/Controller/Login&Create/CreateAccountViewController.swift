//
//  CreateAccountViewControllerTest.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 09/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit
import Firebase
class CreateAccountViewController:ReusableViewController<CreateAccountView>{
    override func viewDidLoad(){
        super.viewDidLoad()
        
        customView.delegate = self
        navigationController?.navigationBar.isHidden = false
    }
}


extension CreateAccountViewController:CreateAccountDelegate{
    func didTapCreateAccountButton(password: UITextField, confirmPassword: UITextField, name: UITextField, email: UITextField) {
        
        guard let passwordText = password.text else{return}
        guard let confirmPasswordText = confirmPassword.text else{return}
        guard let nameText = name.text else{return}
        guard let emailText = email.text else{return}
        
        if emailText.isEmpty{
            print("email filed not fill")
            return
        }
        
        if nameText.isEmpty {
            print("name field not fill")
            return
        }
        
        if passwordText.isEmpty || passwordText.count<6{
            print("password filed not fill correct")
            return
        }
        if confirmPasswordText.isEmpty || confirmPasswordText.count<6{
            print("confirm password not fill correct")
            return
        }
        
        if (passwordText == confirmPasswordText) && (!passwordText.isEmpty){
            self.createAccount(email: emailText, name: nameText, password: passwordText)
        }
        
    }
    
}

extension CreateAccountViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return true
    }
}

extension CreateAccountViewController{

    func createAccount(email:String,name:String ,password:String){
        CreateAccountService.shared.createAccount(email: email, password: password, name: name) { (user, error) in
            if user != nil {
                let homeViewController = HomeViewController()
                homeViewController.modalPresentationStyle = .currentContext
                self.present(homeViewController,animated: true)
            }
        }
    }
}


