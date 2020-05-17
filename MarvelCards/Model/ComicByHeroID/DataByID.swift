//
//  DataByID.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 16/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import Foundation

struct DataByID:Decodable {
    var offset:Int?
    var limit:Int?
    var total:Int?
    var count:Int?
    var results:[ResultsByID]?
}

/*
 "data": {
 "offset": 0,
 "limit": 20,
 "total": 12,
 "count": 12,
 "results": [
 */
