//
//  ComicByHeroID.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 16/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import Foundation


struct ComicByHeroID:Decodable{
    var code:Int?
    var status:String?
    var copyrigh:String?
    var attributionText:String?
    var attributionHTML:String?
    var etag:String?

    
}




/*
 "code": 200,
 "status": "Ok",
 "copyright": "© 2020 MARVEL",
 "attributionText": "Data provided by Marvel. © 2020 MARVEL",
 "attributionHTML": "<a href=\"http://marvel.com\">Data provided by Marvel. © 2020 MARVEL</a>",
 "etag": "c212372e140ec3caa3169aff9855e533ee19c8b4",
 "data": {
     "offset": 0,
     "limit": 20,
     "total": 12,
     "count": 12,
     "results": [
 */
