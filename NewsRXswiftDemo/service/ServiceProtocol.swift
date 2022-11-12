//
//  ServiceProtocol.swift
//  RxSwiftDemo
//
//  Created by bashayer reda on 11/2/22.
//  Copyright © 2022 bashayer reda. All rights reserved.
//

import Foundation
import RxSwift
protocol ServiceProtocol  : AnyObject{
    func returnAllArticles() ->Observable<[Articles]>
}
