//
//  P67257.swift
//  Programmers
//
//  Created by 최호주 on 2021/07/07.
//

import Foundation

class P67257 {
    func solution(_ expression:String) -> Int64 {
        let priorities: [[Character]] = [
            ["*", "+", "-"],
            ["*", "-", "+"],
            ["+", "*", "-"],
            ["+", "-", "*"],
            ["-", "+", "*"],
            ["-", "*", "+"]
        ]
        
        var maxAmount: Int64 = 0

        priorities
            .forEach { priority in
                var operatorStack: [Character] = []
                var numberStack: [Int64] = []

                var number: Int64 = 0
                expression
                    .forEach { ch in
                        if ch.isNumber {
                            number = (number * 10) + Int64(String(ch))!
                        } else {
                            numberStack.append(number)
                            
                            while (!operatorStack.isEmpty) {
                                if let top = operatorStack.last,
                                   let topPriority = priority.firstIndex(of: top),
                                   let currentPriority = priority.firstIndex(of: ch) {
                                    if currentPriority < topPriority {
                                        break
                                    } else {
                                        let n1 = numberStack.removeLast()
                                        let n2 = numberStack.removeLast()
                                        let newNumber = calc(n2, top, n1)
                                        numberStack.append(newNumber)
                                        operatorStack.removeLast()
                                    }
                                }
                            }
                            
                            operatorStack.append(ch)
                            number = 0
                        }
                    }

                numberStack.append(number)
                
                var result = numberStack.removeLast()
                operatorStack.reversed().forEach { op in
                    result = calc(numberStack.removeLast(), op, result)
                }
                      
                result = result > 0 ? result : -result
                      
                if maxAmount < result {
                    maxAmount = result
                }
            }

        return maxAmount
    }

    func calc(_ n1: Int64, _ op: Character, _ n2: Int64) -> Int64 {
        switch op {
        case "+":
            return n1 + n2
        case "-":
            return n1 - n2
        case "*":
            return n1 * n2
        default:
            return 0
        }
    }
}
