//
//  LoginView.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 05/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class LoginView: UIView,UITextFieldDelegate {
    
    let loginLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 38)
        label.font = UIFont.loginAndCreateLabel
        label.textColor = UIColor.white
        label.text = "Log in"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let emailTextField:UITextField = {
        let txt = UITextField()
        txt.font = UIFont.loginAndCreateTextFieldLabel
        txt.placeholder = "Email"
        txt.borderStyle = UITextField.BorderStyle.roundedRect
        txt.keyboardType = UIKeyboardType.default
        txt.layer.cornerRadius = 30
        txt.returnKeyType = UIReturnKeyType.done
        
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    let seePasswordButton:UIButton = {
        let btn = UIButton(frame: .init(x: 0, y: 0, width: 300, height: 200))
        btn.setTitle("HIDE/SEE", for: .normal)
        
//        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
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
            txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    
    
    let loginButton:UIButton = {
        let btn = UIButton()
        btn.setTitle("Login", for: .normal)
        btn.backgroundColor = UIColor.black
        
        btn.layer.cornerRadius = 18
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
        
    }()
    
    let dontHaveAnAccountLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "Dont have an account?"
        lbl.font = UIFont.init(name: "Arial Rounded MT Bold", size: 15)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let createAccountLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "CREATE"
        lbl.font = UIFont.init(name: "Arial Rounded MT Bold", size: 15)
        lbl.textColor = .white
        lbl.isUserInteractionEnabled = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    @objc func btnLoginTapped(){
        print("tapped")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
}

extension LoginView{
    func addAllElementsInViewController(_ view:UIView){
        self.loginLabelConstraints(view)
        self.emailTextFieldConstraints(view)
        self.passwordTextFieldConstraints(view)
        self.buttonLoginConstraints(view)
        self.dontHaveAnAccountConstraints(view)
        self.createAccountConstraints(view)
        self.setRightButtonInPasswordField(view)
    }
    
    func loginLabelConstraints(_ view:UIView){
        view.addSubview(loginLabel)
        loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 140).isActive = true
        loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    func emailTextFieldConstraints(_ view:UIView){
        view.addSubview(emailTextField)
        
        emailTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 90).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalToConstant: view.bounds.size.width - 40).isActive = true
    }
    
    func passwordTextFieldConstraints(_ view:UIView){
        view.addSubview(passwordTextField)
        
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: view.bounds.width - 40).isActive = true
    }
    
    func buttonLoginConstraints(_ view:UIView){
        view.addSubview(loginButton)
        
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 60).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: view.bounds.size.width - 100 ).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func dontHaveAnAccountConstraints(_ view:UIView){
        view.addSubview(dontHaveAnAccountLabel)
        
        //        dontHaveAnAccountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        dontHaveAnAccountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -20).isActive = true
        dontHaveAnAccountLabel.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
    }
    
    func createAccountConstraints(_ view:UIView){
        view.addSubview(createAccountLabel)
        
        createAccountLabel.leadingAnchor.constraint(equalTo: dontHaveAnAccountLabel.leadingAnchor, constant: 170).isActive = true
        createAccountLabel.bottomAnchor.constraint(equalTo: dontHaveAnAccountLabel.bottomAnchor).isActive = true
    }
    
    func setRightButtonInPasswordField(_ view:UIView){
        view.addSubview(seePasswordButton)
        self.passwordTextField.rightView = seePasswordButton
        self.passwordTextField.rightViewMode = .always
    }
    
}


/*
 
 let sampleTextField =  UITextField(frame: CGRect(x: 20, y: 100, width: 300, height: 40))
 sampleTextField.placeholder = "Enter text here"
 sampleTextField.font = UIFont.systemFont(ofSize: 15)
 sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
 sampleTextField.autocorrectionType = UITextAutocorrectionType.no
 sampleTextField.keyboardType = UIKeyboardType.default
 sampleTextField.returnKeyType = UIReturnKeyType.done
 sampleTextField.clearButtonMode = UITextField.ViewMode.whileEditing
 sampleTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
 sampleTextField.delegate = self
 self.view.addSubview(sampleTextField)
 */
