//
//  ViewController.swift
//  Random Password
//
//  Created by Connor Capitolo on 3/25/18.
//  Copyright © 2018 Connor Capitolo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    
    //method is called after the view controller has loaded its view hierarchy into memory
    override func viewDidLoad() {
        super.viewDidLoad()
        //keyboard closes when the main view of the Main View Controller is clicked
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        findPasswordName.delegate = self
        findPaswordNameForViewDidLoad()
    }
    
    //loads after view disappears from the screen
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        resetMainVC()
    }
    
    //allows for dynamic sizing of the outlet
    @IBOutlet weak var passwordButtonForViewDidLoad: UIButton! {
        didSet {
    passwordButtonForViewDidLoad.setAttributedTitle(NSAttributedString(string: constantValues.clickForPassword, attributes: [.foregroundColor: UIColor.white,.font:MainViewController.fontMetrics()]), for: .normal)
        }
    }
    
    //allows for dynamic sizing of the outlet
    @IBOutlet weak var resetButtonforViewDidLoad: UIButton! {
        didSet {
            resetButtonforViewDidLoad.setAttributedTitle(NSAttributedString(string: constantValues.reset, attributes: [.foregroundColor: UIColor.black,.font:MainViewController.fontMetrics()]), for: .normal)
        }
    }
    
    //text field for inputting lowercase letters
    @IBOutlet weak var lowerCaseAmount: UITextField! {
        didSet {
            placeHolderText(at: constantValues.lowerString, at: lowerCaseAmount)
        }
    }
    
    //text field for inputting uppercase letters
    @IBOutlet weak var upperCaseAmount: UITextField! {
        didSet {
            placeHolderText(at: constantValues.upperString, at: upperCaseAmount)
        }
    }
    
    //text field for inputting numbers
    @IBOutlet weak var numberAmount: UITextField! {
        didSet {
            placeHolderText(at: constantValues.numberString, at: numberAmount)
        }
    }
    
    //text field for inputting symbols
    @IBOutlet weak var symbolAmount: UITextField! {
        didSet {
            placeHolderText(at: constantValues.symbolString, at: symbolAmount)
        }
    }
    
    //checks that the value for the text field is from 0-9
    private func checkingValues (with number: UITextField) -> Int {
        if let possiblyANumber = Int(number.text!), possiblyANumber < constantValues.upToAmount {
            return possiblyANumber
        } else {
            number.text = ""
            textFieldText(at: "", at: number)
            placeHolderText(at: constantValues.invalid, at: number)
            
            return 0
        }
    }
    
    //checks to see if a segue is possible based on the input of the from the number text fields and password text field
    @IBAction func possibleSegueForPassword(_ sender: UIButton) {
        if findPasswordName.text != "" && createPassword() != "" {
            performSegue(withIdentifier: "Store Password", sender: sender)
        } else {
        sender.setAttributedTitle(NSAttributedString(string: constantValues.noPasswordOrNameFound, attributes: [.foregroundColor: UIColor.white,.font:MainViewController.fontMetrics()]), for: .normal)
        }
    }
    
    //creates the random password
    func createPassword () -> String {
        return CreatingRandomPassword().randomPassword(at: checkingValues(with: lowerCaseAmount), at: checkingValues(with: upperCaseAmount), at: checkingValues(with: numberAmount), at: checkingValues(with: symbolAmount))
    }
    
    //action button that resests the Main View Controller to its original state
    @IBAction func resetButton(_ sender: UIButton) {
        resetMainVC()
    }
    
    //text field for inputting the password
    @IBOutlet weak var findPasswordName: UITextField!
    
    
    //sets attributed text, keyboard, and clear button on right side of text fields in the viewDidLoad
    private func findPaswordNameForViewDidLoad() {
    findPasswordName.attributedPlaceholder = NSAttributedString(string: constantValues.creatingPassword, attributes: [.foregroundColor: UIColor.black,.font:MainViewController.fontMetrics(),])
    findPasswordName.keyboardType = UIKeyboardType.alphabet
    findPasswordName.clearButtonMode = .always
    }
    
    //keyboard disappears when the return button is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            findPasswordName.resignFirstResponder()
            return true
        }
    
    
    //preparing segue to Store Password View Controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Store Password" {
            if let passwordStorageVC = segue.destination as? StorePasswordViewController {
                passwordStorageVC.password = createPassword()
                passwordStorageVC.passwordName = findPasswordName.text!
            }
        }
    }
    
    //allows for resetting all text fields to original state
    private func resetMainVC () {
    passwordButtonForViewDidLoad.setAttributedTitle(NSAttributedString(string: constantValues.clickForPassword, attributes: [.foregroundColor: UIColor.white,.font:MainViewController.fontMetrics()]), for: .normal)
        lowerCaseAmount.text = ""
        upperCaseAmount.text = ""
        symbolAmount.text = ""
        numberAmount.text = ""
        placeHolderTextForAll()
        findPasswordName.text = ""
    }
    
    //attributed text for the placeholder in the text field
    private func placeHolderText (at inputString : String, at inputAmount: UITextField){
        inputAmount.attributedPlaceholder = NSAttributedString(string: inputString, attributes: [.foregroundColor: UIColor.white,.font:MainViewController.fontMetrics(),])
        inputAmount.keyboardType = UIKeyboardType.numberPad
        
    }
    
    //attributed text for the text field
    private func textFieldText (at inputString : String, at inputAmount: UITextField){
        inputAmount.attributedText = NSAttributedString(string: inputString, attributes:[.foregroundColor:UIColor.white,.font:MainViewController.fontMetrics()])
    }
    
    //allows for dynamic font size and scaling
    static func fontMetrics() -> UIFont {
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(constantValues.placeHolderTextSize)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        return font
    }
    
    //constant values used in Main View Controller
    private struct constantValues {
        static let upToAmount = 10
        static let creatingPassword = "Input a possible password"
        static let lowerString = "Input Up to " + String(constantValues.upToAmount) + " Lowercase Letters"
        static let upperString = "Input Up to " + String(constantValues.upToAmount) + " Uppercase Letters"
        static let numberString = "Input Up to " + String(constantValues.upToAmount) + " Numbers"
        static let symbolString = "Input Up to " + String(constantValues.upToAmount) + " Symbols"
        static let clickForPassword = "Click to view random password"
        static let noPasswordOrNameFound = "Password/name not found. Click to try again"
        static let reset = "Click To Reset Values"
        static let invalid = "Invalid"
        static let placeHolderTextSize: CGFloat = 15.0
    }

    //called when the trait's environment changes
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        viewDidLoad()
        placeHolderTextForAll()
        passwordButtonForViewDidLoad.setAttributedTitle(NSAttributedString(string: constantValues.clickForPassword, attributes: [.foregroundColor: UIColor.white,.font:MainViewController.fontMetrics()]), for: .normal)
        resetButtonforViewDidLoad.setAttributedTitle(NSAttributedString(string: constantValues.reset, attributes: [.foregroundColor: UIColor.white,.font:MainViewController.fontMetrics()]), for: .normal)
    }
    
    //function that sets the placeholder texts for the text fields of lowercase letter, uppercase letter, number, and symbol
    private func placeHolderTextForAll () {
        placeHolderText(at: constantValues.lowerString, at: lowerCaseAmount)
        placeHolderText(at: constantValues.upperString, at: upperCaseAmount)
        placeHolderText(at: constantValues.numberString, at: numberAmount)
        placeHolderText(at: constantValues.symbolString, at: symbolAmount)
    }
}


