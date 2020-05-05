//
//  HeaderInfoModel.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 05/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import Foundation


struct HeaderInfos:Decodable{
    let id:Int?
    let name:String?
    let description:String?
    let modified:String?
    let thumbnail:Thumbnail?
}
