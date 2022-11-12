//
//  Storyboarded.swift
//  RxSwiftDemo
//
//  Created by bashayer reda on 11/2/22.
//  Copyright © 2022 bashayer reda. All rights reserved.
//

import Foundation
import UIKit
protocol Storyboarded {
    var rootViewModel : RootViewModel! { get set}
    static func instantiate() -> Self
  static func instantiateWithViewModel(rootViewModel : RootViewModel) -> ViewController
}
extension Storyboarded where Self : UIViewController{
      
   
    static func instantiate() -> Self{
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(identifier: id)
        as! Self
    }
    
     
}

