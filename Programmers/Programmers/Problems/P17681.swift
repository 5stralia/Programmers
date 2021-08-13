//
//  P17681.swift
//  Programmers
//
//  Created by 최호주 on 2021/07/05.
//

import Foundation

class P17681 {
    func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
        var map = Array(repeating: Array(repeating: "#", count: n), count: n)
        
        (0..<map.endIndex).forEach { i in
            let line1String = String(arr1[i], radix: 2)
            let line2String = String(arr2[i], radix: 2)
            
            let line1 = String(repeating: "0", count: n - line1String.count) + line1String
            let line2 = String(repeating: "0", count: n - line2String.count) + line2String

            (0..<map.endIndex).forEach { j in
                if line1[line1.index(line1.startIndex, offsetBy: j)] == "0"
                    && line2[line2.index(line2.startIndex, offsetBy: j)] == "0" {
                        map[i][j] = " "
                    }
            }


        }
        
        return map.map {
            $0.reduce("", +)
        }
    }
    
    // 비트 연산자 사용
    func solution2(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
        return (0..<n)
        .map { arr1[$0] | arr2[$0] }
        .map {
            String($0, radix: 2)
            .replacingOccurrences(of: "1", with: "#")
            .replacingOccurrences(of: "0", with: " ")
        }
        .map { String(repeating: " ", count: n - $0.count) + $0 }
    }
}
