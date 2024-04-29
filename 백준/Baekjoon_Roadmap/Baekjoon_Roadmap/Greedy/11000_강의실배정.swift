//
//  11000_강의실배정.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 2024/04/29.
//

import Foundation

// 11000_강의실배정
// vs 1931_회의실배정과의 차이점은
// 회의실배정은 endTime순으로 정렬하여, 조건에 맞지 않는 회의는 제외시켜버렸다면
// 강의실배정은 모든 강의를 진행할 수 있어야하기 때문에, 제외하지 않고 카운팅하여 최대치를 찾는다.

func solution() {
    let classCount: Int = Int(readLine()!)!
    
    var classDurations: [(time: Int, isStartTime: Bool)] = []
//        (2, 4),
//        (1, 3),
//        (3, 5)
//    ]
    
    var currentClassCount = 0
    var result: Int = 0
    
    for _ in 0 ..< classCount {
        let duration = readLine()!.split(separator: " ").map { Int(String($0))! }
        classDurations.append((duration[0], true))
        classDurations.append((duration[1], false))
    }
    
    classDurations.sort(by: {
        if $0.time != $1.time {
            return $0.time < $1.time
        } else {
            return !$0.1
        }
    })
    
    //print(classDurations)
    
    for classDuration in classDurations {
        if classDuration.isStartTime {
            currentClassCount += 1
            result = max(result, currentClassCount)
        } else {
            currentClassCount -= 1
        }
    }
    
    print(result)
}

solution()
