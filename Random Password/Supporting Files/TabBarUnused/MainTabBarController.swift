//
//  MainTabBarController.swift
//  Random Password
//
//  Created by Connor Capitolo on 4/22/18.
//  Copyright © 2018 Connor Capitolo. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    var password: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedViewController = viewControllers?[0]
//        guard let viewControllers = viewControllers else {
//            return
//        }
//        for viewController in viewControllers {
//            if let passwordVC = viewController as? PasswordStorageViewController {
//                passwordVC.password = password
//            }
//        }
    }
}
