//
//  P12905.swift
//  Programmers
//
//  Created by 최호주 on 2021/08/05.
//

import Foundation

class P12905 {
    func solution(_ board:[[Int]]) -> Int
    {
        var b = board
        for i in (0..<b.count) {
            for j in (0..<b[i].count) {
                if b[i][j] > 0 {
                    let top = i - 1 >= 0 ? b[i - 1][j] : 0
                    let left = j - 1 >= 0 ? b[i][j - 1] : 0
                    let topLeft = (i - 1 >= 0 && j - 1 >= 0) ? b[i - 1][j - 1] : 0
                    b[i][j] = min(top, left, topLeft) + 1
                }
            }
        }
        
        let length = b.reduce(0, {max($0, $1.reduce(0, {max($0, $1)}))})
        return length * length
    }
}
