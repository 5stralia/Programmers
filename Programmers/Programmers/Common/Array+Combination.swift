//
//  Array+Combination.swift
//  Programmers
//
//  Created by 최호주 on 2021/07/16.
//

import Foundation

extension Array {
    func combination(_ n: Int) -> [[Element]] {
        return self.combination(n, 0, [])
    }
    
    func combination(_ shouldSelectCount: Int,
                     _ currentIndex: Int,
                     _ selected: [Element]) -> [[Element]] {
        if shouldSelectCount == 0 {
            return [selected.reduce([], { $0 + [$1] })]
        } else if currentIndex == self.count {
            return []
        } else {
            let nextSelected = selected + [self[currentIndex]]
            
            return self.combination(shouldSelectCount - 1,
                                    currentIndex + 1,
                                    nextSelected)
                + self.combination(shouldSelectCount,
                                   currentIndex + 1,
                                   selected)
        }
    }
}
