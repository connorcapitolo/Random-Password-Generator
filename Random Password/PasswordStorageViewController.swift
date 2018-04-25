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
        likePassword.setAttributedTitle(NSAttributedString(string: constantValues.goodPassword, attributes: [.foregroundColor: UIColor.white,.font:MainViewController.fontMetrics()]), for: .normal)
        notGoodPassword.setAttributedTitle(NSAttributedString(string: constantValues.noGood, attributes: [.foregroundColor: UIColor.white,.font:MainViewController.fontMetrics()]), for: .normal)
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        viewDidLoad()
    }
    
    @IBOutlet weak var likePassword: UIButton! {
        didSet {
            likePassword.setAttributedTitle(NSAttributedString(string: constantValues.goodPassword, attributes: [.foregroundColor: UIColor.white,.font:MainViewController.fontMetrics()]), for: .normal)
        }
    }
    
    @IBOutlet weak var notGoodPassword: UIButton! {
        didSet {
            notGoodPassword.setAttributedTitle(NSAttributedString(string: constantValues.noGood, attributes: [.foregroundColor: UIColor.white,.font:MainViewController.fontMetrics()]), for: .normal)
        }
    }
    
    @IBAction func goBackToPrevious(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    private struct constantValues {
        static let noGood = "Click here for another password"
        static let goodPassword = "Click here to store this password"
    }
}
