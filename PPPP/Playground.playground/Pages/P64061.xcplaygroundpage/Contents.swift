import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var board = board
    var box = Stack<Int>()
    var deletedCount = 0
    
    moves.forEach { moveIndex in
        for depth in (0..<board.count) {
            let item = board[depth][moveIndex - 1]
            
            if item != 0 {
                if let top = box.peek(),
                   top == item {
                    box.pop()
                    deletedCount += 2
                } else {
                    box.push(item)
                }
                board[depth][moveIndex - 1] = 0
                
                break
            }
        }
    }
    
    return deletedCount
}

solution([[0,0,0,0,0],
          [0,0,1,0,3],
          [0,2,5,0,1],
          [4,2,4,4,2],
          [3,5,1,3,1]],
         [1,5,3,5,1,2,1,4])
