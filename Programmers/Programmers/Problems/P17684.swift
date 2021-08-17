//
//  P17684.swift
//  Programmers
//
//  Created by 최호주 on 2021/08/17.
//

import Foundation

class P17684 {
    func solution(_ msg:String) -> [Int] {
        var answer: [Int] = []

        var map: [String: Int] = [:]
        (65..<(65+26)).map { String(UnicodeScalar($0)) }
            .enumerated()
            .forEach { map[$0.element] = $0.offset + 1}

        var i = msg.startIndex
        var j = msg.startIndex

        while i < msg.endIndex {
            while j < msg.endIndex {
                let key = String(msg[i...j])
                if let _ = map[key] {
                    j = msg.index(after: j)
                    continue
                } else {
                    break
                }
            }

            if j == msg.endIndex {
                let key = String(msg[i..<msg.endIndex])
                answer.append(map[key]!)
            } else {
                let key = String(msg[i...j])
                map[key] = map.count + 1
                answer.append(map[String(msg[i..<j])]!)
            }

            i = j
        }

        return answer
    }
}
