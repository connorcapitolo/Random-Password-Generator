//
//  StorePasswordViewController.swift
//  Random Password
//
//  Created by Connor Capitolo on 5/4/18.
//  Copyright © 2018 Connor Capitolo. All rights reserved.
//

import UIKit
import CoreData

class StorePasswordViewController: UIViewController {
    
    var password = ""
    var passwordName = ""
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordLabel.attributedText = NSAttributedString(string: "Password \(password) for \(passwordName)", attributes:[.foregroundColor:UIColor.orange,.font:MainViewController.fontMetrics()])
        notGoodPassword.setAttributedTitle(NSAttributedString(string: constantValues.noGood, attributes: [.foregroundColor: UIColor.white,.font:MainViewController.fontMetrics()]), for: .normal)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        viewDidLoad()
    }

    @IBOutlet weak var notGoodPassword: UIButton! {
        didSet {
            notGoodPassword.setAttributedTitle(NSAttributedString(string: constantValues.noGood, attributes: [.foregroundColor: UIColor.white,.font:MainViewController.fontMetrics()]), for: .normal)
        }
    }
    @IBAction func goBackToPrevious(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func savePasswordAndName(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let newPassword = NSEntityDescription.insertNewObject(forEntityName: "EnterData", into: context)
        newPassword.setValue(password, forKey: "password")
        newPassword.setValue(passwordName, forKey: "passwordName")
        do {
            try context.save()
            print("Saved!")
        } catch {
            print("Not Saved!")
        }
        savePasswordLabel.setAttributedTitle(NSAttributedString(string: constantValues.saved, attributes: [.foregroundColor: UIColor.white,.font:MainViewController.fontMetrics()]), for: .normal)
    }
    
    @IBOutlet weak var savePasswordLabel: UIButton! {
        didSet {
            savePasswordLabel.setAttributedTitle(NSAttributedString(string: constantValues.save, attributes: [.foregroundColor: UIColor.white,.font:MainViewController.fontMetrics()]), for: .normal)
        }
    }
    
    
    
    private struct constantValues {
        static let noGood = "Click here for another password"
        static let save = "Click to save password and name"
        static let saved = "Password and name is saved"
    }
    
    
    
}
