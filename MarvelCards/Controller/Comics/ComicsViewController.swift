//
//  ComicsViewController.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 19/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit


class ComicsViewController:ReusableVerticalCollectionView<ComicsView>{
    var results:ComicByHeroID?
    let identifier = "identifier"
    
    fileprivate lazy var indicator:UIActivityIndicatorView = {
        let ind = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        ind.hidesWhenStopped = true
        ind.center = view.center
        return ind
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(ComicsViewCell.self, forCellWithReuseIdentifier: identifier)
        //        collectionView.contentInset = UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: -20)
        view.addSubview(indicator)
        indicator.startAnimating()
        self.setResults()
    }
    
    
    
}

extension ComicsViewController:UICollectionViewDelegateFlowLayout{
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return self.results?.data?.results?.count ?? 0
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ComicsViewCell
        cell.results = self.results?.data?.results![indexPath.item]
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: self.view.bounds.size.width - 10, height: self.view.bounds.size.width)
    }
}

extension ComicsViewController{
    func setResults(){
        ComicService.shared.fetch { (comics, error) in
            if  error != nil {
                
                return
            }
            
            DispatchQueue.main.async {
                self.results = comics
                self.indicator.stopAnimating()
                self.collectionView.reloadData()
            }
        }
    }
}


