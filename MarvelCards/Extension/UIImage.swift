//
//  UIImage.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 13/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit


extension UIImageView{
    
    static func heroesThumbnailImage(width:CGFloat, height:CGFloat)->UIImageView{
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.widthAnchor.constraint(equalToConstant: width).isActive = true
        img.heightAnchor.constraint(equalToConstant: height).isActive = true
        img.clipsToBounds = true
        
        img.layer.cornerRadius = 22
        
        img.translatesAutoresizingMaskIntoConstraints = false
       
        img.contentMode = .scaleAspectFill
        
        return img
    }
}
