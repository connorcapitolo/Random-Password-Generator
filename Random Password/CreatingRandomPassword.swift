//
//  CreatingRandomPassword.swift
//  Random Password
//
//  Created by Connor Capitolo on 3/25/18.
//  Copyright © 2018 Connor Capitolo. All rights reserved.
//

import Foundation

class CreatingRandomPassword {
    private let lowerCaseLetters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    private let numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
    private let upperCaseLetters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Y"]
    private let symbols = ["!", "\"", "#", "@", "#", "$", "%", "&", "*", "?", "="]
    func randomPassword (at numLowerCase: Int, at numUpperCase: Int, at numNumber: Int, at numSymbol: Int) -> String {
        var firstStepRandom = [String] ()
        for _ in 1...numLowerCase {
            firstStepRandom.append(lowerCaseLetters[lowerCaseLetters.count.randomInt])
        }
        
        for _ in 1...numUpperCase {
            firstStepRandom.append(upperCaseLetters[upperCaseLetters.count.randomInt])
        }
        
        for _ in 1...numNumber {
            firstStepRandom.append(numbers[numbers.count.randomInt])
        }
        for _ in 1...numSymbol {
            firstStepRandom.append(symbols[symbols.count.randomInt])
        }
 
        var finalRandomPassword = [String] ()
        
        while !firstStepRandom.isEmpty {
            finalRandomPassword.append(firstStepRandom.remove(at: firstStepRandom.count.randomInt))
        }
        
        let stringofPassword = finalRandomPassword.joined()
        return stringofPassword
    }
}

private extension Int {
    var randomInt: Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
}
