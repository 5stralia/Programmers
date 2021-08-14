//
//  toss.swift
//  Programmers
//
//  Created by 최호주 on 2021/08/14.
//

import Foundation

class Vivalavida {
    
    func solution1(_ stepCounts:[Int]) -> Int {
        var answer = 0
        
        var stepCounts = stepCounts[stepCounts.startIndex..<stepCounts.endIndex]
        
        while !stepCounts.isEmpty {
            let weekSteps = stepCounts.prefix(7)
            stepCounts = stepCounts.dropFirst(7)
            
            let point = weekSteps.reduce(0, { $0 + min($1, 10000) })
            let overCount = weekSteps.filter({ $0 >= 10000 }).count
            
            if overCount >= 5 {
                answer += point + 30000
            } else if overCount >= 3 {
                answer += point + 20000
            } else if overCount >= 1 {
                answer += point + 10000
            } else {
                answer += point
            }
        }
        
        return answer
    }
    
    func solution2(_ actions:[String]) -> [String] {
        var list: [Int] = []
        var map: [Int: (String, String, Int)] = [:]
        
        for action in actions {
            let items = action.split(separator: " ").map({ String($0) })
            let id = Int(items[0])!
            let type = items[1]
            let name = items[2]
            let price = Int(items[3])!
            
            if type == "change" {
                if let item = map[id] {
                    map[id] = (item.0, name, price)
                }
            } else {
                list.append(id)
                map[id] = (type == "deposit" ? "입금" : "출금", name, price)
            }
        }
        
        var amount = 0
        var answer = [String]()
        
        for i in list {
            let item = map[i]!
            
            amount += item.0 == "입금" ? item.2 : -item.2
            
            answer.append("\(item.0) \(item.1) \(item.2)원")
        }
        answer.append("\(amount)원")
        
        return answer
    }
    
    func solution3(_ n:Int, _ keyInputs:[Int]) -> String {
        var password: [Int] = []
        
        for key in keyInputs {
            if (0...9).contains(key) {
                if password.count < n {
                    password.append(key)
                }
            } else if key == -2,
                      !password.isEmpty {
                password.removeAll()
            } else if key == -1,
                      !password.isEmpty {
                password.removeLast()
            }
        }
        
        guard password.count == n else { return "" }
        
        return password.compactMap({String($0)}).reduce("", +)
    }
    
    struct Call: Hashable {
        let url: String
        let params: Set<String>
    }
    
    func solution(_ logs: [String]) -> Int {
        var repeatingCalls = Set<Call>()
        
        let calls: [(Call, Date)] = logs.map {
            let log = $0.split(separator: " ").map({ String($0) })
            
            let dateString = log[0]
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:ss.SSS"
            let date = dateFormatter.date(from: dateString)
            
            var url = log[1].dropFirst("https://api.toss.im".count)
            
            if let paramIndex = url.firstIndex(of: "?") {
                if paramIndex == url.startIndex {
                    url = ""
                } else {
                    url = url[url.startIndex...url.index(after: paramIndex)]
                }
                
                let params = Array(log[1][paramIndex...].split(separator: "&")).map({ String($0) })
                let paramSet = Set<String>(params)
                
                return (Call(url: String(url), params: paramSet), date!)
                
            } else {
                return (Call(url: String(url), params: Set()), date!)
            }
        }
        
        var map: [Call: Date] = [:]
        for (c, date) in calls {
            if let latestDate = map[c] {
                if date.timeIntervalSince(latestDate) <= 2 {
                    repeatingCalls.insert(c)
                }
            }
            
            map[c] = date
        }
     
        return repeatingCalls.count
    }
}
