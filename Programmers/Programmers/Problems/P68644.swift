//
//  P68644.swift
//  Programmers
//
//  Created by 최호주 on 2021/07/05.
//

import Foundation

class P68644 {
    func solution(_ numbers:[Int]) -> [Int] {
        var result = Set<Int>()
        
        numbers.enumerated().forEach { (offset, number) in
            numbers[(offset + 1)...].forEach {
                result.insert(number + $0)
            }
        }
        
        return result.sorted()
    }

    func asserting() {
        assert(solution([2,1,3,4,1]) == [2,3,4,5,6,7])
        assert(solution([5,0,2,7]) == [2,5,7,9,12])
        
        print("asserting done")
    }
}
