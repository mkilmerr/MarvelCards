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

class LoginView: ReusableView {
    var gestureRecognizer:UITapGestureRecognizer!
    weak var delegate: LoginViewDelegate?
    
    //MARK:- UI Elements
    
    lazy var activityLoading:UIActivityIndicatorView = {
        let act = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        act.hidesWhenStopped = true
        act.translatesAutoresizingMaskIntoConstraints = false
        act.color = .white
        return act
        
    }()
    
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
        txt.returnKeyType = UIReturnKeyType.continue
        txt.autocorrectionType = UITextAutocorrectionType.no
        txt.autocapitalizationType = UITextAutocapitalizationType.none
        txt.backgroundColor = .white
        txt.textColor = .black
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
        txt.backgroundColor = .white
        txt.textColor = .black

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
        
        self.backgroundColor =  .mainBackground
        addSubview(loginLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(dontHaveAnAccountLabel)
        addSubview(createAccountLabel)
        addSubview(activityLoading)
        
        
        
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
        activityLoadingConstraints()
        
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
    
    func activityLoadingConstraints(){
        activityLoading.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20).isActive = true
        activityLoading.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
   
    
}

//MARK:- Protocol-Delegate Methods
private extension LoginView {
    @objc func didTapLoginButton() {
        hideOrNotLoading()
        delegate?.didTapLoginButton(email: emailTextField, password: passwordTextField)
    }
    
    @objc func didTapCreateAccount(){
        delegate?.didTapCreateAccount()
    }
    
    
}

private extension LoginView{
    func hideOrNotLoading(){
        guard let email = emailTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        
        if email.isEmpty || password.isEmpty {
            activityLoading.stopAnimating()
        }else{
            activityLoading.startAnimating()
        }
    }
}


extension LoginView:UITextFieldDelegate{
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
