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
                
                if let heroPath = hero.thumbnail?.path, let heroExtension = hero.thumbnail?.extension, let name = hero.name, let numberOfComicsAvaliable = hero.comics?.available{
                    
                    let heroPathHTTPS = "https" + heroPath.dropFirst(4)
                    heroImage.sd_setImage(with: URL(string: "\(heroPathHTTPS).\(heroExtension)"), completed: nil)
                    heroName.text = name
                    numberOfComics.text = String(numberOfComicsAvaliable)
                }
                
            }
            
            
        }
    }
    weak var delegate:HeroByIdDelegate?
    var heroName:UILabel = .labelDefault(title:"hero name",fontSize:18)
    var comicsLabel:UILabel = .labelDefault(title: "Nº Comics : ", fontSize: 17)
    var numberOfComics:UILabel = .labelDefault(title: "number of comics", fontSize: 17)
    var heroImage:UIImageView!
    
    override func setViews() {
        backgroundColor = .white
        //        setHero()
        
        
        heroImage = UIImageView.heroesThumbnailImage(width: 300,height: 300)
        
        
        
        addSubview(heroImage)
        addSubview(heroName)
        addSubview(comicsLabel)
        addSubview(numberOfComics)
        
        
        
        
        
    }
    
    override func layoutViews() {
        heroImageConstraints()
        heroNameConstraints()
        comicLabelConstraints()
        numberOfComicsConstraints()
        
    }
    
    func setHeroInfo(info:CharactersModel?){
        self.hero = info
    }
    
}

fileprivate extension HeroByIdView{
    func heroImageConstraints(){
       
      
        heroName.layer.cornerRadius = 22
        
        heroImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        heroImage.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
    }
    
    func heroNameConstraints(){
        heroName.translatesAutoresizingMaskIntoConstraints = false
        heroName.topAnchor.constraint(equalTo: heroImage.bottomAnchor, constant: 20).isActive = true
//        heroName.leadingAnchor.constraint(equalTo: heroImage.leadingAnchor, constant: 20).isActive = true
        
        heroName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
      
    }
    
    func comicLabelConstraints(){
        comicsLabel.translatesAutoresizingMaskIntoConstraints = false
        comicsLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        comicsLabel.topAnchor.constraint(equalTo: heroName.bottomAnchor, constant: 20).isActive = true
        
//        comicsLabel.translatesAutoresizingMaskIntoConstraints = false
//        comicsLabel.topAnchor.constraint(equalTo: bottomAnchor, constant: 20).isActive = true
//        comicsLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func numberOfComicsConstraints(){
        numberOfComics.translatesAutoresizingMaskIntoConstraints = false
        numberOfComics.leadingAnchor.constraint(equalTo: comicsLabel.leadingAnchor, constant: 100).isActive = true
        numberOfComics.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        numberOfComics.topAnchor.constraint(equalTo: comicsLabel.topAnchor).isActive = true
        
    }
    
    
}

extension HeroByIdView{
    func setHero(){
        delegate?.setHeroData(hero: hero)
    }
}
