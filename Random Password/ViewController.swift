//
//  ViewController.swift
//  Random Password
//
//  Created by Connor Capitolo on 3/25/18.
//  Copyright © 2018 Connor Capitolo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var passwordButtonForViewDidLoad: UIButton!
    
    @IBOutlet weak var resetButtonforViewDidLoad: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordButtonForViewDidLoad.setAttributedTitle(NSAttributedString(string: constantValues.clickButtonFirstTime, attributes: [.foregroundColor: UIColor.white,.font:fontMetrics()]), for: .normal)
        resetButtonforViewDidLoad.setAttributedTitle(NSAttributedString(string: constantValues.reset, attributes: [.foregroundColor: UIColor.black,.font:fontMetrics()]), for: .normal)
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }

    @IBOutlet private weak var passwordShown: UILabel! {
        didSet {
            passwordShown.attributedText = NSAttributedString(string: constantValues.passwordHolder, attributes: [.foregroundColor: UIColor.white,.font:fontMetrics()])
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
        if let possiblyANumber = Int(number.text!) {
            return possiblyANumber
        } else {
            number.text = ""
            invalidText(at: constantValues.invalid, at: number)
            return 0
        }
    }
    
    @IBAction func touchButtonforPassword(_ sender: UIButton) {
        sender.setAttributedTitle(NSAttributedString(string: constantValues.clickButtonAfter, attributes: [.foregroundColor: UIColor.white,.font:fontMetrics()]), for: .normal)
        let password = CreatingRandomPassword().randomPassword(at: checkingValues(with: lowerCaseAmount), at: checkingValues(with: upperCaseAmount), at: checkingValues(with: numberAmount), at: checkingValues(with: symbolAmount))
        passwordShown.attributedText = NSAttributedString(string: "Password: \(password)", attributes: [.foregroundColor: UIColor.white,.font:fontMetrics()])
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        passwordShown.attributedText = NSAttributedString(string: constantValues.passwordHolder, attributes: [.foregroundColor: UIColor.white,.font:fontMetrics()])
        lowerCaseAmount.text = ""
        upperCaseAmount.text = ""
        symbolAmount.text = ""
        numberAmount.text = ""
    }
    
    private func placeHolderText (at inputString : String, at inputAmount: UITextField){
        inputAmount.attributedPlaceholder = NSAttributedString(string: inputString, attributes: [.foregroundColor: UIColor.white,.font:fontMetrics(),])
    }
    
    private func invalidText (at inputString : String, at inputAmount: UITextField){
        inputAmount.attributedText = NSAttributedString(string: inputString, attributes:[.foregroundColor:UIColor.white,.font:fontMetrics()])
    }
    
    private func fontMetrics() -> UIFont {
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
        static let placeHolderTextSize: CGFloat = 15.0
        static let passwordHolder = "View Password Here"
        static let clickButtonAfter = "Your random password is below"
        static let invalid = "Value not found"
        static let reset = "Click to reset"
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        viewDidLoad()
        placeHolderText(at: constantValues.lowerString, at: lowerCaseAmount)
        placeHolderText(at: constantValues.upperString, at: upperCaseAmount)
        placeHolderText(at: constantValues.numberString, at: numberAmount)
        placeHolderText(at: constantValues.symbolString, at: symbolAmount)
        passwordShown.attributedText = NSAttributedString(string: constantValues.passwordHolder, attributes: [.foregroundColor: UIColor.white,.font:fontMetrics()])
    }
}


