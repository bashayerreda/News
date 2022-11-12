//
//  RootViewModel.swift
//  RxSwiftDemo
//
//  Created by bashayer reda on 11/2/22.
//  Copyright © 2022 bashayer reda. All rights reserved.
//

import Foundation
import RxSwift
class RootViewModel {

    private let articleService : ServiceProtocol
    init(articleService : ServiceProtocol) {
        self.articleService = articleService
    }
    func returnAllArticles() -> Observable<[ArticlesViewModel]> {
        //as $0 == (articles : Articles) then map it to data in viewmodel so after that data will be lick a coble of data together
        articleService.returnAllArticles().map{$0.map{ArticlesViewModel(articles: $0)}}
        
          
            
        }
        
     
    }
