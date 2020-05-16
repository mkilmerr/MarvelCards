//
//  HeroByIDViewController.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 15/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit
import SDWebImage
class HeroByIDViewController:ReusableViewController<HeroByIdView>{
    
    
    var heroInfo:CharactersModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.delegate = self
        
        customView.setHero()
        
    }
    
}

extension HeroByIDViewController:HeroByIdDelegate{
    func setHeroData(hero: CharactersModel?) {
        customView.setHeroInfo(info: heroInfo)
    }
    
   
    
    
    
}
