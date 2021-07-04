//
//  P72410.swift
//  Programmers
//
//  Created by 최호주 on 2021/07/05.
//

import Foundation

class P72410 {
    func solution(_ new_id:String) -> String {
        // step 1
        var recommandID = new_id.lowercased()
        
        // step 2
        var allowedCharacterSet = CharacterSet.alphanumerics
        allowedCharacterSet.formUnion(CharacterSet.decimalDigits)
        allowedCharacterSet.formUnion(CharacterSet(charactersIn: "-_."))
        
        recommandID = recommandID.reduce("", {
            if allowedCharacterSet.isSuperset(of: CharacterSet(charactersIn: "\($1)")) {
                return "\($0)\($1)"
            } else {
                return $0
            }
        })
        
        // step 3
        recommandID = recommandID.reduce("", {
            if $0.last == ".",
               $1 == "." {
                return $0
            } else {
                return "\($0)\($1)"
            }
        })
        
        // step 4
        if recommandID.first == "." {
            recommandID.removeFirst()
        }
        if recommandID.last == "." {
            recommandID.removeLast()
        }
        
        // step 5
        if recommandID.isEmpty {
            recommandID = "a"
        }
        
        // step 6
        if recommandID.count >= 16 {
            let deletedIndex = recommandID.index(recommandID.startIndex, offsetBy: 15)
            recommandID.removeSubrange(deletedIndex...)
            
            if recommandID.last == "." {
                recommandID.removeLast()
            }
        }
        
        // step 7
        if recommandID.count <= 2 {
            recommandID.append(String(repeating: recommandID.last!, count: 3 - recommandID.count))
        }
        
        return recommandID
    }
    
    func asserting() {
        assert(solution("...!@BaT#*..y.abcdefghijklm") == "bat.y.abcdefghi")
        assert(solution("z-+.^.") == "z--")
        assert(solution("=.=") == "aaa")
        assert(solution("123_.def") == "123_.def")
        assert(solution("abcdefghijklmn.p") == "abcdefghijklmn")
        
        print("asserting done")
    }
}
