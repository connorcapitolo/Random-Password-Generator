//
//  ViewController.swift
//  Random Password
//
//  Created by Connor Capitolo on 3/25/18.
//  Copyright © 2018 Connor Capitolo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var passwordShown: UILabel!
    
    let lowerString = "Input Lowercase Letter Amount"
    @IBOutlet weak var lowerCaseAmount: UITextField! {
        didSet {
            placeHolderText(at: lowerString, at: lowerCaseAmount)
        }
    }
    
    let upperString = "Input Uppercase Letter Amount"
    @IBOutlet weak var upperCaseAmount: UITextField! {
        didSet {
            placeHolderText(at: upperString, at: upperCaseAmount)
        }
    }
    
    let numberString = "Input Number Amount"
    @IBOutlet weak var numberAmount: UITextField! {
        didSet {
            placeHolderText(at: numberString, at: numberAmount)
        }
    }
    
    let symbolString = "Input Symbol Amount"
    @IBOutlet weak var symbolAmount: UITextField! {
        didSet {
            placeHolderText(at: symbolString, at: symbolAmount)
        }
    }
    
    @IBAction func touchButton(_ sender: UIButton) {
    /*    let numLowerCase: Int! = Int(lowerCaseAmount.text!)
        let numUpperCase: Int! = Int(upperCaseAmount.text!)
        let numNumber: Int! = Int(numberAmount.text!)
        let numSymbol: Int! = Int(symbolAmount.text!)
 */
        let password = CreatingRandomPassword().randomPassword(at: Int(lowerCaseAmount.text!)!, at: Int(upperCaseAmount.text!)!, at: Int(numberAmount.text!)!, at: Int(symbolAmount.text!)!)
        passwordShown.text = "Password: \(password)"
    }
    
    private func placeHolderText (at inputString : String, at inputAmount: UITextField){
        inputAmount.attributedPlaceholder = NSAttributedString(string: inputString, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
    }
}

