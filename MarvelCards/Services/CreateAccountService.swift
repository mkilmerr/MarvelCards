//
//  CreateAccountService.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 07/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import Foundation
import Firebase
class CreateAccountService {
    static let shared = CreateAccountService()
    
    func createAccount(email:String, password:String){
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            print(result as Any)
        }
    }
}
