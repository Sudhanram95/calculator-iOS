//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Sudhan Ram on 18/04/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var intermideateTuple: (n1: Double?, operation: String?)
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func performOperation(symbol: String) -> Double? {
        
        if let n = number {
            switch symbol {
            case "AC":
                return 0
            case "+/-":
                return n * -1
            case "%":
                return n / 100
            case "=":
                return generateResult(n2: n)
            default:
                intermideateTuple = (n1: n, operation: symbol)
            }
        }
        return nil
    }
    
    private func generateResult(n2: Double) -> Double? {
        
        if let n1 = intermideateTuple.n1, let symbol = intermideateTuple.operation {
            switch symbol {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                return nil
            }
        }
        
        return nil
    }
}
