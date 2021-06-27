import Foundation

public func assertEqaul<T: Comparable>(_ item: T, result: T) {
    if item == result {
        print("[Pass] item: \(item), result: \(result)")
    } else {
        print("[Fail] item: \(item), result: \(result)")
    }
}
