//
//  EventsModel.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 05/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import Foundation


struct Events:Decodable{
    let available:Int?
    let collectionURI:String?
    let items:[Items]?
    let returned:Int?
    
}
