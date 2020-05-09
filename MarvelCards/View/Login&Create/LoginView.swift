//
//  LoginViewTest.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 09/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

protocol LoginViewDelegate: class {
    func didTapLoginButton(email:UITextField,password:UITextField)
    func didTapCreateAccount()
}

class LoginView: ReusableView,UITextFieldDelegate {
    var gestureRecognizer:UITapGestureRecognizer!
    weak var delegate: LoginViewDelegate?
    
    //MARK:- UI Elements
    
    lazy var loginLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 38)
        label.font = UIFont.loginAndCreateLabel
        label.textColor = UIColor.white
        label.text = "Log in"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var emailTextField:UITextField = {
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
    
    
    lazy var passwordTextField:UITextField = {
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
    
    
    
    lazy var loginButton:UIButton = {
        let btn = UIButton()
        btn.setTitle("Login", for: .normal)
        btn.backgroundColor = UIColor.black
        
        btn.layer.cornerRadius = 18
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
        
    }()
    
    lazy var dontHaveAnAccountLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "Dont have an account?"
        lbl.font = UIFont.init(name: "Arial Rounded MT Bold", size: 15)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var createAccountLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "CREATE"
        lbl.font = UIFont.init(name: "Arial Rounded MT Bold", size: 15)
        lbl.textColor = .white
        lbl.isUserInteractionEnabled = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    override func setViews() {
        super.setViews()
        
        self.backgroundColor =  UIColor(red: 224/255, green: 32/255, blue: 48/255, alpha: 1)
        addSubview(loginLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(dontHaveAnAccountLabel)
        addSubview(createAccountLabel)
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        
      gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapCreateAccount))
        
        createAccountLabel.addGestureRecognizer(gestureRecognizer)

        
        
    }
    
    
    override func layoutViews() {
        super.layoutViews()
        loginLabelConstraints()
        emailTextFieldConstraints()
        passwordTextFieldConstraints()
        buttonLoginConstraints()
        dontHaveAnAccountConstraints()
        createAccountConstraints()
        
    }
    

    
   
    
}

//MARK:- Constraints Methods
private extension LoginView{
    
    func loginLabelConstraints(){
           loginLabel.topAnchor.constraint(equalTo: topAnchor, constant: 140).isActive = true
           loginLabel.centerXAnchor.constraint(equalTo:centerXAnchor).isActive = true
           
       }
       
    
    func emailTextFieldConstraints(){
        emailTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 90).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo:centerXAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo:widthAnchor, constant: -40).isActive = true
    }
    
    func passwordTextFieldConstraints(){
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo:widthAnchor, constant: -40).isActive = true
    }
    
    func buttonLoginConstraints(){
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 60).isActive = true
        loginButton.widthAnchor.constraint(equalTo:widthAnchor, constant: -100).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        loginButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func dontHaveAnAccountConstraints(){
      
        dontHaveAnAccountLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -20).isActive = true
        dontHaveAnAccountLabel.topAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
    }
    
    func createAccountConstraints(){
        
        
        createAccountLabel.leadingAnchor.constraint(equalTo: dontHaveAnAccountLabel.leadingAnchor, constant: 170).isActive = true
        createAccountLabel.bottomAnchor.constraint(equalTo: dontHaveAnAccountLabel.bottomAnchor).isActive = true
    }
    
   
    
}

//MARK:- Protocol-Delegate Methods
private extension LoginView {
    @objc func didTapLoginButton() {
        delegate?.didTapLoginButton(email: emailTextField, password: passwordTextField)
    }
    
    @objc func didTapCreateAccount(){
        delegate?.didTapCreateAccount()
    }
    
    
}
