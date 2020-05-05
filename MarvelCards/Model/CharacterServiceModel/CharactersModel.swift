//
//  CharactersModel.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 04/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import Foundation

struct CharactersModel:Decodable{
    let code:Int?
    let status:String?
    let copyright:String?
    let attributionTex:String?
    let attributionHTML:String?
    let etag:String?
    let data:Data?
    
   
}



