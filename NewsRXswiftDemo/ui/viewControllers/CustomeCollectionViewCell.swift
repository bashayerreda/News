//
//  CustomeCollectionViewCell.swift
//  RxSwiftDemo
//
//  Created by bashayer reda on 11/12/22.
//  Copyright © 2022 bashayer reda. All rights reserved.
//

import UIKit
import RxSwift
import RxRelay
import SDWebImage

class CustomeCollectionViewCell: UICollectionViewCell {
    var articlesObservable  = PublishSubject<ArticlesViewModel>()
       let disposeBag = DisposeBag()
    lazy var imageViewUi : UIImageView  = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 8
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.widthAnchor.constraint(equalToConstant: 60).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 100).isActive = true
        iv.backgroundColor = .secondarySystemBackground
        return iv
    }()
    
    lazy var titleUi : UILabel  = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        return lbl
    }()
    
    lazy var descUi : UILabel  = {
           let desc = UILabel()
        desc.numberOfLines = 3
           return desc
       }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUi()
        subscribeFromView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
   
    func subscribeFromView(){
        self.articlesObservable.subscribe(onNext:{ articles in 
            if let imageUrl = articles.imageUrl {
                self.imageViewUi.sd_setImage(with: URL(string:imageUrl), completed: nil)
            
                
            }
            if let title = articles.title{
                self.titleUi.text = title
            }
            if let description = articles.description{
                self.descUi.text = description
            }
            
            }).disposed(by: disposeBag)
    }
    
    func configureUi(){
        backgroundColor = .systemBackground
        addSubview(imageViewUi)
        imageViewUi.translatesAutoresizingMaskIntoConstraints = false
        imageViewUi.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageViewUi.leftAnchor.constraint(equalTo: leftAnchor,constant: 20).isActive = true
        
        addSubview(titleUi)
        titleUi.translatesAutoresizingMaskIntoConstraints = false
        titleUi.topAnchor.constraint(equalTo: imageViewUi.topAnchor).isActive = true
        titleUi.leftAnchor.constraint(equalTo: imageViewUi.rightAnchor,constant: 20).isActive = true
        titleUi.rightAnchor.constraint(equalTo: rightAnchor,constant: -35).isActive = true
        
        addSubview(descUi)
        descUi.translatesAutoresizingMaskIntoConstraints = false
        descUi.topAnchor.constraint(equalTo: titleUi.bottomAnchor,constant: 10).isActive = true
        descUi.leftAnchor.constraint(equalTo: titleUi.leftAnchor).isActive = true
        descUi.rightAnchor.constraint(equalTo: titleUi.rightAnchor).isActive = true

    }
    
}
