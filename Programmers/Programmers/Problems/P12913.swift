//
//  P12913.swift
//  Programmers
//
//  Created by 최호주 on 2021/08/02.
//

import Foundation

class P12913 {
    func solution(_ land:[[Int]]) -> Int{
        var answer = land
        
        for i in (1..<answer.count) {
            answer[i][0] += max(answer[i-1][1], answer[i-1][2], answer[i-1][3])
            answer[i][1] += max(answer[i-1][0], answer[i-1][2], answer[i-1][3])
            answer[i][2] += max(answer[i-1][0], answer[i-1][1], answer[i-1][3])
            answer[i][3] += max(answer[i-1][0], answer[i-1][1], answer[i-1][2])
        }
        
        return answer.last!.max()!
    }
}
