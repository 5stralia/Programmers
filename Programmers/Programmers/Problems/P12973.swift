//
//  P12973.swift
//  Programmers
//
//  Created by 최호주 on 2021/07/05.
//

import Foundation

class P12973 {
    func solution(_ s:String) -> Int {
        var stack: [Character] = []
        
        s.forEach {
            if let top = stack.last,
            top == $0 {
                stack.removeLast()
            } else {
                stack.append($0)
            }
        }
        
        return stack.isEmpty ? 1 : 0
    }
}
