//
//  P70128.swift
//  Programmers
//
//  Created by 최호주 on 2021/07/05.
//

import Foundation

class P70128 {
    func solution(_ a:[Int], _ b:[Int]) -> Int {
        a.enumerated().reduce(0, {
            return $0 + ($1.element * b[$1.offset])
        })
    }

    func asserting() {
        assert(solution([1,2,3,4], [-3,-1,0,2]) == 3)
        
        print("asserting done")
    }
}
