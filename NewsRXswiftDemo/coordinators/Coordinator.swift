//
//  Coordinator.swift
//  RxSwiftDemo
//
//  Created by bashayer reda on 11/2/22.
//  Copyright © 2022 bashayer reda. All rights reserved.
//

import Foundation
import UIKit
protocol Coordinator {
    var coordinators :[Coordinator]{get set}
    var uiNavController : UINavigationController {get set}
    func start()
}
