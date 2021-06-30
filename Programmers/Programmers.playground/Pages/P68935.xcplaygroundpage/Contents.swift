import Foundation

func solution(_ n:Int) -> Int {
    return Int(String(n, radix: 3, uppercase: true).reduce("", { String($1) + $0 }),
               radix: 3)!
    
}

assert(solution(45) == 7)
assert(solution(125) == 229)

func number(_ n: Int, radix: Int) -> String {
    var result = ""
    
    var num = n
    while num > 0 {
        let remain = num % radix
        result = alpha(remain) + result
        num = num / radix
    }
    
    return result
}

func alpha(_ n: Int) -> String {
    switch n {
    case 0...9:
        return String(n)
    case 10:
        return "A"
    case 11:
        return "B"
    case 12:
        return "C"
    case 13:
        return "D"
    case 14:
        return "E"
    case 15:
        return "F"
    default:
        return ""
    }
}

number(45, radix: 3)
