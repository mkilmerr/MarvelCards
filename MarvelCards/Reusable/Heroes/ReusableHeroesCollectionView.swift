//
//  ReusableTableViewController.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 09/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class ReusableHeroesCollectionView<View:ReusableView>:UICollectionViewController{
    let cellID = "CELL_ID"
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        super.init(collectionViewLayout: layout)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        
        collectionView.register(HeroesViewCell.self, forCellWithReuseIdentifier:cellID)
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! HeroesViewCell
        
        return cell
    }
}


//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view = View()
//
//              collectionView.backgroundColor = .systemGroupedBackground
//              collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
//              navigationController?.navigationBar.isHidden = true
//    }
//
//    var custom:View{
//        return view as! View
//    }

