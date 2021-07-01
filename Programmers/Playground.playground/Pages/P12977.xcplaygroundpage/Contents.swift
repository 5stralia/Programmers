import Foundation

var count = 0

func solution(_ nums:[Int]) -> Int {
    count = 0
    per([], additions: nums)

    return count
}

func per(_ nums: [Int], additions: [Int]) {
    guard nums.count < 3,
          !additions.isEmpty
    else {
        if nums.count == 3,
            nums.reduce(0, +).isPrime() {
            count += 1
        }

        return
    }

    additions.enumerated().forEach {
        per(nums + [$0.element], additions: Array(additions[($0.offset + 1)...]))
    }
}

extension Int {
    func isPrime() -> Bool {
        guard self >= 2 else { return false }
        
        if self == 2 {
            return true
        } else if self == 3 {
            return true
        }

        for i in (2..<self / 2) {
            if self % i == 0 {
                return false
            }
        }

        return true
    }
}

assert(solution([1,2,3,4]) == 1)
assert(solution([1,2,7,6,4]) == 4)
