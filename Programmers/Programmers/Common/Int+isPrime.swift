//
//  Int + isPrime.swift
//  Programmers
//
//  Created by 최호주 on 2021/07/05.
//

import Foundation

extension Int {
    func isPrime() -> Bool {
        guard self >= 2 else { return false }
        
        if self == 2 {
            return true
        } else if self == 3 {
            return true
        }

        for i in (2..<self / 2) {
            if self % i == 0 {
                return false
            }
        }

        return true
    }
}
