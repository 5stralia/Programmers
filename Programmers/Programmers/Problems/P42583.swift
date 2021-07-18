//
//  P42583.swift
//  Programmers
//
//  Created by 최호주 on 2021/07/18.
//

import Foundation

class P42583 {
    
    func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
        var trucks = truck_weights[1...]
        var queue: [(Int, Int)] = [(truck_weights.first!, bridge_length - 1)]
        
        for time in (1...) {
            if queue.isEmpty { return time }
            
            if let w = trucks.first,
               queue.reduce(0, { $0 + ($1.1 == 0 ? 0 : $1.0) }) + w <= weight {
                trucks.removeFirst()
                queue.append((w, bridge_length))
            }
            
            queue = queue.filter({$0.1 > 0})
                .map {($0.0, $0.1 - 1)}
        }
        
        return 0
    }
}
