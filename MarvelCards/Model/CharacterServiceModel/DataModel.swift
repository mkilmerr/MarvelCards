//
//  DataModel.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 05/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import Foundation

struct Data:Decodable{
    let offset:Int?
    let limit:Int?
    let total:Int?
    let count:Int?
    let results:[Results]?
}
