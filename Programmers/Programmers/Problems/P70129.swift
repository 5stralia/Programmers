//
//  P70129.swift
//  Programmers
//
//  Created by 최호주 on 2021/08/18.
//

import Foundation

class P70129 {
    func solution(_ s:String) -> [Int] {
        var s = s
        
        var changing = 0
        var removing = 0
        
        while s != "1" {
            changing += 1
            
            removing += s.filter { $0 == "0" }.count
            s = s.replacingOccurrences(of: "0", with: "")
            
            s = String(s.count, radix: 2)
        }
        
        return [changing, removing]
    }
}
