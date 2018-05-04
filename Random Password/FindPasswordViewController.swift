//
//  FindPasswordViewController.swift
//  Random Password
//
//  Created by Connor Capitolo on 5/4/18.
//  Copyright © 2018 Connor Capitolo. All rights reserved.
//

import UIKit
import CoreData

class FindPasswordViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        guessPasswordName.delegate = self
    }
    
    @IBOutlet weak var guessPasswordName: UITextField! {
        didSet {
            guessPasswordName.attributedPlaceholder = NSAttributedString(string: "What password are you looking for?", attributes: [.foregroundColor: UIColor.black,.font:MainViewController.fontMetrics(),])
            guessPasswordName.keyboardType = UIKeyboardType.alphabet
        }
    }
    
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
    @IBOutlet weak var setpossiblePasswordLabel: UIButton! {
        didSet {
            setpossiblePasswordLabel.setAttributedTitle(NSAttributedString(string: constantValues.clickToSee, attributes: [.foregroundColor: UIColor.black,.font:MainViewController.fontMetrics()]), for: .normal)
        }
    }
    
    private struct constantValues {
        static let clickToSee = "Click to see possible password"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guessPasswordName.resignFirstResponder()
        return true
    }
    
    
    
    
    
    @IBOutlet weak var savedPasswordFound: UILabel!
    
}
