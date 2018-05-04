//
//  ViewController.swift
//  Random Password
//
//  Created by Connor Capitolo on 3/25/18.
//  Copyright © 2018 Connor Capitolo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        findPasswordName.delegate = self
    }
    
    @IBOutlet weak var passwordButtonForViewDidLoad: UIButton! {
        didSet {
    passwordButtonForViewDidLoad.setAttributedTitle(NSAttributedString(string: constantValues.clickForPassword, attributes: [.foregroundColor: UIColor.white,.font:MainViewController.fontMetrics()]), for: .normal)
        }
    }
    
    
    @IBOutlet weak var resetButtonforViewDidLoad: UIButton! {
        didSet {
            resetButtonforViewDidLoad.setAttributedTitle(NSAttributedString(string: constantValues.reset, attributes: [.foregroundColor: UIColor.black,.font:MainViewController.fontMetrics()]), for: .normal)
        }
    }
    
    @IBOutlet weak var lowerCaseAmount: UITextField! {
        didSet {
            placeHolderText(at: constantValues.lowerString, at: lowerCaseAmount)
        }
    }
    
    @IBOutlet weak var upperCaseAmount: UITextField! {
        didSet {
            placeHolderText(at: constantValues.upperString, at: upperCaseAmount)
        }
    }
    
    @IBOutlet weak var numberAmount: UITextField! {
        didSet {
            placeHolderText(at: constantValues.numberString, at: numberAmount)
        }
    }
    
    @IBOutlet weak var symbolAmount: UITextField! {
        didSet {
            placeHolderText(at: constantValues.symbolString, at: symbolAmount)
        }
    }
    
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
    
    @IBAction func possibleSegueForPassword(_ sender: UIButton) {
        if findPasswordName.text != "" && createPassword() != "" {
            performSegue(withIdentifier: "Store Password", sender: sender)
        } else {
        sender.setAttributedTitle(NSAttributedString(string: constantValues.noPasswordOrNameFound, attributes: [.foregroundColor: UIColor.white,.font:MainViewController.fontMetrics()]), for: .normal)
        }
    }
    
    func createPassword () -> String {
        return CreatingRandomPassword().randomPassword(at: checkingValues(with: lowerCaseAmount), at: checkingValues(with: upperCaseAmount), at: checkingValues(with: numberAmount), at: checkingValues(with: symbolAmount))
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        resetMainVC()
    }
    @IBOutlet weak var findPasswordName: UITextField! {
                didSet {
                    findPasswordName.attributedPlaceholder = NSAttributedString(string: "What password are you looking for?", attributes: [.foregroundColor: UIColor.black,.font:MainViewController.fontMetrics(),])
                    findPasswordName.keyboardType = UIKeyboardType.alphabet
                }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            findPasswordName.resignFirstResponder()
            return true
        }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Store Password" {
            if let passwordStorageVC = segue.destination as? StorePasswordViewController {
                passwordStorageVC.password = createPassword()
                passwordStorageVC.passwordName = findPasswordName.text!
                resetMainVC()
            }
        }
    }
    
    private func resetMainVC () {
    passwordButtonForViewDidLoad.setAttributedTitle(NSAttributedString(string: constantValues.clickForPassword, attributes: [.foregroundColor: UIColor.white,.font:MainViewController.fontMetrics()]), for: .normal)
        lowerCaseAmount.text = ""
        upperCaseAmount.text = ""
        symbolAmount.text = ""
        numberAmount.text = ""
        placeHolderTextForAll()
        findPasswordName.text = ""
    }
    
    private func placeHolderText (at inputString : String, at inputAmount: UITextField){
        inputAmount.attributedPlaceholder = NSAttributedString(string: inputString, attributes: [.foregroundColor: UIColor.white,.font:MainViewController.fontMetrics(),])
        inputAmount.keyboardType = UIKeyboardType.numberPad
        
    }
    
    private func textFieldText (at inputString : String, at inputAmount: UITextField){
        inputAmount.attributedText = NSAttributedString(string: inputString, attributes:[.foregroundColor:UIColor.white,.font:MainViewController.fontMetrics()])
    }
    
    static func fontMetrics() -> UIFont {
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(constantValues.placeHolderTextSize)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        return font
    }
    
    private struct constantValues {
        static let upToAmount = 10
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

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        viewDidLoad()
        placeHolderTextForAll()
        forTraitCollectionViewDidLoad()
    }
    
    private func placeHolderTextForAll () {
        placeHolderText(at: constantValues.lowerString, at: lowerCaseAmount)
        placeHolderText(at: constantValues.upperString, at: upperCaseAmount)
        placeHolderText(at: constantValues.numberString, at: numberAmount)
        placeHolderText(at: constantValues.symbolString, at: symbolAmount)
    }
    
    private func forTraitCollectionViewDidLoad () {
        passwordButtonForViewDidLoad.setAttributedTitle(NSAttributedString(string: constantValues.clickForPassword, attributes: [.foregroundColor: UIColor.white,.font:MainViewController.fontMetrics()]), for: .normal)
        resetButtonforViewDidLoad.setAttributedTitle(NSAttributedString(string: constantValues.reset, attributes: [.foregroundColor: UIColor.white,.font:MainViewController.fontMetrics()]), for: .normal)
    }
}


