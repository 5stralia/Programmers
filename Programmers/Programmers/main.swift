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

let problem = P87389()
assertValue(problem.solution(10), 3)
assertValue(problem.solution(12), 11)
