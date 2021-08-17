//
//  P49994.swift
//  Programmers
//
//  Created by 최호주 on 2021/08/17.
//

import Foundation

class P49994 {
    struct Road: Equatable {
        let fromX: Int
        let fromY: Int
        let toX: Int
        let toY: Int
    }
    
    func solution(_ dirs:String) -> Int {
        var answer = 0
        
        var visited: [Road] = []
        
        var position = (0, 0)
        
        for d in dirs {
            let m = moving(d)
            
            let nextPosition = (position.0 + m.0, position.1 + m.1)
            
            guard nextPosition.0 >= -5 && nextPosition.0 <= 5 && nextPosition.1 >= -5 && nextPosition.1 <= 5
            else { continue }
            
            if visited.contains(Road(fromX: position.0, fromY: position.1, toX: nextPosition.0, toY: nextPosition.1))
                || visited.contains(Road(fromX: nextPosition.0, fromY: nextPosition.1, toX: position.0, toY: position.1)) {
                
            } else {
                answer += 1
                visited.append(Road(fromX: position.0, fromY: position.1, toX: nextPosition.0, toY: nextPosition.1))
            }
            
            position = nextPosition
        }
        
        return answer
    }

    func moving(_ d: Character) -> (Int, Int) {
        if d == "U" {
            return (0, 1)
        } else if d == "D" {
            return (0, -1)
        } else if d == "R" {
            return (1, 0)
        } else if d == "L" {
            return (-1, 0)
        } else {
            return (0, 0)
        }
    }
}
