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
    
    var current: Int = -1
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
        // 회의가 끝나는 시간이 같으면, 먼저 끝나는 회의가 앞으로 오도록
        if $0[1] == $1[1] {
            return $0[0] < $1[0]
        } else {
            return $0[1] < $1[1]
        }
    })
    
    // 처음에는 !(1시 ..< 4시.contains(otherStartTime)) && !(1 ..< 4시.contains(otherEndTime))
    // 위의 조건으로 비교하려고 했는데, 2%에서 실패함..(반례를 찾아야 하는데 못찾음)
    // -> 진행중인 회의 EndTime과 새로 시작하려는 회의의 StartTime이 크거나 같으면
    // 현재 회의가 끝나는 시간(current)을 새로 교체
    for duration in durations {
        if duration[0] >= current {
            current = duration[1]
            result += 1
        }
    }
    
    print(result)
}

solution()
