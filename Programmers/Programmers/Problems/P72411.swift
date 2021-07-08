//
//  P72411.swift
//  Programmers
//
//  Created by 최호주 on 2021/07/08.
//

import Foundation

class P72411 {
    func solution(_ orders:[String], _ course:[Int]) -> [String] {
        var answer: [String] = []
        
        for i in course {
            var map: [String: Int] = [:]
            
            for order in orders {
                combination(order.map({$0}).sorted(), i, 0, []).forEach {
                    if let count = map[$0] {
                        map[$0] = count + 1
                    } else {
                        map[$0] = 1
                    }
                }
            }
            
            let sortedMap = map.sorted(by: {$0.value > $1.value})
            if let maxCount = sortedMap.first?.value,
               maxCount >= 2 {
                let newCourse = sortedMap.filter({$0.value == maxCount})
                answer += newCourse.map({$0.key})
            }
        }
        
        return answer.sorted()
    }

    func combination(_ arr: [Character],
                     _ shouldSelectCount: Int,
                     _ currentIndex: Int,
                     _ selected: [Character]) -> [String] {
        if shouldSelectCount == 0 {
            return [selected.reduce("", { $0 + String($1) })]
        } else if currentIndex == arr.count {
            return []
        } else {
            let nextSelected = selected + [arr[currentIndex]]
            
            return combination(arr,
                               shouldSelectCount - 1,
                               currentIndex + 1,
                               nextSelected)
            + combination(arr,
                          shouldSelectCount,
                          currentIndex + 1,
                          selected)
        }
    }
}
