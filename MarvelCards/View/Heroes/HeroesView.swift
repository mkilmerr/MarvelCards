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
    
    lazy var tableView:UITableView = {
        let tbl = UITableView()
        
        tbl.translatesAutoresizingMaskIntoConstraints = false
        return tbl
    }()
    
    override func setViews() {
        super.setViews()
        self.backgroundColor =  UIColor(red: 224/255, green: 32/255, blue: 48/255, alpha: 1)
        
        tableView.register(HeroesViewCell.self, forCellReuseIdentifier: cellID)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 800
        
        
        addSubview(tableView)
        
    }
    
    override func layoutViews() {
        super.layoutViews()
        self.tableViewConstraints()
        
    }
    
}

extension HeroesView{
    func tableViewConstraints(){
        tableView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
}

extension HeroesView:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! HeroesViewCell
       

        return cell
       }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    
}
