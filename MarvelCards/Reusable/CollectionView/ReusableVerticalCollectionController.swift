//
//  ReusableVerticalCollectionController.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 11/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//



import UIKit

class ReusableVerticalCollectionView<View:ReusableView>:UICollectionViewController{
   
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        super.init(collectionViewLayout: layout)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
      
        
        
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

