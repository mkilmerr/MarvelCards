//
//  StoriesModel.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 05/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import Foundation


struct Stories:Decodable{
    let available:Int?
    let collectionURI:String?
    let items:[ItemsType]?
    let returned:Int?
    
}

