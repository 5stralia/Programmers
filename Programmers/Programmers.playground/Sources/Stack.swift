import Foundation

public struct Stack<T> {
    var elements: [T] = []
    
    public init() { }
    
    public mutating func push(_ element: T) {
        self.elements.append(element)
    }
    
    public mutating func pop() -> T? {
        let element = self.elements.last
        self.elements.removeLast()
        return element
    }
    
    public func peek() -> T? {
        return self.elements.last
    }
    
    public func isEmpty() -> Bool {
        return self.elements.isEmpty
    }
    
    public func count() -> Int {
        return self.elements.count
    }
    
}
