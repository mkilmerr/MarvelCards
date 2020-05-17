//
//  ComicByIDService.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 16/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import Foundation

class ComicByIDService{
    
    static let shared = ComicByIDService()
    
    func fetchComicByID(id:Int,completion: @escaping(ComicByHeroID?,Error?)->()){
        
        let urlWithId = "https://gateway.marvel.com/v1/public/characters/1011334/comics?ts=1588624095&apikey=80d85d645cb9fdbe9ac5be7b3d90f2e6&hash=ba9d8a63b034a1969a0930afc5da505a"
        
        guard let url = URL(string: urlWithId) else{return}
        
        print("URL",url)
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                completion(nil,error)
                return
            }
            
            guard let dataReceive = data else{return}
            
            do{
                let comic = try JSONDecoder().decode(ComicByHeroID.self, from: dataReceive)
                completion(comic,nil)
            }catch{
                completion(nil,error)
                return
            }
        }.resume()
        
    }
}
