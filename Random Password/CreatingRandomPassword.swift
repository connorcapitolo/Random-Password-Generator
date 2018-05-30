//
//  CreatingRandomPassword.swift
//  Random Password
//
//  Created by Connor Capitolo on 3/25/18.
//  Copyright © 2018 Connor Capitolo. All rights reserved.
//

import Foundation

class CreatingRandomPassword {
    
    //creates the random passowrd based on user input for the number of lowercase letters, uppercase letter, numbers, and symbol
    func randomPassword (at numLowerCase: Int, at numUpperCase: Int, at numNumber: Int, at numSymbol: Int) -> String {
        var firstStepRandom = [String] ()
        
        //appends random elements from the lowerCaseLetters arrays to the firstStepRandom array
        for _ in 0..<numLowerCase {
            firstStepRandom.append(characters.lowerCaseLetters[characters.lowerCaseLetters.count.randomInt])
        }
        
        //appends random elements from the upperCaseLetters arrays to the firstStepRandom array
        for _ in 0..<numUpperCase {
            firstStepRandom.append(characters.upperCaseLetters[characters.upperCaseLetters.count.randomInt])
        }
        
        //appends random elements from the numbers arrays to the firstStepRandom array
        for _ in 0..<numNumber {
            firstStepRandom.append(characters.numbers[characters.numbers.count.randomInt])
        }
        
        //appends random elements from the symbols arrays to the firstStepRandom array
        for _ in 0..<numSymbol {
            firstStepRandom.append(characters.symbols[characters.symbols.count.randomInt])
        }
 
        var finalRandomPassword = [String] ()
        
        //removes random elements from firstRandomPassword array and appends them to finalRandomPassword array so that all letters, numbers, and symbols are not together
        while !firstStepRandom.isEmpty {
            finalRandomPassword.append(firstStepRandom.remove(at: firstStepRandom.count.randomInt))
        }
        
        let stringofPassword = finalRandomPassword.joined()
        return stringofPassword
    }
}

//extension that produces a random integer
private extension Int {
    var randomInt: Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
}

//acceptable characters for the four different options
private struct characters {
    static let lowerCaseLetters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    static let numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
    static let upperCaseLetters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Y"]
    static let symbols = ["!", "\"", "#", "@", "#", "$", "%", "&", "*", "?", "="]
}
