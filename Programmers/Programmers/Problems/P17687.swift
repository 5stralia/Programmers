//
//  P17687.swift
//  Programmers
//
//  Created by 최호주 on 2021/08/12.
//

import Foundation

class P17687 {
    func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
        var num = 0
        var queue: [Character] = []
        var answer = ""
        
        for i in stride(from: 1, to: (m * t) + 1, by: 1) {
             if queue.isEmpty {
                queue.append(contentsOf: String(num, radix: n).map({ $0 }))
                num += 1
            }
                
            let nextItem = queue.removeFirst()
            if (i % m == p) || (i % m == 0 && p == m) {
                answer += String(nextItem).uppercased()
            }
        }
        
        return answer
    }
}
