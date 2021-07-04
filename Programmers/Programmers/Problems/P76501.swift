//
//  P76501.swift
//  Programmers
//
//  Created by 최호주 on 2021/07/05.
//

import Foundation

class P76501 {
    func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
        return absolutes.enumerated().reduce(0, {
            if signs[$1.offset] {
                return $0 + $1.element
            } else {
                return $0 - $1.element
            }
        })
    }

    func asserting() {
        assert(solution([4,7,12], [true,false,true]) == 9)
        assert(solution([1,2,3], [false,false,true]) == 0)
        
        print("asserting done")
    }
}
