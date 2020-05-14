//
//  HeroesViewController.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 09/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class HeroesViewController: ReusableVerticalCollectionView<HeroesView>, UISearchControllerDelegate{
    let cellID = "CELL_ID"
    var count:Int = 0
    var isSearch:Bool = false
    var heroIndex:Int = 0
    
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
    fileprivate lazy var indicator:UIActivityIndicatorView = {
        let ind = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        ind.hidesWhenStopped = true
        return ind
    }()
    
    var results = [Results]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.definesPresentationContext = true
        view.addSubview(indicator)
        indicator.startAnimating()
        indicator.center = view.center
        
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        searchController.delegate = self
        searchController.searchBar.delegate = self
        
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

extension HeroesViewController:UISearchResultsUpdating,UISearchBarDelegate{
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        if let searchText = searchBar.text{
            self.filterContentForSearchText(searchText)
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("begin")
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.isSearch = false
        self.collectionView.reloadData()
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filterContentForSearchText(searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.isSearch = false
        self.collectionView.reloadData()
    }
    
    func filterContentForSearchText(_ searchText:String){
        
        for hero in 1..<self.count{
            if self.results[hero].name! == searchText || self.results[hero].name!.contains(searchText){
                print(self.results[hero].name!)
                print(self.results[hero])
                self.isSearch = true
                self.heroIndex = hero
                self.collectionView.reloadData()
                
            }
            
            //            if self.results[hero].name!.contains(searchText){
            //                print(self.results[hero].name!)
            //            }
            
            
        }
        
    }
    
}
/*
 filteredCandies = candies.filter { (candy: Candy) -> Bool in
 return candy.name.lowercased().contains(searchText.lowercased())
 }
 
 tableView.reloadData()
 */

extension HeroesViewController:UICollectionViewDelegateFlowLayout{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isSearch{
            
            return 1
        }
        return self.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! HeroesViewCell
        
        if self.isSearch{
            print(self.results[heroIndex])
            cell.results = self.results[heroIndex]
        }else{
            cell.results = self.results[indexPath.item]
        }
        
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
                            self.indicator.stopAnimating()
                            self.collectionView.reloadData()
                            
                        }
                    }
                    
                }
            }
            
        }
    }
}
