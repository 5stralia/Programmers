import Foundation

func solution(_ n:Int) -> Int {
    return Int(String(n, radix: 3, uppercase: true).reduce("", { String($1) + $0 }),
               radix: 3)!
    
}

assert(solution(45) == 7)
assert(solution(125) == 229)

