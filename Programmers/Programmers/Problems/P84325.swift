//
//  P84325.swift
//  Programmers
//
//  Created by 최호주 on 2021/08/25.
//

import Foundation

class P84325 {
    func solution(_ table:[String], _ languages:[String], _ preference:[Int]) -> String {
        var jobs: [String] = []
        var map: [String: [String: Int]] = [:]
        for t in table {
            let arr = t.split(separator: " ").map { String($0) }
            
            jobs.append(arr[0])
            
            map[arr[0]] = [
                arr[1]: 5,
                arr[2]: 4,
                arr[3]: 3,
                arr[4]: 2,
                arr[5]: 1,
            ]
        }
        
        let scores = jobs.map { j in
            (j, languages.enumerated().reduce(0) {
                if let score = map[j]![$1.element] {
                    return $0 + score * preference[$1.offset]
                } else {
                    return $0
                }
            })
        }
        
        return scores.sorted() {
            if $0.1 == $1.1 {
                return $0.0 < $1.0
            } else {
                return $0.1 > $1.1
            }
        }
        .first!
        .0
    }
}
