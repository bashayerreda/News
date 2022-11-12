//
//  NetworkService.swift
//  RxSwiftDemo
//
//  Created by bashayer reda on 11/2/22.
//  Copyright © 2022 bashayer reda. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift



class NetworkService : ServiceProtocol {
  
  
    
    func returnAllArticles() -> Observable<[Articles]> {
        return Observable.create {(observer) -> Disposable in
           
            self.returnAllArticles { (error, searchResult) in
                if let error = error {
                    observer.onError(error)
                }
                if let searchResult = searchResult{
                    observer.onNext(searchResult)
                
                }
                observer.onCompleted()
            }
             return Disposables.create()
        }
    }
    
    
    
    
    func returnAllArticles(completion : @escaping( (Error?,[Articles]?)-> Void)){
        guard let url = URL(string: Constants.BASE_URL)
            else {
                return completion(NSError(domain: "bashayerreda79", code: 404, userInfo: nil),nil)
        }
        
            AF.request(Constants.BASE_URL, method: HTTPMethod.get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil,  requestModifier: nil)
             .validate()
          .responseDecodable(of: ArticleResponse.self) { (response) in
                 
            if let error = response.error{
                return completion(error,nil)
                print(error)
            }
            if let articles = response.value?.articles{
                return completion(nil,articles)
            }
        }
}
}

