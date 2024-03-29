//
//  2693_N번째큰수.swift
//  Baekjoon_Roadmap
//
//  Created by 이서준 on 3/29/24.
//

import Foundation

func solution() {
    let testCaseCount = Int(readLine()!)!
    
    var nums: [[Int]] = []
    
    for _ in 0 ..< testCaseCount {
        let inputs = readLine()!.split(separator: " ").map { Int($0)! }
        nums.append(inputs.sorted(by: >))
    }
    
    nums.forEach {
        print($0[2])
    }
}

solution()
