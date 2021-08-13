//
//  P17686.swift
//  Programmers
//
//  Created by 최호주 on 2021/08/13.
//

import Foundation

class P17686 {
    func solution(_ files:[String]) -> [String] {
        return files.sorted(by: {
            let leftPart = getPart($0)
            let rightPart = getPart($1)

            if leftPart.head == rightPart.head {
                return leftPart.number < rightPart.number
            } else {
                return leftPart.head < rightPart.head
            }
        })
    }

    func getPart(_ s: String) -> (head: String, number: Int) {
        var head: String?
        var number: Int?

        for ch in s {
            if ch.isLetter || ch == " " || ch == "-" || ch == "." {
                if number != nil {
                    break
                } else if let prevHead = head {
                    head = prevHead + String(ch)
                } else {
                    head = String(ch)
                }
            }
            if ch.isHexDigit {
                if let prevNumber = number {
                    number = (10 * prevNumber) + Int(String(ch))!
                } else {
                    number = Int(String(ch))
                }
            }
        }

        return (head!.lowercased(), number!)
    }
}
