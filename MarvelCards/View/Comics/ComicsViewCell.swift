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
    let comicImage:UIImageView = .heroesThumbnailImage(width: 100, height: 100)
    var results:ResultsByID?{
        didSet{
            if let comicPath = results?.thumbnail?.path, let comicExtension = results?.thumbnail?.extension{
                
                let comicPathHttps = "https" + comicPath.dropFirst(4)
                comicImage.sd_setImage(with: URL(string: "\(comicPathHttps).\(comicExtension)"), completed: nil)
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .mainBackground
    
        addSubview(comicImage)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
