//
//  LoginViewControllerTest.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 09/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

import FirebaseAuth
class LoginViewController:ReusableViewController<LoginView>{
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = true
    }
    
}


extension LoginViewController:LoginViewDelegate{
    func didTapLoginButton(email: UITextField, password: UITextField) {
        guard let emailText = email.text else{return}
        
        if emailText.isEmpty{
            self.showAlert("Email invalid", "try again")
        }
        guard let passwordText = password.text else{return}
        if passwordText.isEmpty{
            self.showAlert("Password invalid", "try again")
        }
        
        self.loginInAccount(email: emailText, password: passwordText)
        
    }
    
    func didTapCreateAccount() {
        let createAccountView = CreateAccountViewController()
        navigationController?.navigationBar.isHidden = false
        createAccountView.modalPresentationStyle = .currentContext
        self.navigationController?.pushViewController(createAccountView, animated: true)
    }
    
}

extension LoginViewController{
    func loginInAccount(email:String, password:String){
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if user != nil {
                let homeViewController = HomeViewController()
                homeViewController.modalPresentationStyle = .currentContext
                self.present(homeViewController,animated: true)
            }
            
        }
    }
}
extension LoginViewController {
    public func showAlert(_ title:String, _ message:String) {
        let alertVC = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style: .cancel,
            handler: { action -> Void in
        })
        alertVC.addAction(okAction)
        present(
            alertVC,
            animated: true,
            completion: nil)
    }
}
