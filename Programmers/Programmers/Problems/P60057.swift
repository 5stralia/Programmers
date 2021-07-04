//
//  P60057.swift
//  Programmers
//
//  Created by 최호주 on 2021/07/04.
//

import Foundation

class P60057 {
    func solution(_ s:String) -> Int {
        var minCount = s.count
        
        guard s.count > 1 else { return 1 }
        
        for length in (1...(s.count / 2)) {
            var resultString = ""
            
            var subStringCount = 1
            var subString = s[s.startIndex..<s.index(s.startIndex, offsetBy: length)]
            
            for i in stride(from: length, to: s.count, by: length) {
                let startIndex = s.index(s.startIndex, offsetBy: i)
                let endIndex = (i + length) >= s.count
                    ? s.endIndex
                    : s.index(s.startIndex, offsetBy: (i + length))
                
                let nextSubString = s[startIndex..<endIndex]
                
                if subString == String(nextSubString) {
                    subStringCount += 1
                } else {
                    resultString.append("\(subStringCount > 1 ? String(subStringCount) : "")\(subString)")
                    subStringCount = 1
                    subString = nextSubString
                }
            }
            
            resultString.append("\(subStringCount > 1 ? String(subStringCount) : "")\(subString)")
            
            if minCount > resultString.count {
                minCount = resultString.count
            }
        }
        
        return minCount
    }
}
