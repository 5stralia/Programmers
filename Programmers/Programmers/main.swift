//
//  main.swift
//  Programmers
//
//  Created by 최호주 on 2021/07/04.
//

import Foundation

func assertValue<T: Equatable>(_ value1: T, _ value2: T, message: String = "Fail") {
    assert(value1 == value2, message)
}

let problem = P86051()

assertValue(problem.solution([1,2,3,4,6,7,8,0]), 14)
assertValue(problem.solution([5,8,4,0,6,7,9]), 6)
