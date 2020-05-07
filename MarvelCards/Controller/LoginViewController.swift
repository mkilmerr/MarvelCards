//
//  HomeViewController.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 04/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class LoginViewController:UIViewController{
    let loginView = LoginView()
    var gestureRecognizer:UITapGestureRecognizer!
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(red: 224/255, green: 32/255, blue: 48/255, alpha: 1)
       
        loginView.addAllElementsInViewController(self.view)
        
        loginView.loginButton.addTarget(self, action: #selector(btnLoginTapped), for: .touchUpInside)
        
        gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(createAccountTapped))
        
        loginView.createAccountLabel.addGestureRecognizer(gestureRecognizer)
    
        loginView.emailTextField.delegate = self
        loginView.passwordTextField.delegate = self
//        dismiss(animated: true) {
//            print("ooooo")
//            self.navigationController?.navigationBar.isHidden = true
//        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = true
    }
    
    @objc func btnLoginTapped(){
        print("tapped")
    }
    
    @objc func createAccountTapped(){
      
        let createAccountViewController = CreateAccountViewController()
        self.navigationController?.pushViewController(createAccountViewController, animated: true)
        navigationController?.navigationBar.isHidden = false
    }
}

extension LoginViewController:UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // return NO to disallow editing.
        print("TextField should begin editing method called")
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        // became first responder
        print("TextField did begin editing method called")
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
        if let email = loginView.emailTextField.text{
            if let password = loginView.passwordTextField.text {
                print(email)
                print(password)
            }
        }
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
        print("TextField did end editing method called")
    }

    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        // if implemented, called in place of textFieldDidEndEditing:
        print("TextField did end editing with reason method called")
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // return NO to not change text
        print("While entering the characters this method gets called")
        return true
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        // called when clear button pressed. return NO to ignore (no notifications)
        print("TextField should clear method called")
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // called when 'return' key pressed. return NO to ignore.
        self.view.endEditing(true)
        // may be useful: textField.resignFirstResponder()
        return true
    }
}
