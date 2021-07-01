import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    let correctCount = lottos
        .filter { $0 != 0 }
        .filter { win_nums.contains($0) }
        .count
    
    let unknownCount = lottos
        .filter { $0 == 0 }
        .count
    
    let highest = rank(correctCount + unknownCount)
    let lowest = rank(correctCount)
    
    return [highest, lowest]
}

func rank(_ correctCount: Int) -> Int {
    switch correctCount {
    case 2:
        return 5
    case 3:
        return 4
    case 4:
        return 3
    case 5:
        return 2
    case 6:
        return 1
    default:
        return 6
    }
}

assert(solution([44, 1, 0, 0, 31, 25], [31, 10, 45, 1, 6, 19]) == [3, 5])
assert(solution([0, 0, 0, 0, 0, 0], [38, 19, 20, 40, 15, 25]) == [1, 6])
assert(solution([45, 4, 35, 20, 3, 9] ,[20, 9, 3, 45, 4, 35]) == [1, 1])
