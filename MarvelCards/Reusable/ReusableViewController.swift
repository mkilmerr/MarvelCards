//
//  ViewController.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 09/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class ReusableViewController<View:ReusableView>:UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = View()
    }
    var customView: View {
        return view as! View
    }
}
