//
//  P76502.swift
//  Programmers
//
//  Created by 최호주 on 2021/07/14.
//

import Foundation

class P76502 {
    func solution(_ s:String) -> Int {
        var answer = 0
        
        for i in (0..<s.count) {
            let newString = s[s.index(s.startIndex, offsetBy: i)...] + s[s.startIndex..<s.index(s.startIndex, offsetBy: i)]
            
            var stack: [Character] = []
            
            for ch in newString {
                if let top = stack.last {
                    if top == "(" {
                        if ch == ")" {
                            stack.removeLast()
                        } else {
                            stack.append(ch)
                        }
                    } else if top == "{" {
                        if ch == "}" {
                            stack.removeLast()
                        } else {
                            stack.append(ch)
                        }
                    } else if top == "[" {
                        if ch == "]" {
                            stack.removeLast()
                        } else {
                            stack.append(ch)
                        }
                    }
                } else {
                    stack.append(ch)
                }
            }
            
            if stack.isEmpty {
                answer += 1
            }
        }
        
        return answer
    }
}
