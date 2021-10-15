//
//  P86491.swift
//  Programmers
//
//  Created by 최호주 on 2021/10/15.
//

import Foundation

class P86491 {
    func solution(_ sizes:[[Int]]) -> Int {
        let size = sizes.map { $0.sorted() }
            .reduce((0, 0), {
                var width = $0.0
                var height = $0.1
                
                if width < $1[0] {
                    width = $1[0]
                }
                
                if height < $1[1] {
                    height = $1[1]
                }
                
                return (width, height)
            })
        
        return size.0 * size.1
    }
}
