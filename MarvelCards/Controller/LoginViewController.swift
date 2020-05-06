//
//  HomeViewController.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 04/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class LoginViewController:UIViewController, UINavigationControllerDelegate {
    let loginView = LoginView()
    var gestureRecognizer:UITapGestureRecognizer!
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(red: 224/255, green: 32/255, blue: 48/255, alpha: 1)
       
        loginView.addAllElementsInViewController(self.view)
        
        loginView.loginButton.addTarget(self, action: #selector(btnLoginTapped), for: .touchUpInside)
        
        gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(createAccountTapped))
        
        loginView.createAccountLabel.addGestureRecognizer(gestureRecognizer)
    
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

//        self.navigationController?.pushViewController(createAccountViewController, animated: true)
        print("???")
//        createAccountViewController.modalPresentationStyle = .currentContext
//        self.navigationController?.pushViewController(createAccountViewController, animated: true)
//        self.present(createAccountViewController, animated: true)
      

    }
}
