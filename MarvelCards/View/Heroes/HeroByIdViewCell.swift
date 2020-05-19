//
//  HeroByIdViewCell.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 18/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit
import SDWebImage

class HeroByIdViewCell:UICollectionViewCell{
    
    var comics:ResultsByID?{
        didSet{
            
            if let path = comics?.thumbnail?.path, let pathExtension = comics?.thumbnail?.extension, let comicTitle = comics?.title{
                 let pathHttps = "https" + path.dropFirst(4)
                comicThumbnail.sd_setImage(with: URL(string: "\(pathHttps).\(pathExtension)"), completed: nil)
                comicName.text = comicTitle
            }

        }
    }
    let comicThumbnail:UIImageView = .heroesThumbnailImage(width: 100, height: 100)
    let comicName:UILabel = .labelDefault(title: "title", fontSize: 14, numberOfLines: 0)

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(comicThumbnail)
        comicThumbnail.layer.cornerRadius = 8
        
        addSubview(comicName)
        comicNameConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func comicNameConstraints(){
        comicName.translatesAutoresizingMaskIntoConstraints = false
        comicName.adjustsFontSizeToFitWidth = true
               comicName.minimumScaleFactor = 0.5
        comicName.topAnchor.constraint(equalTo: comicThumbnail.bottomAnchor, constant: 10).isActive = true
        comicName.widthAnchor.constraint(equalTo: comicThumbnail.widthAnchor, constant: 10).isActive = true
        
        
    }
}
