//
//  PasswordStorageViewController.swift
//  Random Password
//
//  Created by Connor Capitolo on 4/22/18.
//  Copyright © 2018 Connor Capitolo. All rights reserved.
//

import UIKit
//added CoreData
import CoreData

class PasswordViewingViewController: UIViewController {
    
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
    
    private struct constantValues {
        static let noGood = "Click here for another password"
    }
    
    //added everything after this
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
        
    }
    @IBOutlet weak var guessPasswordName: UITextField!
    
    @IBAction func seeIfPasswordFound(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "EnterData")
        request.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let username = result.value(forKey: "passwordName") as? String {
                        if username == guessPasswordName.text! {
                            if let foundPassword = result.value(forKey: "password") as? String {
                            savedPasswordFound.text = "Your password is \(foundPassword)"
                            }
                        }
                    }
                }
            }
        }  catch {
            print ("Not found password!")
        }
    }
    
    @IBOutlet weak var savedPasswordFound: UILabel!
    
    @IBAction func goBackToPrevious(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }


    
}
