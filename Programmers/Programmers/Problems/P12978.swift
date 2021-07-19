//
//  P12978.swift
//  Programmers
//
//  Created by 최호주 on 2021/07/19.
//

import Foundation

class P12978 {
    func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
        var map: [[Int?]] = Array(repeating: Array(repeating: nil, count: N), count: N)
        
        for r in road {
            let from = r[0] - 1
            let to = r[1] - 1
            let distance = r[2]
            
            if let prevDistance = map[from][to] {
                if prevDistance > distance {
                    map[from][to] = distance
                    map[to][from] = distance
                }
            } else {
                map[from][to] = distance
                map[to][from] = distance
            }
        }
        
        var distances = Array(repeating: Int.max, count: N)
        var visit = Array(repeating: false, count: N)
        distances[0] = 0
        
        while !visit.reduce(true, { $0 && $1 }) {
            let nextIndex = distances.enumerated().sorted(by: {$0.element < $1.element}).filter({!visit[$0.offset]}).first!.offset
            visit[nextIndex] = true
            
            let nextDistance = distances[nextIndex]
            if nextDistance == Int.max { continue }
            
            for i in (0..<N) {
                if visit[i] {
                    continue
                }
                
                if let dist = map[nextIndex][i],
                    nextDistance + dist < distances[i] {
                    distances[i] = nextDistance + dist
                }
            }
        }
        
        return distances.filter({$0 <= k}).count
    }
}
