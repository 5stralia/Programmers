import Foundation

class P67256 {
    func solution(_ numbers:[Int], _ hand:String) -> String {
        var leftPosition = (3, 0)
        var rightPosition = (3, 2)
        
        return numbers.reduce("", {
            switch $1 {
            case 1:
                leftPosition = (0, 0)
                return $0 + "L"
                
            case 4:
                leftPosition = (1, 0)
                return $0 + "L"
                
            case 7:
                leftPosition = (2, 0)
                return $0 + "L"
                
            case 3:
                rightPosition = (0, 2)
                return $0 + "R"
                
            case 6:
                rightPosition = (1, 2)
                return $0 + "R"
                
            case 9:
                rightPosition = (2, 2)
                return $0 + "R"
                
            case 2:
                let moved = movedHand(number: 2,
                                      hand: hand,
                                      leftPosition: leftPosition,
                                      rightPosition: rightPosition)
                
                leftPosition = moved.leftPosition
                rightPosition = moved.rightPosition
                return $0 + moved.result
                
            case 5:
                let moved = movedHand(number: 5,
                                      hand: hand,
                                      leftPosition: leftPosition,
                                      rightPosition: rightPosition)
                
                leftPosition = moved.leftPosition
                rightPosition = moved.rightPosition
                return $0 + moved.result
                
            case 8:
                let moved = movedHand(number: 8,
                                      hand: hand,
                                      leftPosition: leftPosition,
                                      rightPosition: rightPosition)
                
                leftPosition = moved.leftPosition
                rightPosition = moved.rightPosition
                return $0 + moved.result
                
            case 0:
                let moved = movedHand(number: 0,
                                      hand: hand,
                                      leftPosition: leftPosition,
                                      rightPosition: rightPosition)
                
                leftPosition = moved.leftPosition
                rightPosition = moved.rightPosition
                return $0 + moved.result
                
            default:
                return $0
            }
        })
    }
    
    func abs(_ number: Int) -> Int {
        return number > 0 ? number : -number
    }
    
    func movedHand(number: Int,
                   hand: String,
                   leftPosition: (Int, Int),
                   rightPosition: (Int, Int)) -> (result: String,
                                                  leftPosition: (Int, Int),
                                                  rightPosition: (Int, Int)) {
        guard let movedPosition: (Int, Int) = {
            switch number {
            case 2:
                return (0, 1)
            case 5:
                return (1, 1)
            case 8:
                return (2, 1)
            case 0:
                return (3, 1)
            default:
                return nil
            }
        }()
        else {
            return (result: "", leftPosition: leftPosition, rightPosition: rightPosition)
        }
        
        let leftMove = abs(leftPosition.0 - movedPosition.0)
            + abs(leftPosition.1 - movedPosition.1)
        let rightMove = abs(rightPosition.0 - movedPosition.0)
            + abs(rightPosition.1 - movedPosition.1)
        
        if hand == "left" {
            if leftMove <= rightMove {
                return (result: "L", leftPosition: movedPosition, rightPosition: rightPosition)
            } else {
                return (result: "R", leftPosition: leftPosition, rightPosition: movedPosition)
            }
        } else {
            if rightMove <= leftMove {
                return (result: "R", leftPosition: leftPosition, rightPosition: movedPosition)
            } else {
                return (result: "L", leftPosition: movedPosition, rightPosition: rightPosition)
            }
        }
    }
}
