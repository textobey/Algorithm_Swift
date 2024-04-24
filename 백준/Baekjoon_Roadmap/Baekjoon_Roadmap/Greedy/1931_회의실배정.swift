//
//  1931_회의실배정.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 4/24/24.
//

import Foundation

// 1931 회의실배정
// needFix

func solution() {
    let teamCount: Int = Int(readLine()!)!
    
    var current: [Int] = [0, 0]
    var result: Int = 0
    
    var durations: [[Int]] = []
    
//    var durations: [[Int]] = [
//        [1, 4],
//        [3, 5],
//        [0, 6],
//        [5, 7],
//        [3, 8],
//        [5, 9],
//        [6, 10],
//        [8, 11],
//        [8, 12],
//        [2, 13],
//        [2, 14]
//    ]
    
    for _ in 0 ..< teamCount {
        let duration = readLine()!.split(separator: " ").map { Int(String($0))! }
        durations.append(duration)
    }
    
    durations.sort(by: {
        if $0[1] != $1[1] {
            return $0[1] < $1[1]
        } else {
            return $0[0] < $1[0]
        }
    })
    
    //print(durations)
    
    for duration in durations {
        if isValid(newTime: duration) {
            current = duration
            result += 1
        }
    }
    
    func isValid(newTime: [Int]) -> Bool {
        let currentDuration = (current[0] ..< current[1])
        return currentDuration.contains(newTime[0]) != true && currentDuration.contains(newTime[1]) != true
    }
    
    print(result)
}

solution()
