//
//  MainCoordinator.swift
//  RxSwiftDemo
//
//  Created by bashayer reda on 11/2/22.
//  Copyright © 2022 bashayer reda. All rights reserved.
//

import Foundation
import UIKit
class MainCoordinator : Coordinator {
    var coordinators = [Coordinator]()
    var uiNavController: UINavigationController
    init(uiNavController: UINavigationController) {
        self.uiNavController = uiNavController
    }
    func start() {
        
        let vc = ViewController.instantiateWithViewModel(rootViewModel: RootViewModel(articleService: NetworkService()))
        vc.coordinator = self
    
        uiNavController.pushViewController(vc, animated: false)
    }
   
}
