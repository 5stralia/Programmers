//
//  P62048.swift
//  Programmers
//
//  Created by 최호주 on 2021/07/06.
//

import Foundation

class P62048 {
    func solution(_ w:Int, _ h:Int) -> Int64{
        var answer:Int64 = 0
        
        for i in (1..<w) {
            let y = -(h * i / w) + h
            let leaves = (h * i) % w
            let count = y - (leaves > 0 ? 1 : 0)
            
            answer += 2 * Int64(count)
        }

        return answer
    }
}
