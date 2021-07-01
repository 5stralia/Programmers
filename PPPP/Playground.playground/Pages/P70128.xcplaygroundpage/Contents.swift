import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    a.enumerated().reduce(0, {
        return $0 + ($1.element * b[$1.offset])
    })
}

assert(solution([1,2,3,4], [-3,-1,0,2]) == 3)
