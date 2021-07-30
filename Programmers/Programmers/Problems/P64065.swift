//
//  P64065.swift
//  Programmers
//
//  Created by 최호주 on 2021/07/30.
//

import Foundation

class P64065 {
    func solution(_ s:String) -> [Int] {
        var map: [Int: Int] = [:]
        
        var num = 0
        
        for ch in s {
            if let n = Int(String(ch)) {
                num = (num * 10) + n
            } else {
                if num != 0 {
                    if let count = map[num] {
                        map[num] = count + 1
                    } else {
                        map[num] = 1
                    }
                }
                num = 0
            }
        }
        
        return map.sorted(by: { $0.value > $1.value }).map({ $0.key })
    }
}
