//
//  P12977.swift
//  Programmers
//
//  Created by 최호주 on 2021/07/05.
//

import Foundation

class P12977 {
    var count = 0
    
    func solution(_ nums:[Int]) -> Int {
        count = 0
        per([], additions: nums)

        return count
    }

    func per(_ nums: [Int], additions: [Int]) {
        guard nums.count < 3,
              !additions.isEmpty
        else {
            if nums.count == 3,
                nums.reduce(0, +).isPrime() {
                count += 1
            }

            return
        }

        additions.enumerated().forEach {
            per(nums + [$0.element], additions: Array(additions[($0.offset + 1)...]))
        }
    }
    
    func asserting() {
        assert(solution([1,2,3,4]) == 1)
        assert(solution([1,2,7,6,4]) == 4)
        
        print("asserting done")
    }
}
