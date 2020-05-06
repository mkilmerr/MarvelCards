//
//  HomeViewController.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 04/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    let loginView = LoginView()
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(red: 224/255, green: 32/255, blue: 48/255, alpha: 1)
       
        loginView.addAllElementsInViewController(self.view)
        
        loginView.loginButton.addTarget(self, action: #selector(btnLoginTapped), for: .touchUpInside)
        
    }
    
    @objc func btnLoginTapped(){
        print("tapped")
    }
}
