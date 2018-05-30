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
    
    //method is called after the view controller has loaded its view hierarchy into memory
    override func viewDidLoad() {
        super.viewDidLoad()
        //sets the Main View Controller as the opening screen
        selectedViewController = viewControllers?[0]
    }
}
        
        
//        guard let viewControllers = viewControllers else {
//            return
//        }
//        for viewController in viewControllers {
//            if let passwordVC = viewController as? PasswordStorageViewController {
//                passwordVC.password = password
//            }
//        }

