//
//  P82612.swift
//  Programmers
//
//  Created by 최호주 on 2021/08/06.
//

import Foundation

class P82612 {
    func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
        let p = Int64(price)
        let m = Int64(money)
        let c = Int64(count)
        
        return max((p * c * (c + 1) / 2) - m, 0)
    }
}
