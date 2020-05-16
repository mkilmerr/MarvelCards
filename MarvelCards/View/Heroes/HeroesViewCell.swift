//
//  HeroesViewCell.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 09/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit
import SDWebImage
class HeroesViewCell:UICollectionViewCell{
    var results:Results!{
        didSet{
            if let heroPath = results.thumbnail?.path, let heroExtension = results.thumbnail?.extension, let name = results.name{
                let heroPathHTTPS = "https" + heroPath.dropFirst(4)
                thumbnail.sd_setImage(with: URL(string: "\(heroPathHTTPS).\(heroExtension)"), completed: nil)
                heroName.text = name
            }
        }
    }
    let heroName:UILabel = .labelDefault(title:"hero name",fontSize:18)

    var thumbnail:UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 16
        clipsToBounds = true
        
        backgroundColor = .black
        addSubview(heroName)
        heroName.textColor = .white
       
        thumbnail = UIImageView.heroesThumbnailImage(width: self.bounds.width, height:self.bounds.height - 30)
        
         addSubview(thumbnail)
        
        heroName.translatesAutoresizingMaskIntoConstraints = false
        heroName.topAnchor.constraint(equalTo: thumbnail.bottomAnchor, constant: 2).isActive = true
        heroName.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        

       

        
        
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
