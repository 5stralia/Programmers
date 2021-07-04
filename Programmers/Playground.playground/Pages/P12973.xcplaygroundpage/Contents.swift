import Foundation

func solution(_ s:String) -> Int {
    var stack: [Character] = []
    
    s.forEach {
        if let top = stack.last,
        top == $0 {
            stack.removeLast()
        } else {
            stack.append($0)
        }
    }
    
    return stack.isEmpty ? 1 : 0
}

stride(from: 1, to: 10, by: 2).forEach{
    print($0)
}
