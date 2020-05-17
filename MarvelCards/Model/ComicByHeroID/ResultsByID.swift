//
//  ResultsByID.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 16/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import Foundation

struct ResultsByID:Decodable {
    var id:Int?
    var digitalId:Int?
    var title:String?
    var issueNumber:Int?
    var variantDescription:String?
    var description:String?
    var modified:String?
    var isbn:String?
    var upc:String?
    var diamondCode:String?
    var ean:String?
    var issn:String?
    var format:String?
    var pageCount:Int?
    var textObjects:[TextObjectByID]?
    var resourceURI:String?
    var urls:[URLBydID]?
    var series:SeriesByID?
    var variants:[ComicSummary]?
    var collections:[ComicSummary]?
    var ollectedIssues:[ComicSummary]?
    var dates:[ComicDate]?
    var prices:[ComicPrice]?
    var thumbnail:ComicThumbnail?
    var images:[ComicThumbnail]?
    var creators:ComicCreators?
    var characters:ComicCharacters?
    var stories:ComicStories?
    var events:ComicEvents?
    
    
    
}

struct SeriesByID:Decodable {
    var resourceURI:String?
    var name:String?
}

struct ComicSummary:Decodable {
    var  resourceURI:String?
    var  name:String?
    var role:String?
    
}

struct ComicDate:Decodable{
    var type:String?
    var date:String?
}

struct ComicPrice:Decodable {
    var type:String?
    var price:Double?
}

struct ComicThumbnail:Decodable {
    var path:String?
    var `extension`:String?
}

struct ComicCreators:Decodable {
    var available:Int?
    var collectionURI:String?
    var items:[ComicItems]?
    var returned:Int?
    
}

struct ComicItems:Decodable {
    var resourceURI:String?
    var name:String?
    var role:String?
}

struct ComicCharacters:Decodable {
    var available:Int?
    var collectionURI:String?
    var items:[SeriesByID]?
    var returned:Int?
}

struct ComicStories:Decodable {
    var available:Int?
    var collectionURI:String?
    var items:[ComicItemsWithType]?
    var returned:Int?
}

struct ComicItemsWithType:Decodable {
    var resourceURI:String?
    var name:String?
    var type:String?
    
}

struct ComicEvents:Decodable {
    var available:Int?
    var collectionURI:String?
    var items:[SeriesByID]?
    var returned:Int?
    
}


