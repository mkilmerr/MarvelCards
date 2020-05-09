//
//  CreateAccountView.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 07/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class CreateAccountView: UIView {
    
    let createAccountLabel:UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 38)
        lbl.font = UIFont.loginAndCreateLabel
        lbl.textColor = .white
        lbl.text = "Create an account"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let emailTextField:UITextField = {
        let txt = UITextField()
        txt.font = UIFont.loginAndCreateTextFieldLabel
        txt.placeholder = "Email"
        txt.borderStyle = UITextField.BorderStyle.roundedRect
        txt.keyboardType = UIKeyboardType.default
        txt.layer.cornerRadius = 30
        txt.returnKeyType = UIReturnKeyType.done
        txt.autocorrectionType = UITextAutocorrectionType.no
        txt.autocapitalizationType = UITextAutocapitalizationType.none
        
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    let nameTextField:UITextField = {
        let txt = UITextField()
        txt.font = UIFont.loginAndCreateTextFieldLabel
        txt.placeholder = "Name"
        txt.borderStyle = UITextField.BorderStyle.roundedRect
        txt.keyboardType = UIKeyboardType.default
        txt.layer.cornerRadius = 30
        txt.returnKeyType = UIReturnKeyType.done
        txt.autocorrectionType = UITextAutocorrectionType.no
        txt.autocapitalizationType = UITextAutocapitalizationType.none
        
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    
    let passwordTextField:UITextField = {
        let txt = UITextField()
        
        txt.font = UIFont.loginAndCreateTextFieldLabel
        txt.placeholder = "Password"
        txt.isSecureTextEntry = true
        txt.keyboardType = UIKeyboardType.default
        txt.borderStyle = UITextField.BorderStyle.roundedRect
        txt.returnKeyType = UIReturnKeyType.done
        txt.layer.cornerRadius = 30
        txt.autocorrectionType = UITextAutocorrectionType.no
        txt.autocapitalizationType = UITextAutocapitalizationType.none
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    let confirmTextField:UITextField = {
        let txt = UITextField()
        
        txt.font = UIFont.loginAndCreateTextFieldLabel
        txt.placeholder = "Confirm Password"
        txt.isSecureTextEntry = true
        txt.keyboardType = UIKeyboardType.default
        txt.borderStyle = UITextField.BorderStyle.roundedRect
        txt.returnKeyType = UIReturnKeyType.done
        txt.autocorrectionType = UITextAutocorrectionType.no
        txt.autocapitalizationType = UITextAutocapitalizationType.none
        txt.layer.cornerRadius = 30
        txt.translatesAutoresizingMaskIntoConstraints = false
        
        return txt
    }()
    
    let createAccountButton:UIButton = {
       let btn = UIButton()
        btn.setTitle("Login", for: .normal)
        btn.backgroundColor = UIColor.black
        
        btn.layer.cornerRadius = 18
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

extension CreateAccountView{
    
    func addAllElementsInCreateAccountController(_ view:UIView){
        self.createAccountLabelConstraints(view)
        self.emailTextFieldConstraints(view)
        self.nameTextFieldConstraints(view)
        self.passwordTextFieldConstraints(view)
        self.confirmPasswordTextFieldConstraints(view)
        self.createAccountButtonConstraints(view)
    }
    
    private func createAccountLabelConstraints(_ view:UIView){
        view.addSubview(createAccountLabel)
        
        createAccountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        createAccountLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 140).isActive = true
    }
    
    
    private func emailTextFieldConstraints(_ view:UIView){
        view.addSubview(emailTextField)
        
        emailTextField.topAnchor.constraint(equalTo: createAccountLabel.bottomAnchor, constant: 50).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalToConstant: view.bounds.size.width - 40).isActive = true
    }
    
    private func nameTextFieldConstraints(_ view:UIView){
        view.addSubview(nameTextField)
        
        nameTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20).isActive = true
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalToConstant: view.bounds.size.width - 40).isActive = true
    }
    
    
    private func passwordTextFieldConstraints(_ view:UIView){
        view.addSubview(passwordTextField)
        
        passwordTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: view.bounds.width - 40).isActive = true
    }
    
    private func confirmPasswordTextFieldConstraints(_ view:UIView){
        view.addSubview(confirmTextField)
        
        confirmTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20).isActive = true
        confirmTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        confirmTextField.widthAnchor.constraint(equalToConstant: view.bounds.width - 40).isActive = true
    }
    
    private func createAccountButtonConstraints(_ view:UIView){
        view.addSubview(createAccountButton)
        
        createAccountButton.widthAnchor.constraint(equalToConstant: view.bounds.size.width - 100).isActive = true
        createAccountButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        createAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        createAccountButton.topAnchor.constraint(equalTo: confirmTextField.bottomAnchor, constant: 60).isActive = true
    }
}
