//
//  P17677.swift
//  Programmers
//
//  Created by 최호주 on 2021/07/05.
//

import Foundation

class P17677 {
    func solution(_ str1:String, _ str2:String) -> Int {
        let dic1 = subSet(str1.lowercased())
        var dic2 = subSet(str2.lowercased())

        guard !dic1.isEmpty || !dic2.isEmpty else { return 65536 }

        let count1 = dic1.reduce(0, {$0 + $1.value})
        let count2 = dic2.reduce(0, {$0 + $1.value})
        
        let unionCount = dic1.reduce(0, {
            if let count = dic2[$1.key], count > 0 {
                dic2[$1.key] = count >= $1.value ? count - $1.value : 0
                return $0 + (count >= $1.value ? $1.value : count)
            } else {
                return $0
            }
        })
        
        if unionCount > 0 {
            let jk = Double(unionCount) / Double((count1 + count2 - unionCount))
            return Int(jk * 65536)
        } else {
            return 0
        }
    }

    func subSet(_ s: String) -> [String: Int] {
        var result: [String:Int] = [:]

        var prevCharacter: Character = s[s.startIndex]

        s[s.index(after: s.startIndex)...]
            .forEach {
                let item = "\(prevCharacter)\($0)"
                if isLetter(item) {
                    if let count = result[item] {
                        result[item] = count + 1
                    } else {
                        result[item] = 1
                    }
                }

                prevCharacter = $0
            }

        return result
    }

    func isLetter(_ s: String) -> Bool {
        for ch in s {
            if !ch.isLetter {
                return false
            }
        }

        return true
    }
}
