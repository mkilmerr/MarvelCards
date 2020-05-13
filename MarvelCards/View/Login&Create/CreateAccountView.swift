//
//  CreateAccountViewTest.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 09/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

protocol CreateAccountDelegate:class{
    func didTapCreateAccountButton(password:UITextField, confirmPassword:UITextField, name:UITextField, email:UITextField)
}
class CreateAccountView:ReusableView{
    weak var delegate:CreateAccountDelegate?
    //MARK:- UI Elements
    lazy var createAccountLabel:UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 38)
        lbl.font = UIFont.loginAndCreateLabel
        lbl.textColor = .white
        lbl.text = "Create an account"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var emailTextField:UITextField = {
        let txt = UITextField()
        txt.font = UIFont.loginAndCreateTextFieldLabel
        txt.placeholder = "Email"
        txt.borderStyle = UITextField.BorderStyle.roundedRect
        txt.keyboardType = UIKeyboardType.default
        txt.layer.cornerRadius = 30
        txt.returnKeyType = UIReturnKeyType.continue
        txt.autocorrectionType = UITextAutocorrectionType.no
        txt.autocapitalizationType = UITextAutocapitalizationType.none
        txt.backgroundColor = .white
        txt.textColor = .black
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    lazy var nameTextField:UITextField = {
        let txt = UITextField()
        txt.font = UIFont.loginAndCreateTextFieldLabel
        txt.placeholder = "Name"
        txt.borderStyle = UITextField.BorderStyle.roundedRect
        txt.keyboardType = UIKeyboardType.default
        txt.layer.cornerRadius = 30
        txt.returnKeyType = UIReturnKeyType.continue
        txt.backgroundColor = .white
        txt.textColor = .black
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
        txt.returnKeyType = UIReturnKeyType.continue
        txt.layer.cornerRadius = 30
        txt.autocorrectionType = UITextAutocorrectionType.no
        txt.autocapitalizationType = UITextAutocapitalizationType.none
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    lazy var confirmTextField:UITextField = {
        let txt = UITextField()
        
        txt.font = UIFont.loginAndCreateTextFieldLabel
        txt.placeholder = "Confirm Password"
        txt.isSecureTextEntry = true
        txt.keyboardType = UIKeyboardType.default
        txt.borderStyle = UITextField.BorderStyle.roundedRect
        txt.returnKeyType = UIReturnKeyType.continue
        txt.autocorrectionType = UITextAutocorrectionType.no
        txt.autocapitalizationType = UITextAutocapitalizationType.none
        txt.layer.cornerRadius = 30
        txt.translatesAutoresizingMaskIntoConstraints = false
        
        return txt
    }()
    
    lazy var createAccountButton:UIButton = {
        let btn = UIButton()
        btn.setTitle("Create account", for: .normal)
        btn.backgroundColor = UIColor.black
        
        btn.layer.cornerRadius = 18
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    override func setViews() {
        super.setViews()
        self.backgroundColor =  UIColor(red: 224/255, green: 32/255, blue: 48/255, alpha: 1)
        addSubview(createAccountLabel)
        addSubview(emailTextField)
        addSubview(nameTextField)
        addSubview(passwordTextField)
        addSubview(confirmTextField)
        addSubview(createAccountButton)
        
        emailTextField.delegate = self
        nameTextField.delegate = self
        passwordTextField.delegate = self
        confirmTextField.delegate = self
        createAccountButton.addTarget(self, action: #selector(didTapCreateAccountButton), for: .touchUpInside)
    }
    
    override func layoutViews() {
        super.layoutViews()
        createAccountLabelConstraints()
        emailTextFieldConstraints()
        nameTextFieldConstraints()
        passwordTextFieldConstraints()
        confirmPasswordTextFieldConstraints()
        createAccountButtonConstraints()
        
    }
    
}
//MARK:- Constraints Methods

extension CreateAccountView{
    private func createAccountLabelConstraints(){
        
        
        createAccountLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        createAccountLabel.topAnchor.constraint(equalTo: topAnchor, constant: 140).isActive = true
    }
    
    
    private func emailTextFieldConstraints(){
        
        
        emailTextField.topAnchor.constraint(equalTo: createAccountLabel.bottomAnchor, constant: 50).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo:centerXAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo:widthAnchor, constant: -40).isActive = true
    }
    
    private func nameTextFieldConstraints(){
        
        
        nameTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20).isActive = true
        nameTextField.centerXAnchor.constraint(equalTo:centerXAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo:widthAnchor, constant: -40).isActive = true
    }
    
    
    private func passwordTextFieldConstraints(){
        
        
        passwordTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo:widthAnchor,constant: -40).isActive = true
    }
    
    private func confirmPasswordTextFieldConstraints(){
        
        
        confirmTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20).isActive = true
        confirmTextField.centerXAnchor.constraint(equalTo:centerXAnchor).isActive = true
        confirmTextField.widthAnchor.constraint(equalTo:widthAnchor, constant: -40).isActive = true
    }
    
    private func createAccountButtonConstraints(){
        
        
        createAccountButton.widthAnchor.constraint(equalTo: widthAnchor, constant: -100).isActive = true
        createAccountButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        createAccountButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        createAccountButton.topAnchor.constraint(equalTo: confirmTextField.bottomAnchor, constant: 60).isActive = true
    }
}

//MARK:- Protocol-Delegate Methods

extension CreateAccountView{
    @objc func didTapCreateAccountButton(){
        delegate?.didTapCreateAccountButton(password: passwordTextField, confirmPassword: confirmTextField, name: nameTextField, email: emailTextField)
        
    }
}


extension CreateAccountView:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        endEditing(true)
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing")
        endEditing(false)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
        print("Leaving textFieldDidBeginEditing")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("textField")
        print("Leaving textField")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
        print("textField = \(String(describing: textField.text))")
        print("Leaving textFieldDidEndEditing")
    }
}

