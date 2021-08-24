//
//  P77485.swift
//  Programmers
//
//  Created by 최호주 on 2021/08/25.
//

import Foundation

class P77485 {
    func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
        var answer: [Int] = []
        
        var map = (0..<rows).map { row in (1...columns).map { col in (row * columns) + col }}
        
        queries
            .map { query in query.map { $0 - 1} }
            .forEach { q in
                let temp = map[q[0]][q[1]]
                var minValue = temp
                
                for i in stride(from: q[0], to: q[2], by: 1) {
                    let j = q[1]
                    map[i][j] = map[i + 1][j]
                    minValue = min(minValue, map[i + 1][j])
                }
                
                for j in stride(from: q[1], to: q[3], by: 1) {
                    let i = q[2]
                    map[i][j] = map[i][j + 1]
                    minValue = min(minValue, map[i][j + 1])
                }
                
                for i in stride(from: q[2], to: q[0], by: -1) {
                    let j = q[3]
                    map[i][j] = map[i - 1][j]
                    minValue = min(minValue, map[i - 1][j])
                }
                
                for j in stride(from: q[3], to: q[1] + 1, by: -1) {
                    let i = q[0]
                    map[i][j] = map[i][j - 1]
                    minValue = min(minValue, map[i][j - 1])
                }
                
                map[q[0]][q[1] + 1] = temp
                
                answer.append(minValue)
            }
        
        return answer
    }
}
