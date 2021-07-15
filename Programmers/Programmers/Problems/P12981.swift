//
//  P12981.swift
//  Programmers
//
//  Created by 최호주 on 2021/07/15.
//

import Foundation

class P12981 {
    func solution(_ n:Int, _ words:[String]) -> [Int] {
        var said: Set<String> = Set(arrayLiteral: words.first!)
        
        var lastCharacter: Character = words.first!.last!
        
        for (offset, word) in words[1...].enumerated() {
            if said.contains(word) || word.first! != lastCharacter {
                let order = ((offset + 1) / n) + 1
                let person = ((offset + 1) % n) + 1
                print("\(offset) \(word)")
                return [person, order]
            } else {
                said.insert(word)
                lastCharacter = word.last!
            }
        }
        
        return [0, 0]
    }
}
