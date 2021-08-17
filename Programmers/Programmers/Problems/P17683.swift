//
//  P17683.swift
//  Programmers
//
//  Created by 최호주 on 2021/08/17.
//

import Foundation

class P17683 {
    func solution(_ m: String, _ musicinfos: [String]) -> String {
        let m = m.replacingOccurrences(of: "C#", with: "c")
            .replacingOccurrences(of: "D#", with: "d")
            .replacingOccurrences(of: "F#", with: "f")
            .replacingOccurrences(of: "G#", with: "g")
            .replacingOccurrences(of: "A#", with: "a")
        
        var songs: [(String, Int)] = []
        
        for music in musicinfos {
            let musicInfo = music.split(separator: ",").map { String($0) }
            let song = musicInfo[3].replacingOccurrences(of: "C#", with: "c")
                .replacingOccurrences(of: "D#", with: "d")
                .replacingOccurrences(of: "F#", with: "f")
                .replacingOccurrences(of: "G#", with: "g")
                .replacingOccurrences(of: "A#", with: "a")
            
            let time = playTime(start: musicInfo[0], end: musicInfo[1])
            let repeatingCount = time / song.count
            let restCount = time % song.count
            
            let score = String(repeating: song, count: repeatingCount) + String(song.prefix(restCount))
            
            if score.contains(m) {
                songs.append((musicInfo[2], time))
            }
        }
        
        return songs.sorted(by: {
            $0.1 > $1.1
        })
        .map { $0.0 }
        .first ?? "(None)"
    }
    
    func playTime(start: String, end: String) -> Int {
        let startTime = start.split(separator: ":")
        let endTime = end.split(separator: ":")
        
        return (Int(endTime[0])! - Int(startTime[0])!) * 60
            + (Int(endTime[1])! - Int(startTime[1])!)
    }
}
