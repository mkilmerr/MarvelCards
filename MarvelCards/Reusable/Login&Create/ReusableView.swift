//
//  View.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 09/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class ReusableView: UIView {
    
  
    override init(frame: CGRect) {
        super.init(frame: frame)
      
        setViews()
        layoutViews()
       
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setViews()
        layoutViews()
    }
  
   
    func setViews() {}
    func layoutViews() {}
    
   
}
