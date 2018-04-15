//
//  ViewController.swift
//  Random Password
//
//  Created by Connor Capitolo on 3/25/18.
//  Copyright © 2018 Connor Capitolo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(constantValues.placeHolderTextSize)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        button.setAttributedTitle(NSAttributedString(string: constantValues.clickButton, attributes: [.foregroundColor: UIColor.white,.font:font]), for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
    }
    
    @IBOutlet private weak var passwordShown: UILabel! {
        didSet {
            var font = UIFont.preferredFont(forTextStyle: .body).withSize(constantValues.placeHolderTextSize)
            font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
            passwordShown.attributedText = NSAttributedString(string: constantValues.passwordHolder, attributes: [.foregroundColor: UIColor.white,.font:font])
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
    
    @IBAction func touchButton(_ sender: UIButton) {

        let password = CreatingRandomPassword().randomPassword(at: Int(lowerCaseAmount.text!)!, at: Int(upperCaseAmount.text!)!, at: Int(numberAmount.text!)!, at: Int(symbolAmount.text!)!)
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(constantValues.placeHolderTextSize)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        passwordShown.attributedText = NSAttributedString(string: "Password: \(password)", attributes: [.foregroundColor: UIColor.white,.font:font])
    }
    
    private func placeHolderText (at inputString : String, at inputAmount: UITextField){
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(constantValues.placeHolderTextSize)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        inputAmount.attributedPlaceholder = NSAttributedString(string: inputString, attributes: [.foregroundColor: UIColor.white,.font:font])
    }
    
    
    private struct constantValues {
        static let lowerString = "Input Lowercase Letter Amount"
        static let upperString = "Input Uppercase Letter Amount"
        static let numberString = "Input Number Amount"
        static let symbolString = "Input Symbol Amount"
        static let clickButton = "Click to view random password"
        static let placeHolderTextSize: CGFloat = 15.0
        static let passwordHolder = "Password"
    }
//    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//        self.view.setNeedsDisplay()
//        self.view.setNeedsLayout()
//    }
}
