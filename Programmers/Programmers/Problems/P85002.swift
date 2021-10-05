//
//  P85002.swift
//  Programmers
//
//  Created by 최호주 on 2021/10/05.
//

import Foundation

func solution(_ weights:[Int], _ head2head:[String]) -> [Int] {
    let ans = (0..<weights.count).map { $0 }
    
    let rating: [Double] = head2head.map { h in
        let count = Double(h.filter { $0 == "W" }.count)
        let total = Double(h.filter { $0 != "N" }.count)
        
        if total == 0 {
            return 0
        } else {
            return count / total
        }
    }
    
    let heavyRating = head2head.enumerated().map { offset, element in
        element.enumerated().filter { o, e in
            e == "W"
            && (weights[offset] < weights[o])
        }
        .count
    }
    
    return ans.sorted(by: { lhs, rhs in
        if rating[lhs] != rating[rhs] {
            return rating[lhs] > rating[rhs]
        } else {
            if heavyRating[lhs] != heavyRating[rhs] {
                return heavyRating[lhs] > heavyRating[rhs]
            } else {
                if weights[lhs] != weights[rhs] {
                    return weights[lhs] > weights[rhs]
                } else {
                    return lhs < rhs
                }
            }
        }
    })
        .map { $0 + 1 }
}
