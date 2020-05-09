//
//  HeroesViewCell.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 09/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class HeroesViewCell:UITableViewCell{
    let nameHero:UILabel = .labelDefault(title: "Name heroes", fontSize: 18)
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .purple
        
        
        layer.cornerRadius = 22
        clipsToBounds = true
        
        
        
        let stackView = UIStackView(arrangedSubviews: [nameHero])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.alignment = .center
        
        addSubview(stackView)
        self.autoLayoutConstraints(stackView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeroesViewCell{
    
    func autoLayoutConstraints(_ stackView:UIStackView){
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
      
    }
}
