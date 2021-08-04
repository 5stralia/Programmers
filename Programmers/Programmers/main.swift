//
//  main.swift
//  Programmers
//
//  Created by 최호주 on 2021/07/04.
//

import Foundation

while true {
    if let input = readLine(),
       let i = Int(input) {
        print(P12980().solution(i))
    }
}
