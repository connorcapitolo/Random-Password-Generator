//
//  PasswordStorageViewController.swift
//  Random Password
//
//  Created by Connor Capitolo on 4/22/18.
//  Copyright © 2018 Connor Capitolo. All rights reserved.
//

import UIKit

class PasswordStorageViewController: UIViewController {
    
    var password = ""
    
    @IBOutlet weak var passwordLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        passwordLabel.attributedText = NSAttributedString(string: "Password: \(password)", attributes:[.foregroundColor:UIColor.orange,.font:MainViewController.fontMetrics()])
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        viewDidLoad()
    }
}
