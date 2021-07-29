//
//  P72412.swift
//  Programmers
//
//  Created by 최호주 on 2021/07/29.
//

import Foundation

class P72412 {
    func solution(_ info:[String], _ query:[String]) -> [Int] {
        var answer: [Int] = []
        
        var map = Array(repeating: Array(repeating: Array(repeating: Array(repeating: [Int](),
                                                                           count: 3),
                                                          count: 3),
                                         count: 3),
                        count: 4)
        
        
        for appendant in info {
            let arr = appendant.split(separator: " ").map({ String($0) })
            let index = getIndex(lang: arr[0], job: arr[1], career: arr[2], food: arr[3])
            map[index.0][index.1][index.2][index.3].append(Int(arr[4])!)
            map[index.0][index.1][index.2][2].append(Int(arr[4])!)
            map[index.0][index.1][2][index.3].append(Int(arr[4])!)
            map[index.0][index.1][2][2].append(Int(arr[4])!)
            map[index.0][2][index.2][index.3].append(Int(arr[4])!)
            map[index.0][2][index.2][2].append(Int(arr[4])!)
            map[index.0][2][2][index.3].append(Int(arr[4])!)
            map[index.0][2][2][2].append(Int(arr[4])!)
            map[3][index.1][index.2][index.3].append(Int(arr[4])!)
            map[3][index.1][index.2][2].append(Int(arr[4])!)
            map[3][index.1][2][index.3].append(Int(arr[4])!)
            map[3][index.1][2][2].append(Int(arr[4])!)
            map[3][2][index.2][index.3].append(Int(arr[4])!)
            map[3][2][index.2][2].append(Int(arr[4])!)
            map[3][2][2][index.3].append(Int(arr[4])!)
            map[3][2][2][2].append(Int(arr[4])!)
        }
        
        (0...3).forEach { l in
            (0...2).forEach { j in
                (0...2).forEach { c in
                    (0...2).forEach { f in
                        map[l][j][c][f].sort()
                    }
                }
            }
        }
        
        for q in query {
            let arr = q.split(separator: " ").map({ String($0) })
            let index = getIndex(lang: arr[0], job: arr[2], career: arr[4], food: arr[6])
            let score = Int(arr[7])!
            
            let count = map[index.0][index.1][index.2][index.3].count - map[index.0][index.1][index.2][index.3].binarySearch(score)
            answer.append(count)
        }
        
        return answer
    }
    
    func getIndex(lang: String, job: String, career: String, food: String) -> (Int, Int, Int, Int) {
        var index: [Int] = []
        
        switch lang {
        case "cpp": index.append(0)
        case "java": index.append(1)
        case "python": index.append(2)
        case "-": index.append(3)
        default: break
        }
        
        switch job {
        case "backend": index.append(0)
        case "frontend": index.append(1)
        case "-": index.append(2)
        default: break
        }
        
        switch career {
        case "junior": index.append(0)
        case "senior": index.append(1)
        case "-": index.append(2)
        default: break
        }
        
        switch food {
        case "chicken": index.append(0)
        case "pizza": index.append(1)
        case "-": index.append(2)
        default: break
        }
        
        return (index[0], index[1], index[2], index[3])
    }
    
//    func solution(_ info:[String], _ query:[String]) -> [Int] {
//        var answer = [Int]()
//
//        var map: [String: [String: [String: [String: [Int]]]]] = [:]
//
//        for i in info {
//            let arr = i.split(separator: " ").map({String($0)})
//
//            if let languageMap = map[arr[0]] {
//                if let jobMap = languageMap[arr[1]] {
//                    if let careerMap = jobMap[arr[2]] {
//                        if let foodMap = careerMap[arr[3]] {
//                            map[arr[0]]![arr[1]]![arr[2]]![arr[3]] = foodMap + [Int(arr[4])!]
//                        } else {
//                            map[arr[0]]![arr[1]]![arr[2]]![arr[3]] = [Int(arr[4])!]
//                        }
//                    } else {
//                        map[arr[0]]![arr[1]]![arr[2]] = [arr[3]: [Int(arr[4])!]]
//                    }
//                } else {
//                    map[arr[0]]![arr[1]] = [arr[2]: [arr[3]: [Int(arr[4])!]]]
//                }
//            } else {
//                map[arr[0]] = [arr[1]: [arr[2]: [arr[3]: [Int(arr[4])!]]]]
//            }
//        }
//
//        for q in query {
//            var count = 0
//
//            let arr = q.split(separator: " ").map({String($0)})
//
//            let targetLanguages: [String] = {
//                if arr[0] == "-" {
//                    return ["cpp", "java", "python"]
//                } else {
//                    return [arr[0]]
//                }
//            }()
//            let targetJobs: [String] = {
//                if arr[2] == "-" {
//                    return ["backend", "frontend"]
//                } else {
//                    return [arr[2]]
//                }
//            }()
//            let targetCareers: [String] = {
//                if arr[4] == "-" {
//                    return ["junior", "senior"]
//                } else {
//                    return [arr[4]]
//                }
//            }()
//            let targetFoods: [String] = {
//                if arr[6] == "-" {
//                    return ["chicken", "pizza"]
//                } else {
//                    return [arr[6]]
//                }
//            }()
//            let targetScore = Int(arr[7])!
//
//            targetLanguages.forEach { l in
//                targetJobs.forEach { j in
//                    targetCareers.forEach { c in
//                        targetFoods.forEach { f in
//                            if let scores = map[l]?[j]?[c]?[f]?.sorted() {
//                                let target = scores.binarySearch(targetScore)
//                                count += (scores.count - target)
//                            }
//                        }
//                    }
//                }
//            }
//
//            answer.append(count)
//        }
//
//        return answer
//    }
}
