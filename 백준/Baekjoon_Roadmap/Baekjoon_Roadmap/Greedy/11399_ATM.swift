//
//  11399_ATM.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 4/24/24.
//

import Foundation

// 11399 ATM

func solution() {
    let peopleCount: Int = Int(readLine()!)!
    
    let needTimes: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let sortedTimes = needTimes.sorted()
    
    let result = needTimes.enumerated().reduce(0) { (totalTime, current) in
        return totalTime + sortedTimes[...current.offset].reduce(0, +)
    }
    
    print(result)
}

solution()
