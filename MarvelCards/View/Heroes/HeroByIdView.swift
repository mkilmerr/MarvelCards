//
//  HeroByIdView.swift
//  MarvelCards
//
//  Created by Marcos Kilmer on 15/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

protocol HeroByIdDelegate:class{
    func setHeroData(hero:CharactersModel?)
  
}

class HeroByIdView:ReusableView{
    
    
    var collectionView:UICollectionView!
    let identifier = "HeroByID"
    var count:Int?
    var hero:CharactersModel?{
        didSet{
            for hero in hero!.data!.results!{
                
                if let heroPath = hero.thumbnail?.path, let heroExtension = hero.thumbnail?.extension, let name = hero.name, let numberOfComicsAvaliable = hero.comics?.available{
                    
                    let heroPathHTTPS = "https" + heroPath.dropFirst(4)
                    heroImage.sd_setImage(with: URL(string: "\(heroPathHTTPS).\(heroExtension)"), completed: nil)
                    heroName.text = name
                    numberOfComics.text = String(numberOfComicsAvaliable)
                    comicsInfo(id: hero.id!)
                    
                }
                
            }
            
            
        }
    }
    
    var comics:ComicByHeroID?{
        didSet{
            if let count = comics?.data?.count{
                
                DispatchQueue.main.sync {
                    self.count = count
                     self.collectionView.reloadData()
                }
               
            }
    
        }
    }
    
    
    
  
    weak var delegate:HeroByIdDelegate?
    var heroName:UILabel = .labelDefault(title:"hero name",fontSize:18)
    var comicsLabel:UILabel = .labelDefault(title: "Nº of Comics : ", fontSize: 17)
    var numberOfComics:UILabel = .labelDefault(title: "number of comics", fontSize: 17)
    var heroImage:UIImageView = UIImageView.heroesThumbnailImage(width: 300,height: 300)
    
    override func setViews() {
        backgroundColor = .white
        
        
        addSubview(heroImage)
        addSubview(heroName)
        addSubview(comicsLabel)
        addSubview(numberOfComics)
        
    }
    
    override func layoutViews() {
        heroImageConstraints()
        heroNameConstraints()
        comicLabelConstraints()
        numberOfComicsConstraints()
        
    }
    override init(frame: CGRect) {
        super.init(frame:frame)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        layout.minimumLineSpacing = 10
//        layout.minimumInteritemSpacing = 50
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        addSubview(collectionView)
        
        collectionView.register(HeroByIdViewCell.self, forCellWithReuseIdentifier: identifier)
        
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.contentInset = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
        
        addSubview(collectionView)
        
       
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: comicsLabel.bottomAnchor, constant: 10).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setHeroInfo(info:CharactersModel?){
        self.hero = info
    }
   
    func comicsInfo(id:Int){
        ComicByIDService.shared.fetchComicByID(id: id) { (comics, error) in
            if let comics = comics {
                self.comics = comics
            }
        }
    }
    
}

extension HeroByIdView:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.count ?? 0 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  identifier, for: indexPath) as! HeroByIdViewCell
        cell.comics = self.comics!.data!.results![indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 100, height: 200)
    }
    
}
fileprivate extension HeroByIdView{
    func heroImageConstraints(){
        
        
        heroName.layer.cornerRadius = 22
        
        heroImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        heroImage.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
    }
    
    func heroNameConstraints(){
        heroName.translatesAutoresizingMaskIntoConstraints = false
        heroName.topAnchor.constraint(equalTo: heroImage.bottomAnchor, constant: 20).isActive = true
        //        heroName.leadingAnchor.constraint(equalTo: heroImage.leadingAnchor, constant: 20).isActive = true
        
        heroName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
    }
    
    func comicLabelConstraints(){
        comicsLabel.translatesAutoresizingMaskIntoConstraints = false
        comicsLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        comicsLabel.topAnchor.constraint(equalTo: heroName.bottomAnchor, constant: 20).isActive = true
        
    }
    
    func numberOfComicsConstraints(){
        numberOfComics.translatesAutoresizingMaskIntoConstraints = false
        numberOfComics.leadingAnchor.constraint(equalTo: comicsLabel.leadingAnchor, constant: 125).isActive = true
        numberOfComics.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        numberOfComics.topAnchor.constraint(equalTo: comicsLabel.topAnchor).isActive = true
        
    }
    
    
}

extension HeroByIdView{
    func setHero(){
        delegate?.setHeroData(hero: hero)
    }
   
}


