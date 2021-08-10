//
//  P83201.swift
//  Programmers
//
//  Created by 최호주 on 2021/08/10.
//

import Foundation

class P83201 {
    func solution(_ scores:[[Int]]) -> String {
        var students: [Double] = []
        
        for i in (0..<scores.count) {
            var total: Int = 0
            var maxScore: Int = 0
            var minScore: Int = 100
            for j in (0..<scores.count) {
                if j == i {
                    continue
                }
                
                total += scores[j][i]
                maxScore = max(maxScore, scores[j][i])
                minScore = min(minScore, scores[j][i])
            }
            
            if scores[i][i] <= maxScore
            && scores[i][i] >= minScore {
                total += scores[i][i]
                students.append(Double(total) / Double(scores.count))
            } else {
                students.append(Double(total) / Double(scores.count - 1))
            }
        }
        
        return students.reduce("", {$0 + score($1)})
    }

    func score(_ score: Double) -> String {
        if score >= 90 {
            return "A"
        } else if score >= 80 {
            return "B"
        } else if score >= 70 {
            return "C"
        } else if score >= 50 {
            return "D"
        } else {
            return "F"
        }
        
    }
}
