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
    
    //label to show the the randomly generated password
    @IBOutlet weak var passwordLabel: UILabel!
    var password = ""
    var passwordName = ""
    //method is called after the view controller has loaded its view hierarchy into memory
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //displays the password inputted by the user
        passwordLabel.attributedText = NSAttributedString(string: "Password \(password) for \(passwordName)", attributes:[.foregroundColor:UIColor.orange,.font:MainViewController.fontMetrics()])
        notGoodPassword.setAttributedTitle(NSAttributedString(string: constantValues.noGood, attributes: [.foregroundColor: UIColor.white,.font:MainViewController.fontMetrics()]), for: .normal)
    }
    
    //called when the trait's environment changes
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        viewDidLoad()
    }

    //outlet that displays text allowing for the user to move back to the Main View Controller
    @IBOutlet weak var notGoodPassword: UIButton! {
        didSet {
            notGoodPassword.setAttributedTitle(NSAttributedString(string: constantValues.noGood, attributes: [.foregroundColor: UIColor.white,.font:MainViewController.fontMetrics()]), for: .normal)
        }
    }
    
    //action that pops the Password Storage View Controller from the stack to display the Main View Controller
    @IBAction func goBackToPrevious(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    //saves the password and the password name using in Core Data
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
    
    //button that saves the password and password name when clicked
    @IBOutlet weak var savePasswordLabel: UIButton! {
        didSet {
            savePasswordLabel.setAttributedTitle(NSAttributedString(string: constantValues.save, attributes: [.foregroundColor: UIColor.white,.font:MainViewController.fontMetrics()]), for: .normal)
        }
    }
    
    //constant values used in Store Password View Controller
    private struct constantValues {
        static let noGood = "Click here for another password"
        static let save = "Click to save password and name"
        static let saved = "Password and name is saved"
    }
}
