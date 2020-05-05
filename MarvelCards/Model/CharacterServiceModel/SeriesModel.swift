//
//  SeriesModel.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 05/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import Foundation


struct Series:Decodable{
    let available:Int?
    let collectionURI:String?
    let returned:Int?
    let items:[Items]?
}
