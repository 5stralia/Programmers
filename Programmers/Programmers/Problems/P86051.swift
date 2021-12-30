//
//  P86051.swift
//  Programmers
//
//  Created by Hoju Choi on 2021/12/30.
//

import Foundation

/*
 assertValue(problem.solution([1,2,3,4,6,7,8,0]), 14)
 assertValue(problem.solution([5,8,4,0,6,7,9]), 6)
 */

class P86051 {
    func solution(_ numbers:[Int]) -> Int {
        var isExists: [Bool] = Array(repeating: false, count: 10)
        
        for number in numbers {
            isExists[number] = true
        }
        
        return isExists.enumerated().reduce(0, { (prev, element) in
            return element.element ? prev : prev + element.offset
        })
    }
}
