//
//  P42890.swift
//  Programmers
//
//  Created by 최호주 on 2021/08/20.
//

import Foundation

class P42890 {
    func solution(_ relation:[[String]]) -> Int {
        var candidates: [Set<Int>] = []
        
        let keyCount = relation.first!.count
        
        var keys: [[Int]] = []
        for i in (1...keyCount) {
            keys += Array(0..<keyCount).combination(i)
        }
        
        // 유일성
        for key in keys {
            let values = relation.map { tuple in
                tuple.enumerated().filter { key.contains($0.offset) }.map { $0.element }
            }
            
            if Set(values).count == relation.count {
                candidates.append(Set(key))
            }
        }
        
        // 최소성
        var answer: [Set<Int>] = []
        
        while !candidates.isEmpty {
            let key = candidates.removeLast()
            if candidates.filter({ key.isSuperset(of: $0)}).isEmpty {
                answer.append(key)
            }
        }
        
        return answer.count
    }
}
