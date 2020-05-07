//
//  CreateAccountViewController.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 06/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
   let createAccountView = CreateAccountView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createAccountView.addAllElementsInCreateAccountController(self.view)
        
        self.view.backgroundColor = UIColor(red: 224/255, green: 32/255, blue: 48/255, alpha: 1)
        
       


    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        

    }


}
