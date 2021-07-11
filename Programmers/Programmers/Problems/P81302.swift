//
//  P81302.swift
//  Programmers
//
//  Created by 최호주 on 2021/07/11.
//

import Foundation

class P81302 {
    func solution(_ places:[[String]]) -> [Int] {
        var result = Array<Int>(repeating: 1, count: 5)
        
        for (offset, place) in places.enumerated() {
            let room = place.map({$0.map{$0}})
            
            if !isAllowedRoom(room: room) {
                result[offset] = 0
                continue
            }
        }
        
        return result
    }
    
    func isAllowedRoom(room: [[Character]]) -> Bool {
        for i in (0..<room.count) {
            for j in (0..<room[i].count) {
                if room[i][j] == "P" {
                    if !isAllowedPerson(stack: [], visited:[(i, j)], i: i, j: j, room: room) {
                        return false
                    }
                }
            }
        }
        
        return true
    }
    
    func isAllowedPerson(stack: [Character],
                         visited:[(Int, Int)],
                         i: Int,
                         j: Int,
                         room: [[Character]]) -> Bool {
        guard stack.count < 2 else { return stack.last! != "P" }
        
        let moving: [(x: Int, y: Int)] = [(-1, 0), (0, -1), (1, 0), (0, 1)]
        
        for m in moving {
            let movedX = i + m.x
            let movedY = j + m.y
            if (movedX < 0 || movedX >= room.count
                    || movedY < 0 || movedY >= room[i].count) {
                continue
            }
            if visited.contains(where: {$0 == movedX && $1 == movedY}) {
                continue
            }
            
            let nextItem = room[movedX][movedY]
            if nextItem == "X" {
                continue
            } else if nextItem == "P" {
                return false
            }
            
            let nextStack = stack + [room[movedX][movedY]]
            let nextVisited = visited + [(movedX, movedY)]
            if !isAllowedPerson(stack: nextStack, visited: nextVisited, i: movedX, j: movedY, room: room) {
                return false
            }
        }
        
        return true
    }
}
