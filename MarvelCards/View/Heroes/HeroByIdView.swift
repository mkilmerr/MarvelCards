//
//  HeroByIdView.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 15/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

protocol HeroByIdDelegate:class{
    func setHeroData(hero:CharactersModel?)
}

class HeroByIdView:ReusableView{
    
    var hero:CharactersModel?{
        didSet{
            for hero in hero!.data!.results!{
                if let heroPath = hero.thumbnail?.path, let heroExtension = hero.thumbnail?.extension, let name = hero.name{
                 let heroPathHTTPS = "https" + heroPath.dropFirst(4)
                 heroImage.sd_setImage(with: URL(string: "\(heroPathHTTPS).\(heroExtension)"), completed: nil)
                 heroName.text = name
                    
                }
                
            }
            
            
        }
    }
    weak var delegate:HeroByIdDelegate?
    var heroName:UILabel = .labelDefault(title:"hero name",fontSize:18)
    var heroImage:UIImageView!
  
    override func setViews() {
        backgroundColor = .white
//        setHero()
      
       
        heroImage = UIImageView.heroesThumbnailImage(width: 100,height: 100)
        
        addSubview(heroImage)
        addSubview(heroName)
        
        heroName.translatesAutoresizingMaskIntoConstraints = false
        heroName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
       
        
    }
    
    override func layoutViews() {
        heroImageConstraints()
         
    }
    
    func setHeroInfo(info:CharactersModel?){
        self.hero = info
    }

}

fileprivate extension HeroByIdView{
    func heroImageConstraints(){
        heroImage.layer.cornerRadius = 22
        heroImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        heroImage.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
    }
}

 extension HeroByIdView{
    func setHero(){
      delegate?.setHeroData(hero: hero)
    }
}
