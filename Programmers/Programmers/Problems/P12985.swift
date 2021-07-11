//
//  P12985.swift
//  Programmers
//
//  Created by 최호주 on 2021/07/10.
//

import Foundation

class P12985 {
    func solution(_ n:Int, _ a:Int, _ b:Int) -> Int {
        var answer = 0
        
        var player = n
        var A = a
        var B = b
        while(player > 0) {
            answer += 1
            player = player / 2
            
            A = nextNumber(A)
            B = nextNumber(B)
            
            if A == B {
                return answer
            }
        }
        
        return answer
    }
    
    func nextNumber(_ n: Int) -> Int {
        return (n + 1) / 2
    }
}

