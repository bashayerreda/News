//
//  ArticlesResponse.swift
//  RxSwiftDemo
//
//  Created by bashayer reda on 11/2/22.
//  Copyright © 2022 bashayer reda. All rights reserved.
//

import Foundation
import UIKit
struct ArticleResponse : Codable{
    var status : String
    var totalResults : Int
    var articles : [Articles]
}
