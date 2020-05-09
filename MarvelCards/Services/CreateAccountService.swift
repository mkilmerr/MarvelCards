//
//  CreateAccountService.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 07/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class CreateAccountService {
    static let shared = CreateAccountService()
    var ref: DatabaseReference!
    
    func createAccount(email:String, password:String, name:String, completion: @escaping(User?, Error?)->()){
      
        self.ref = Database.database().reference()
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error != nil {
                completion(nil,error)
                return
            }else{
                print(type(of: user?.user))
                self.ref.child("users").child((user?.user.uid)!).setValue(["name":name, "email":email])
                completion(user?.user,nil)
            }
        }
        
    }
}

/*
 self.ref.child("users").child(user.uid).setValue(["username": username])

 */
