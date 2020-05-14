//
//  HeroesViewController.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 09/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class HeroesViewController: ReusableVerticalCollectionView<HeroesView>,UISearchBarDelegate{
    let cellID = "CELL_ID"
    var count:Int = 0
    fileprivate let searchController = UISearchController(searchResultsController: nil)

    var results = [Results]()
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(HeroesViewCell.self, forCellWithReuseIdentifier:cellID)
        self.fetchHeroes()
        self.setupSearchBar()
     
        
    }
    fileprivate func setupSearchBar() {
        definesPresentationContext = true
        navigationController?.navigationBar.tintColor = .black
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = true
        searchController.searchBar.delegate = self
     let textFieldInsideSearchBar = searchController.searchBar.value(forKey: "searchField") as? UITextField
     textFieldInsideSearchBar?.textColor = .black
    }
    
}


extension HeroesViewController:UICollectionViewDelegateFlowLayout{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! HeroesViewCell
        print(indexPath.item)
        cell.results = self.results[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: self.view.bounds.size.width - 10, height: self.view.bounds.size.width)
    }
    
}

extension HeroesViewController{
    fileprivate func fetchHeroes(){
        CharactersServiceRaw.shared.fetchCharactersWithLimit { (heroes, error) in
            if let heroes = heroes {
                if let limit = heroes.data?.limit {
                    DispatchQueue.main.sync {
//                        print(heroes.data?.results!)
                        self.count = limit
                        
                        if let result = heroes.data?.results{
                            self.results.append(contentsOf: result)
                            self.collectionView.reloadData()
                                               }
                        }
                    
                }
            }
           
        }
    }
}
