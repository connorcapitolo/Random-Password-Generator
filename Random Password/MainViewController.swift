//
//  ViewController.swift
//  Random Password
//
//  Created by Connor Capitolo on 3/25/18.
//  Copyright © 2018 Connor Capitolo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    @IBOutlet weak var passwordButtonForViewDidLoad: UIButton! {
        didSet {
    passwordButtonForViewDidLoad.setAttributedTitle(NSAttributedString(string: constantValues.clickButtonFirstTime, attributes: [.foregroundColor: UIColor.white,.font:MainViewController.fontMetrics()]), for: .normal)
        }
    }
    
    @IBOutlet weak var resetButtonforViewDidLoad: UIButton! {
        didSet {
            resetButtonforViewDidLoad.setAttributedTitle(NSAttributedString(string: constantValues.reset, attributes: [.foregroundColor: UIColor.black,.font:MainViewController.fontMetrics()]), for: .normal)
        }
    }
    
    func setText(_ textField: UITextField) {
            textField.attributedText = NSAttributedString(string: "", attributes:[.foregroundColor:UIColor.white,.font:MainViewController.fontMetrics()])
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
        if let possiblyANumber = Int(number.text!) {
            return possiblyANumber
        } else {
            number.text = ""
            textFieldText(at: "", at: number)
            placeHolderText(at: constantValues.invalid, at: number)
            
            return 0
        }
    }
    
    @IBAction func touchButtonforPassword(_ sender: UIButton) {
        sender.setAttributedTitle(NSAttributedString(string: constantValues.clickButtonAfter, attributes: [.foregroundColor: UIColor.white,.font:MainViewController.fontMetrics()]), for: .normal)
    }
    
    func createPassword () -> String {
        return CreatingRandomPassword().randomPassword(at: checkingValues(with: lowerCaseAmount), at: checkingValues(with: upperCaseAmount), at: checkingValues(with: numberAmount), at: checkingValues(with: symbolAmount))
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        passwordButtonForViewDidLoad.setAttributedTitle(NSAttributedString(string: constantValues.clickButtonFirstTime, attributes: [.foregroundColor: UIColor.white,.font:MainViewController.fontMetrics()]), for: .normal)
        lowerCaseAmount.text = ""
        upperCaseAmount.text = ""
        symbolAmount.text = ""
        numberAmount.text = ""
        placeHolderTextForAll()
    }
    
    private func placeHolderText (at inputString : String, at inputAmount: UITextField){
        inputAmount.attributedPlaceholder = NSAttributedString(string: inputString, attributes: [.foregroundColor: UIColor.white,.font:MainViewController.fontMetrics(),])
        inputAmount.keyboardType = UIKeyboardType.numberPad
        inputAmount.font = MainViewController.fontMetrics()
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
        static let lowerString = "Input Lowercase Letter Amount"
        static let upperString = "Input Uppercase Letter Amount"
        static let numberString = "Input Number Amount"
        static let symbolString = "Input Symbol Amount"
        static let clickButtonFirstTime = "Click to view random password"
        static let passwordHolder = "View Password Here"
        static let clickButtonAfter = "View random password in other tab"
        static let reset = "Click to reset"
        static let invalid = "Value not found"
        static let placeHolderTextSize: CGFloat = 15.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Store Password" {
            if let passwordStorageVC = segue.destination as? PasswordStorageViewController {
                    passwordStorageVC.password = createPassword()
            }
        }
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        viewDidLoad()
        placeHolderTextForAll()
    passwordButtonForViewDidLoad.setAttributedTitle(NSAttributedString(string: constantValues.clickButtonFirstTime, attributes: [.foregroundColor: UIColor.white,.font:MainViewController.fontMetrics()]), for: .normal)
    resetButtonforViewDidLoad.setAttributedTitle(NSAttributedString(string: constantValues.clickButtonFirstTime, attributes: [.foregroundColor: UIColor.white,.font:MainViewController.fontMetrics()]), for: .normal)
    }
    
    private func placeHolderTextForAll () {
        placeHolderText(at: constantValues.lowerString, at: lowerCaseAmount)
        placeHolderText(at: constantValues.upperString, at: upperCaseAmount)
        placeHolderText(at: constantValues.numberString, at: numberAmount)
        placeHolderText(at: constantValues.symbolString, at: symbolAmount)
    }
}


