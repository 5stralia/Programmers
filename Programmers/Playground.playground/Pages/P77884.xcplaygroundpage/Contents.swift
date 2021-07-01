import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    return (left...right)
        .reduce(0, {
            $0 + (divisorCount($1) % 2 == 0 ? $1 : -$1)
        })
}

func divisorCount(_ n: Int) -> Int {
    return (1...Int(sqrt(Double(n))))
        .reduce(0, {
            if n % $1 == 0 {
                if $1 * $1 == n {
                    return $0 + 1
                } else {
                    return $0 + 2
                }
            } else {
                return $0
            }
        })
}

assert(solution(13, 17) == 43)
assert(solution(24, 27) == 52)
