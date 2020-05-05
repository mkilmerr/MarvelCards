//
//  CharactersServiceRaw.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 04/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import Foundation

class CharactersServiceRaw{
    let api = "https://gateway.marvel.com/v1/public/characters?ts=1588624095&apikey=80d85d645cb9fdbe9ac5be7b3d90f2e6&hash=ba9d8a63b034a1969a0930afc5da505a"
    
    static let shared = CharactersServiceRaw()
    
    func fetchCharactersWithLimit(limit:Int){
        guard let url = URL(string: api) else{return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                return
            }
                guard let dataReceive = data else{return}
            
            do{
                let character = try JSONDecoder().decode(CharactersModel.self, from: dataReceive)
                print(character)
            }catch{
                return
            }

            
        }.resume()
        
        
    }
}
