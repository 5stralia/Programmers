//
//  P87389.swift
//  Programmers
//
//  Created by Hoju Choi on 2021/12/30.
//

import Foundation

/*
 assertValue(problem.solution(10), 3)
 assertValue(problem.solution(12), 11)
 */

class P87389 {
    func isPrime(_ n: Int) -> Bool {
        guard n >= 2 else { return false }
        
        for i in stride(from: 2, through: Int(floor(sqrt(Double(n)))), by: 1) {
            if n % i == 0 {
                return false
            }
        }
        
        return true
    }
    
    func primes(_ n: Int) -> [Int] {
        guard n >= 2 else { return [] }
        
        var values: [Int] = []
        
        for i in stride(from: 2, through: n, by: 1) {
            if isPrime(i) {
                values.append(i)
            }
        }
        
        return values
    }
    
    func solution(_ n:Int) -> Int {
        let primeList = primes(n)
        
        for p in primeList {
            if n % p == 1 {
                return p
            }
        }
        
        fatalError()
    }
}
