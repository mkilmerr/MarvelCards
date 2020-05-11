//
//  HeroesView.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 09/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class HeroesView:ReusableView{
    
    
    
    let cellID = "CELL_ID"
//
//    lazy var collectionView:UICollectionView = {
//        let clv: UICollectionView
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        clv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        clv.register(HeroesViewCell.self, forCellWithReuseIdentifier: cellID)
//        clv.translatesAutoresizingMaskIntoConstraints = false
//        return clv
//    }()
    
    
    override func setViews() {
        super.setViews()
        backgroundColor = .mainBackground
        
    }
    
    override func layoutViews() {
        super.layoutViews()
       
        
    }
    
    
}

extension HeroesView{
//    func collectionViewConstraints(){
//        collectionView.widthAnchor.constraint(equalTo: widthAnchor, constant: 60).isActive = true
//        collectionView.heightAnchor.constraint(equalTo: heightAnchor, constant: 60).isActive = true
//    }
}
//
//extension HeroesView:UICollectionViewDelegate,UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
//        cell.backgroundColor = .red
//        
//        return cell
//    }
//}
