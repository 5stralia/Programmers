import Foundation

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
        recommandID = recommandID.removeSubrange([15..<recommandID.endIndex])
        
        if recommandID.last == "." {
            recommandID.removeLast()
        }
    }
    
    // step 7
    if recommandID.count <= 2 {
        recommandID.append(String(recommandID.lastfo))
    }
    
    return recommandID
}

//assert(solution("...!@BaT#*..y.abcdefghijklm") == "bat.y.abcdefghi")


print(solution("...!@BaT#*..y.abcdefghijklm"))
