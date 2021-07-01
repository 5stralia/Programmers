import Foundation

//func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
//    var map = Array(repeating: Array(repeating: "#", count: n), count: n)
//
//    (0..<n).forEach { i in
//        let line1 = String(arr1[i], radix: 2)
//        let line2 = String(arr2[i], radix: 2)
//
//        (0..<n).forEach { j in
//            if line1[line1.index(line1.startIndex, offsetBy: j)] == "0"
//                && line2[line2.index(line2.startIndex, offsetBy: j)] == "0" {
//                map[i][j] = " "
//            }
//        }
//    }
//
//    return map.map {
//        $0.reduce("", +)
//    }
//}

//solution(5, [9, 20, 28, 18, 11], [30, 1, 21, 17, 28])

let str = "00110"
(0..<str.count).forEach {
    print(str[str.index(str.startIndex, offsetBy: $0)])
}
