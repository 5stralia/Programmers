//
//  P84512.swift
//  Programmers
//
//  Created by 최호주 on 2021/10/01.
//

import Foundation

let alphabets = ["A", "E", "I", "O", "U"]
var dict: [String] = []

func solution(_ word:String) -> Int {
    for a in alphabets {
        add(a)
    }
    
    return dict.firstIndex(of: word)! + 1
}

func add(_ word: String) {
    if word.count > 5 { return }
    
    dict.append(word)
    
    for a in alphabets {
        add(word + a)
    }
}
