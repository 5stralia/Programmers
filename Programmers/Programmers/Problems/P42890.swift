//
//  P42890.swift
//  Programmers
//
//  Created by 최호주 on 2021/07/16.
//

import Foundation

class P42890 {
    func solution(_ relation:[[String]]) -> Int {
        var candidateKeys: [Set<Int>] = []
        var comb: [[Int]] = [[]]

        for i in (1...relation.first!.count) {
            comb += (0..<relation.first!.count).map({$0}).combination(i)
        }
        
        for c in comb {
            if isCandidateKey(c, relation) {
                candidateKeys.append(Set(c))
            }
        }
        
        candidateKeys = candidateKeys.filter {isCandidateKey($0, candidateKeys)}
        
        let maxLength = candidateKeys.reduce(0, { $0 < $1.count ? $1.count : $0 })
        return maxLength
    }

    func isCandidateKey(_ c: [Int], _ relation: [[String]]) -> Bool {
        var candidates = Set<[String]>()
            
            for r in relation {
                let tuple = c.map({r[$0]})
                
                if candidates.contains(tuple) {
                    return false
                }
                
                candidates.insert(tuple)
            }
        
        return true
    }

    func isCandidateKey(_ c: Set<Int>, _ keys: [Set<Int>]) -> Bool {
        let subKeys = keys.filter { $0.count < c.count }
        for k in subKeys {
            if k.isSubset(of: c) {
                return false
            }
        }
        
        return true
    }
}
