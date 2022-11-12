//
//  ArticlesViewModel.swift
//  RxSwiftDemo
//
//  Created by bashayer reda on 11/11/22.
//  Copyright © 2022 bashayer reda. All rights reserved.
//

import Foundation
class ArticlesViewModel{
    
    var imageUrl : String?{
        articles.urlToImage
    }
    var title : String?{
        articles.title
      }
    var description : String?{
        articles.description
      }
    var articles : Articles
    init(articles : Articles) {
        self.articles = articles
    }
}
