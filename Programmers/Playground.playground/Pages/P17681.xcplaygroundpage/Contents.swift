import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var map = Array(repeating: Array(repeating: "#", count: n), count: n)
    
    (0..<map.endIndex).forEach { i in
        let line1String = String(arr1[i], radix: 2)
        let line2String = String(arr2[i], radix: 2)
        
        let line1 = String(repeating: "0", count: n - line1String.count) + line1String
        let line2 = String(repeating: "0", count: n - line2String.count) + line2String

        (0..<map.endIndex).forEach { j in
            if line1[line1.index(line1.startIndex, offsetBy: j)] == "0"
                && line2[line2.index(line2.startIndex, offsetBy: j)] == "0" {
                    map[i][j] = " "
                }
        }


    }
    
    return map.map {
        $0.reduce("", +)
    }
}

solution(5, [9, 20, 28, 18, 11], [30, 1, 21, 17, 28])
