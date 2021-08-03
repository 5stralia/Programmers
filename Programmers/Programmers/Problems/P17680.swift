//
//  P17680.swift
//  Programmers
//
//  Created by 최호주 on 2021/08/03.
//

import Foundation

class P17680 {
    func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
        var time = 0
        var cache = [String]()
        
        cities
            .map{ $0.lowercased() }
            .forEach {
                if let itemIndex = cache.firstIndex(of: $0) {
                    time += 1
                    cache.remove(at: itemIndex)
                    if cache.count < cacheSize {
                        cache.append($0)
                    }
                } else {
                    time += 5
                    if cache.count >= cacheSize,
                      !cache.isEmpty {
                        cache.removeFirst()
                    }
                    if cache.count < cacheSize {
                        cache.append($0)
                    }
                }
            }
        
        return time
    }
}
