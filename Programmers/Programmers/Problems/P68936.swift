//
//  P68936.swift
//  Programmers
//
//  Created by 최호주 on 2021/08/18.
//

import Foundation

class P68936 {
    func solution(_ arr:[[Int]]) -> [Int] {
        return compress(arr, fromX: 0, fromY: 0, toX: arr.count - 1, toY: arr.count - 1)
    }

    func compress(_ arr: [[Int]],
                  fromX: Int,
                  fromY: Int,
                  toX: Int,
                  toY: Int) -> [Int] {
        guard toX != fromX,
              !shouldCompress(arr, fromX: fromX, fromY: fromY, toX: toX, toY: toY)
        else {
            if arr[fromY][fromX] == 0 {
                return [1, 0]
            } else {
                return [0, 1]
            }
        }
        
        var count = [0, 0]
        
        let centerX = (toX + fromX) / 2
        let centerY = (toY + fromY) / 2
        
        let slicing = [
            [fromX, fromY, centerX, centerY],
            [centerX + 1, fromY, toX, centerY],
            [fromX, centerY + 1, centerX, toY],
            [centerX + 1, centerY + 1, toX, toY]
        ]
        
        for s in slicing {
            let counts = compress(arr, fromX: s[0], fromY: s[1], toX: s[2], toY: s[3])
            count[0] += counts[0]
            count[1] += counts[1]
        }
        
        return count
    }

    func shouldCompress(_ arr: [[Int]],
                        fromX: Int,
                        fromY: Int,
                        toX: Int,
                        toY: Int) -> Bool {
        let value = arr[fromY][fromX]
        
        for y in (fromY...toY) {
            for x in (fromX...toX) {
                if value != arr[y][x] {
                    return false
                }
            }
        }
        
        return true
    }
}
