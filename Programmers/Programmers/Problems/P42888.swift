//
//  P42888.swift
//  Programmers
//
//  Created by 최호주 on 2021/07/12.
//

import Foundation

class P42888 {
    func solution(_ record:[String]) -> [String] {
        var result: [String] = []
        
        var names: [String: String] = [:]
        
        for r in record {
            let arr = r.split(separator: " ").map({ String($0) })
            
            if arr.first == "Enter" {
                names[arr[1]] = arr[2]
            } else if arr.first == "Change" {
                names[arr[1]] = arr[2]
            }
        }
        
        for r in record {
            let arr = r.split(separator: " ").map({ String($0) })
            
            if arr.first == "Enter" {
                result.append("\(names[arr[1]]!)님이 들어왔습니다.")
            } else if arr.first == "Leave" {
                result.append("\(names[arr[1]]!)님이 나갔습니다.")
            }
        }
        
        return result
    }
}
