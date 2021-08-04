//
//  P12980.swift
//  Programmers
//
//  Created by 최호주 on 2021/08/04.
//

import Foundation

class P12980 {
    func solution(_ n:Int) -> Int{
        var batterys: [Int] = Array(repeating: Int.max, count: n + 1)
        batterys[0] = 0
        batterys[1] = 1
        
        for i in (2..<batterys.count) {
            let jump = batterys[i - 1] + 1
            let teleportation = batterys[i / 2] + (i % 2)
            batterys[i] = min(jump, teleportation)
        }
        
        return batterys.last!
    }
}
