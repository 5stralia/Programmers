//
//  P12980.swift
//  Programmers
//
//  Created by 최호주 on 2021/08/04.
//

import Foundation

class P12980 {
    func solution(_ n:Int) -> Int{
        var position = n
        var answer = 0
        
        while position > 0 {
            answer += position % 2
            position /= 2
        }
        
        return answer
    }
}
