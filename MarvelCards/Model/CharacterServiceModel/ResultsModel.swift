//
//  ResultsModel.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 05/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import Foundation


struct Results:Decodable{
    let id:Int?
    let name:String?
    let description:String?
    let modified:String?
    let thumbnail:Thumbnail?
    let comics:Comics?
    let series:Series?
    let events:Events?
    let urls:[URLS]?
    
}
