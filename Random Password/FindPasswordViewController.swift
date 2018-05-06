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
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        setLabelAndTextFieldForViewDidLoad()
        guessPasswordName.clearButtonMode = .always
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        savedPasswordFound.attributedText = NSAttributedString(string: "", attributes: [.foregroundColor: UIColor.black,.font:MainViewController.fontMetrics(),])
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
                                savedPasswordFound.attributedText = NSAttributedString(string: "Your password is \(foundPassword)", attributes: [.foregroundColor: UIColor.black,.font:MainViewController.fontMetrics(),])
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
    
    private func setLabelAndTextFieldForViewDidLoad () {
        guessPasswordName.attributedPlaceholder = NSAttributedString(string: "What password are you looking for?", attributes: [.foregroundColor: UIColor.black,.font:MainViewController.fontMetrics(),])
        guessPasswordName.keyboardType = UIKeyboardType.alphabet
        savedPasswordFound.attributedText = NSAttributedString(string: "", attributes: [.foregroundColor: UIColor.black,.font:MainViewController.fontMetrics(),])
    }
}
