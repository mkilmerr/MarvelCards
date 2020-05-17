//
//  TextObjectByID.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 16/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import Foundation

struct TextObjectByID:Decodable {
    var type:String?
    var language:String?
    var text:String?
}
