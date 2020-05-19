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
            
            if let path = comics?.thumbnail?.path, let pathExtension = comics?.thumbnail?.extension{
                 let pathHttps = "https" + path.dropFirst(4)
                comicThumbnail.sd_setImage(with: URL(string: "\(pathHttps).\(pathExtension)"), completed: nil)
            }
//
//            for comic in comics!.data!.results!{
//                if let path = comic.thumbnail?.path, let pathExtension = comic.thumbnail?.extension{
//                    
//                    let pathHttps = "https" + path.dropFirst(4)
//                    print("\(pathHttps).\(pathExtension)")
//                    comicThumbnail.sd_setImage(with: URL(string:"\(pathHttps).\(pathExtension)" ), completed: nil)
//                    
//                }
//            }
        }
    }
    let comicThumbnail:UIImageView = .heroesThumbnailImage(width: 100, height: 100)

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        
        addSubview(comicThumbnail)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
