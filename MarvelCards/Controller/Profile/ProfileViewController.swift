//
//  ProfileViewController.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 20/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit
import FirebaseAuth

class ProfileViewController:ReusableViewController<ProfileView>{
    override func viewDidLoad() {
        super.viewDidLoad()
        print("GOL")
        
        if Auth.auth().currentUser != nil {
            print( "EMAIL OF CURRENT USER",Auth.auth().currentUser?.email)
        }
    }
}
