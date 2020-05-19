//
//  HomeViewController.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 08/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class HomeViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        let comicsViewController = creteTabBarAndNavItems(viewController: ComicsViewController(), title: "Comics", imageName: "comics")
        
        let heroesViewController = creteTabBarAndNavItems(viewController: HeroesViewController(), title: "Heroes", imageName: "heroes")
    
        let profileViewController = creteTabBarAndNavItems(viewController: UIViewController(), title: "Profile", imageName: "profile")
        
       
        
        viewControllers = [
            comicsViewController,
           heroesViewController,
           profileViewController
           
        ]
        selectedIndex = 0
        
      
    }
    
    
   
    func creteTabBarAndNavItems(viewController: UIViewController, title:String, imageName:String) -> UIViewController{
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.prefersLargeTitles = true
        

        viewController.navigationItem.title = title
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(named: imageName)
       
       
        return navigationController
        
    }


}
