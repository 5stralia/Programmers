//
//  BinarySearch.swift
//  Programmers
//
//  Created by 최호주 on 2021/07/29.
//

import Foundation

extension Array where Element: Comparable {
    func binarySearch(_ element: Element) -> Array.Index {
        return self.binarySearch(left: self.startIndex, right: self.endIndex, element: element)
    }
    
    private func binarySearch(left: Array.Index, right: Array.Index, element: Element) -> Array.Index {
        guard left < right else { return left }
        
        let centerIndex = (left + right) / 2
        let centerItem = self[centerIndex]
        
        if element <= centerItem {
            return binarySearch(left: left, right: centerIndex, element: element)
        } else {
            return binarySearch(left: centerIndex + 1, right: right, element: element)
        }
    }
}
