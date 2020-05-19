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
    var offset:Int = 0
    var limit:Int = 100
    var increase:Int = 0
    var indexPathSelected:IndexPath?
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
        
        
        self.fetchAllHeroes()
        self.fetchAllHeroes()
        self.fetchAllHeroes()
        
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

//MARK:-

extension HeroesViewController{
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedIndexPath = self.indexPathSelected
        
        if self.isSearch{
            
            if self.results[selectedIndexPath!.row].id != nil{
                self.selectedSpecificIndexpath(selectedIndexPath!.row, item: nil)
            }
           
        }else{
            if self.results[indexPath.item].id != nil{
            
                self.selectedSpecificIndexpath(nil, item: indexPath.item)
            }
        }
        
    }
    
    func selectedSpecificIndexpath(_ indexPath:Int?, item:Int?){
        var selected: Int?
        if self.isSearch{
          
            selected = self.indexPathSelected!.row
        }else{
           
            selected = item
        }
        
        if let id = self.results[selected!].id{
          
            CharactersServiceMarvel.shared.fetchCharacterById(id: id) { (hero, error) in
                DispatchQueue.main.async {
                    print("HERO ID ->>>>>> \(id)")
                    let heroByID = HeroByIDViewController()
                    heroByID.heroInfo = hero
                    
                    self.present(heroByID,animated: true)
                }
            }
        }
        
     
        
    }

}
//MARK:- Search Methods

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
        
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filterContentForSearchText(searchText)
        
        if searchText.isEmpty{
            self.isSearch = false
            self.collectionView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.isSearch = false
        self.collectionView.reloadData()
    }
    
    func filterContentForSearchText(_ searchText:String){
        
        for hero in 0..<self.count{
            
            if self.results[hero].name!.lowercased() == searchText.lowercased() || self.results[hero].name!.contains(searchText){
                self.isSearch = true
                self.heroIndex = hero
                self.collectionView.reloadData()
                print("->>>>>>>>>>>>>>>>>>>>>>",IndexPath(row: heroIndex, section: 1))
                
                self.indexPathSelected = IndexPath(row: heroIndex, section: 1)
                
            }
            
            
        }
        
    }
    
}

//MARK:- UICollectionViewDelegateFlowLayout Methods

extension HeroesViewController:UICollectionViewDelegateFlowLayout{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isSearch{
            
            return 1
        }
        return self.count
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //        print(indexPath.compare(<#T##other: IndexPath##IndexPath#>))
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! HeroesViewCell
        
        if self.isSearch{
            cell.results = self.results[self.heroIndex]
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
    fileprivate func fetchAllHeroes(){
        var api:String
        if self.offset == 0 {
            api = "https://gateway.marvel.com/v1/public/characters?ts=1588624095&apikey=80d85d645cb9fdbe9ac5be7b3d90f2e6&hash=ba9d8a63b034a1969a0930afc5da505a&limit=\(self.limit)&offset=\(self.offset)"
            
            self.offset = 100
            self.limit = 100
            self.increase+=1
            
            self.fetchAPI(api)
            
            
        }else{
            print("WIDNDNEDENDEBDEUDB")
            self.increase+=1
            self.offset = self.offset * self.increase
            
            
            api = "https://gateway.marvel.com/v1/public/characters?ts=1588624095&apikey=80d85d645cb9fdbe9ac5be7b3d90f2e6&hash=ba9d8a63b034a1969a0930afc5da505a&limit=\(self.limit)&offset=\(self.offset)"
            
            self.addMoreHeroes(api)
            
            
            
        }
        
        
        
    }
}

extension HeroesViewController{
    func fetchAPI(_ url:String){
        
        CharactersServiceMarvel.shared.fetchCharactersWithLimit(url: url) { (heroes, error) in
            if let heroes = heroes {
                if (heroes.data?.limit) != nil {
                    DispatchQueue.main.sync {
                        
                        
                        
                        if let result = heroes.data?.results{
                            self.results.append(contentsOf: result)
                            self.indicator.stopAnimating()
                            self.count = self.results.count
                            
                            self.collectionView.reloadData()
                            
                        }
                    }
                    
                }
            }
            
        }
        
    }
}

extension HeroesViewController{
    func addMoreHeroes(_ url:String){
        
        CharactersServiceMarvel.shared.fetchCharactersWithLimit(url: url) { (heroes, error) in
            if let heroes = heroes {
                if (heroes.data?.limit) != nil {
                    DispatchQueue.main.sync {
                        
                        
                        if let result = heroes.data?.results{
                            
                            var moreHeroes = [Results]()
                            moreHeroes.append(contentsOf: result)
                            self.results += moreHeroes
                            
                            self.count = self.results.count
                            self.indicator.stopAnimating()
                            self.collectionView.reloadData()
                            
                        }
                    }
                    
                }
            }
            
        }
    }
}
