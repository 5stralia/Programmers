//
//  P68645.swift
//  Programmers
//
//  Created by 최호주 on 2021/08/19.
//

import Foundation

class P68645 {
    func solution(_ n:Int) -> [Int] {
        var snail: [[Int]] = []
        
        for i in (1...n) {
            let line = Array(repeating: 0, count: i)
            snail.append(line)
        }
        
        snail[0][0] = 1
        
        var num = 2
        let lastNum = (n * (n + 1)) / 2
        
        var index = (0, 0)
        
        while num <= lastNum {
            while index.0 + 1 < n,
            snail[index.0 + 1][index.1] == 0 {
                index.0 += 1
                snail[index.0][index.1] = num
                num += 1
            }
            
            while index.1 + 1 < snail[index.0].count,
            snail[index.0][index.1 + 1] == 0 {
                index.1 += 1
                snail[index.0][index.1] = num
                num += 1
            }
            
            while index.0 - 1 >= 0,
            index.1 - 1 >= 0,
            snail[index.0 - 1][index.1 - 1] == 0 {
                index.0 -= 1
                index.1 -= 1
                snail[index.0][index.1] = num
                num += 1
            }
        }
        
        return snail.reduce([], { $0 + $1 })
    }
}
