//
//  HomeView.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 09/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

protocol HomeDelegate:class{
    func throwViewsControllers(heroes:UIViewController,comics:UIViewController)
}
class HomeView:ReusableView{
    
    weak var delegate:HomeDelegate?
    override func setViews() {
        backgroundColor = .red
        
       
               
        
    }
}


extension HomeView{
    func createTabBarAndNavItems(_ viewController:UIViewController, title:String,imageName:String) -> UIViewController{
        
        let navigationController = UINavigationController(rootViewController: viewController)
        
        navigationController.navigationBar.prefersLargeTitles = true
        
        viewController.navigationItem.title = title
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(named: imageName)
        
        
        return navigationController
        
    }
}

extension HomeView{
    
}
