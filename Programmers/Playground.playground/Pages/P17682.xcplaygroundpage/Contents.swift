import Foundation

func solution(_ dartResult:String) -> Int {
    var score = 0
    var results: [Int] = []
    
    dartResult.forEach {
        if $0.isNumber {
            if score != 0 {
                score = score * 10 + Int(String($0))!
            } else {
                score = Int(String($0))!
            }
            
        } else if $0.isLetter {
            if $0 == "S" {
                // score = score
            } else if $0 == "D" {
                score = score * score
            } else if $0 == "T" {
                score = score * score * score
            }
            
            results.append(score)
            score = 0
            
        } else {
            if $0 == "*" {
                if results.count >= 2 {
                    results[results.endIndex - 2] = results[results.endIndex - 2] * 2
                }
                
                results[results.endIndex - 1] = results[results.endIndex - 1] * 2
            } else if $0 == "#" {
                results[results.endIndex - 1] = results[results.endIndex - 1] * -1
            }
        }
    }
    
    return results.reduce(0, +)
}
