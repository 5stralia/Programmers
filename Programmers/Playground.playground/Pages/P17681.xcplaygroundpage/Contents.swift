import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var map = Array(repeating: Array(repeating: "#", count: n), count: n)
    
    (0..<n).forEach { i in
        let line1 = String(arr1[i], radix: 2)
        let line2 = String(arr2[i], radix: 2)
        
        (0..<n).forEach { j in
            if (line1 as NSString).character(at: j) == UInt16("0")
                && (line2 as NSString).character(at: j) == UInt16("0") {
                map[i][j] = " "
            }
        }
    }
    
    return map.map {
        $0.reduce("", +)
    }
}
