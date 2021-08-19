//
//  P77885.swift
//  Programmers
//
//  Created by 최호주 on 2021/08/19.
//

import Foundation

class P77885 {
    func solution(_ numbers:[Int64]) -> [Int64] {
        return numbers.map { f($0) }
    }

    func f(_ x: Int64) -> Int64 {
        guard x % 2 != 0 else { return x + 1 }

        var nextXString = "0" + String(x, radix: 2)
        let zeroIndex = nextXString.lastIndex(of: "0")!
        let to = nextXString.index(after: zeroIndex)
        nextXString.replaceSubrange(zeroIndex...to, with: "10")

        return Int64(nextXString, radix: 2)!
    }
}
