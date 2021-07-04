//
//  P64061.swift
//  Programmers
//
//  Created by 최호주 on 2021/07/04.
//

import Foundation

class P64061 {
    func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
        var board = board
        var box: [Int] = []
        var deletedCount = 0
        
        moves.forEach { moveIndex in
            for depth in (0..<board.count) {
                let item = board[depth][moveIndex - 1]
                
                if item != 0 {
                    if let top = box.last,
                       top == item {
                        box.removeLast()
                        deletedCount += 2
                    } else {
                        box.append(item)
                    }
                    board[depth][moveIndex - 1] = 0
                    
                    break
                }
            }
        }
        
        return deletedCount
    }
    
    func asserting() -> Int {
        return solution([[0,0,0,0,0],
                  [0,0,1,0,3],
                  [0,2,5,0,1],
                  [4,2,4,4,2],
                  [3,5,1,3,1]],
                 [1,5,3,5,1,2,1,4])

    }
}
