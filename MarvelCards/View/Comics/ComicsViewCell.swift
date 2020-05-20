//
//  ComicsViewCell.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 19/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit
import SDWebImage

class ComicsViewCell:UICollectionViewCell{
    var comicImage:UIImageView!
    let comicTitle:UILabel = .labelDefault(title: "title", fontSize: 14, numberOfLines: 0)
    var results:ResultsByID?{
        didSet{
            if let comicPath = results?.thumbnail?.path, let comicExtension = results?.thumbnail?.extension, let title = results?.title{
                
                let comicPathHttps = "https" + comicPath.dropFirst(4)
                comicImage.sd_setImage(with: URL(string: "\(comicPathHttps).\(comicExtension)"), completed: nil)
                comicTitle.text = title
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        comicImage = .heroesThumbnailImage(width:self.bounds.width, height: self.bounds.height - 30 )
        
        addSubview(comicImage)
        addSubview(comicTitle)
        
        
        
        comicTitle.adjustsFontSizeToFitWidth = true
        comicTitle.minimumScaleFactor = 0.5
        comicTitle.translatesAutoresizingMaskIntoConstraints = false
        comicTitle.topAnchor.constraint(equalTo: comicImage.bottomAnchor, constant: 2).isActive = true
        comicTitle.center  = center
        comicTitle.backgroundColor = .black
        comicTitle.textColor = .white
        comicTitle.layer.cornerRadius = 20
        comicTitle.widthAnchor.constraint(equalTo: widthAnchor, constant: 10).isActive = true
        //        comicTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
