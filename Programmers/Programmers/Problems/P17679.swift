//
//  P17679.swift
//  Programmers
//
//  Created by 최호주 on 2021/08/20.
//

import Foundation

class P17679 {
    struct Position: Hashable {
        let x: Int
        let y: Int
    }
    
    func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
        var answer = 0
        var map: [[Character?]] = board.map { line in line.map { $0 } }
        var deleting = Set<Position>()
        
        repeat {
            for position in deleting {
                map[position.y][position.x] = nil
                answer += 1
            }
            
            deleting.removeAll()
            
            for j in (0..<n) {
                for i in (0..<m).reversed() {
                    let value = map[i][j]
                    var toI = i + 1
                    while value != nil,
                          toI < m,
                          map[toI][j] == nil {
                        map[toI][j] = value
                        map[toI - 1][j] = nil
                        toI += 1
                    }
                }
            }
            
            for i in (0..<m) {
                for j in (0..<n) {
                    if j + 1 < n && i + 1 < m
                        && map[i][j] != nil
                        && (map[i][j] == map[i][j + 1] && map[i][j] == map[i + 1][j] && map[i][j] == map[i + 1][j + 1]) {
                        deleting.insert(Position(x: j, y: i))
                        deleting.insert(Position(x: j + 1, y: i))
                        deleting.insert(Position(x: j, y: i + 1))
                        deleting.insert(Position(x: j + 1, y: i + 1))
                    }
                }
            }
        } while (!deleting.isEmpty);
        
        
        return answer
    }
}
