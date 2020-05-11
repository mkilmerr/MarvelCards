//
//  HeroesViewCell.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 09/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class HeroesViewCell:UICollectionViewCell{
 
    let heroName:UILabel = .labelDefault(title:"hero name",fontSize:18)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 16
        clipsToBounds = true
        
        backgroundColor = .mainBackground
       
        addSubview(heroName)
        
        let stackView = UIStackView(arrangedSubviews:[heroName])
        
        addSubview(stackView)
        
        self.autoLayoutConstraints(stackView)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeroesViewCell{
    
    func autoLayoutConstraints(_ stackView:UIStackView){
        
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 50).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        
    }
}

/*
 
 layer.cornerRadius = 16
 clipsToBounds = true
 
 
 
 let stackView = UIStackView(arrangedSubviews: [nameHero])
 stackView.translatesAutoresizingMaskIntoConstraints = false
 stackView.axis = .horizontal
 stackView.spacing = 16
 stackView.alignment = .center
 
 addSubview(stackView)
 self.autoLayoutConstraints(stackView)
 */
